#
# Be sure to run `pod spec lint APUtils.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
Pod::Spec.new do |s|
  s.name         = "APUtils"
  s.version      = "2.0.0"
  s.summary      = "Collection of helpful categories and magik one liners for iOS/Mac OS development."
  s.homepage     = "https://github.com/andrei512/APUtils"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "andrei512" => "puni.andrei23@gmail.com" }
  s.source       = { :git => "https://github.com/andrei512/APUtils.git", :tag => "2.0.0" }
  s.platform     = :ios, '5.0'
  s.source_files = 'Classes/*.{h,m}'
  s.requires_arc = true  
  s.dependency 'MAObjCRuntime'
end
