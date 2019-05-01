#
# Be sure to run `pod lib lint HudView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Framework'
  s.version          = '0.1.0'
  s.summary          = 'iOS 开发包 [Swift].'
  s.description      = <<-DESC
                        iOS 开发包 [Swift].
                       DESC

  s.homepage         = 'https://github.com/BinaryArtists/swift-suite'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fallenink' => 'fengzilijie@qq.com' }
  
  s.ios.deployment_target = '8.0'
  s.source           = { :git => 'https://github.com/BinaryArtists/swift-suite.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  
  # 组件库
  s.subspec 'Component' do |component|
    component.subspec 'HudView' do |hudview|
      hudview.source_files = "Framework/Component/HudView/HudView/**/*.{h,m}"
    end
  end
end
