//
//  Response+HandyJSON.swift
//
//  Created by zevwings on 2019/9/10.
//  Copyright © 2019 zevwings. All rights reserved.
//

import Foundation
import HandyJSON
import HTTPKit

public extension Response {

    func mapObject<T: HandyJSON>(
        _ type: T.Type,
        atKeyPath keyPath: String? = nil
    ) throws -> T {

        guard let json = try value(for: keyPath) as? [String: Any] else {
            let error = HTTPError.cast(
                value: data,
                targetType: [[String: Any]].self,
                request: request,
                response: response
            )
            HTTPLogger.failure(.verbose, error: error)
            throw error
        }

        guard let result = T.deserialize(from: json) else {
            let error = HTTPError.cast(
                value: json,
                targetType: T.self,
                request: request,
                response: response
            )
            HTTPLogger.failure(.verbose, error: error)
            throw error
        }
        HTTPLogger.response(.verbose, targetType: T.self, request: request, extra: result)
        return result
    }

    func mapArray<T: HandyJSON>(
        _ type: T.Type,
        atKeyPath keyPath: String? = nil
    ) throws -> [T] {

        guard let array = try value(for: keyPath) as? [[String: Any]] else {
            let error = HTTPError.cast(
                value: data,
                targetType: [[String: Any]].self,
                request: request,
                response: response
            )
            HTTPLogger.failure(.verbose, error: error)
            throw error
        }

        guard let result = [T].deserialize(from: array) as? [T] else {
            let error = HTTPError.cast(
                value: array,
                targetType: [T].self,
                request: request,
                response: response
            )
            HTTPLogger.failure(.verbose, error: error)
            throw error
        }
        HTTPLogger.response(.verbose, targetType: [T].self, request: request, extra: result)
        return result
    }

    func value(for keyPath: String?) throws -> Any? {
        if let keyPath = keyPath {
            return (try mapJSON(logVerbose: false) as? NSDictionary)?.value(forKeyPath: keyPath)
        } else {
            return try mapJSON(logVerbose: false)
        }
    }
}
