Pod::Spec.new do |s|
  s.name         = "LSDObjcSugar"
  s.version      = "3.1.9"
  s.summary      = "iOS开发工具类"

  s.description  = <<-DESC 
                    可以提高开发效率的工具类
                   DESC

  s.homepage     = "https://github.com/LSDOnePiece/LSDObjcSugar"
  s.license      = "MIT"
  s.author       = { "liushuai" => "liushuai8887@126.com" }
 
  s.platform     = :ios, "9.0"
  s.ios.deployment_target = "9.0"
  s.source       = {:git => "https://github.com/LSDOnePiece/LSDObjcSugar.git", :tag => s.version.to_s}
  s.source_files  = "Sources/LSDObjcSugar/**/*.{h,m}"
  s.resources    = "Sources/LSDObjcSugar/resources/*"
  s.framework  = "UIKit"

  s.requires_arc = true
  

end
