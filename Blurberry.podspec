Pod::Spec.new do |spec|
  spec.name         = "Blurberry"
  spec.version      = "0.0.1"
  spec.summary      = "Extends the functionality of the UIVisualEffectView"
  spec.homepage     = "https://github.com/unboxme/Blurberry"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Pavel Puzyrev" => "cannedapp@yahoo.com" }
  spec.source       = { :git => 'https://github.com/unboxme/Blurberry.git', :tag => spec.version }
  spec.source_files = "Sources/**/*.{swift,h,m}"

  spec.swift_version         = "5.0"
  spec.ios.deployment_target = "13.0"
end
