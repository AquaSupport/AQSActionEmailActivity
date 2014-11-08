Pod::Spec.new do |s|
  s.name         = "AQSActionEmailActivity"
  s.version      = "0.1.0"
  s.summary      = "[iOS] UIActivity Class for Email that appears in Action, not Share"
  s.homepage     = "https://github.com/AquaSupport/AQSActionEmailActivity"
  s.license      = "MIT"
  s.author       = { "kaiinui" => "lied.der.optik@gmail.com" }
  s.source       = { :git => "https://github.com/AquaSupport/AQSActionEmailActivity.git", :tag => "v0.1.0" }
  s.source_files  = "AQSActionEmailActivity/Classes/**/*.{h,m}"
  s.resources = ["AQSActionEmailActivity/Classes/**/*.png"]
  s.requires_arc = true
  s.platform = "ios", '7.0'

  s.frameworks = "MessageUI"
end