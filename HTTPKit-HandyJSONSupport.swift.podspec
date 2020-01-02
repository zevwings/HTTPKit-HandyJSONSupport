Pod::Spec.new do |spec|

  spec.name             = "HTTPKit-HandyJSONSupport.swift"
  spec.module_name      = "HandyJSONSupport"
  spec.version          = "1.0.2"
  spec.summary          = "`HandyJSON` support for `HTTPKit`"
  spec.swift_version    = "5.1"

  spec.description  = <<-DESC
                HTTPKit decode Data Support - HandyJSON
                   DESC

  spec.homepage     = "https://github.com/zevwings/HTTPKit-HandyJSONSupport"
  spec.license      = "Apache"
  spec.author       = { "zevwings" => "zev.wings@gmail.com" }
  spec.platform     = :ios, "10.0"
  spec.source       = { :git => "https://github.com/zevwings/HTTPKit-HandyJSONSupport.git", :tag => "#{spec.version}" }
  spec.requires_arc = true
  
  spec.default_subspecs = "Core"

  spec.subspec "Core" do |core|
    core.source_files  = "HandyJSONSupport/HandyJSONSupport.h", "HandyJSONSupport/**/*.swift"
    core.dependency "HTTPKit.swift"
    core.dependency "HandyJSON"
  end

  spec.subspec "RxSwift" do |rx|
    rx.source_files = "RxHandyJSONSupport/RxHandyJSONSupport.h", "RxHandyJSONSupport/**/*.swift"
    rx.dependency "HTTPKit-HandyJSONSupport.swift/Core"
    rx.dependency "RxSwift"
  end

end
