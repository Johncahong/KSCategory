#
# Be sure to run `pod lib lint KSCategory.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KSCategory'
  s.version          = '0.1.0'
  s.summary          = 'A short description of KSCategory.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/johncahong/KSCategory'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'johncahong' => '305455947@qq.com' }
  s.source           = { :git => 'https://github.com/johncahong/KSCategory.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'KSCategory/Classes/*'
  s.public_header_files = 'KSCategory/Classes/KSCategory.h'

  ############
  s.subspec 'UIKit' do |ss|
    ss.subspec 'UIButton' do |button|
      button.source_files = 'KSCategory/Classes/UIKit/UIButton/**/*'
    end

    ss.subspec 'UIControl' do |control|
      control.source_files = 'KSCategory/Classes/UIKit/UIControl/**/*'
    end
  end

  # s.resource_bundles = {
  #   'KSCategory' => ['KSCategory/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
