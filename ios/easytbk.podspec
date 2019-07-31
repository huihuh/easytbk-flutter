#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'easytbk'
  s.version          = '0.0.2'
  s.summary          = '基于flutter的淘宝、京东、拼多多三合一sdk'
  s.description      = <<-DESC
基于flutter的淘宝、京东、拼多多三合一sdk
                       DESC
  s.homepage         = 'http://debug.im'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Debug' => '515343908@qq.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'

  s.vendored_frameworks ="Frameworks/*.framework"
  s.resource = "Resources/*.bundle"

  s.frameworks = "MobileCoreServices","AssetsLibrary","CoreMotion","ImageIO","CoreData","CoreLocation","Security","SystemConfiguration","CoreTelephony","CFNetwork","CoreGraphics","UIKit","Foundation"

  s.libraries = "z","stdc++","sqlite3.0"

  s.ios.deployment_target = '8.0'
  s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-lObjC' }


end

