Pod::Spec.new do |s|
  s.name         = "LSDObjcSugar"
  s.version      = "3.0.0"
  s.summary      = "iOS开发工具类"

  s.description  = <<-DESC 
                    可以提高开发效率的工具类
                   DESC

  s.homepage     = "https://github.com/LSDOnePiece/LSDObjcSugar"
  s.license      = "MIT"
  s.author             = { "liushuai" => "liushuai8887@126.com" }
 
  s.platform     = :ios, "8.0"
  s.ios.deployment_target = "8.0"
  s.source       = {:git => "https://github.com/LSDOnePiece/LSDObjcSugar.git", :tag => s.version.to_s}
  s.source_files  = "ObjcSugar", "ObjcSugar/*.{h,m}"
  s.framework  = "UIKit"

  s.requires_arc = true
 
  s.dependency "MBProgressHUD"

end
