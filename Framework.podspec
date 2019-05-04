#
# Be sure to run `pod lib lint HudView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Framework'
  s.version          = '0.1.12'
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
  
  # 基础扩展库
  s.subspec 'Foundation' do |foundation|
    foundation.source_files = 'Framework/Foundation/**/*.swift'
  end

  # UI扩展库
  s.subspec 'UIKit' do |uikit|
    uikit.source_files = 'Framework/UIKit/**/*.swift'
  end

  # 核心库
  s.subspec 'Core' do |core|
    # 预定义常量
    core.subspec 'Consts' do |consts|
      consts.source_files = 'Framework/Core/Consts/**/*.swift'
    end

    # 错误处理
    core.subspec 'Error' do |error|
      error.source_files = 'Framework/Core/Error/**/*.swift'
    end

    # 日志模块
    core.subspec 'Log' do |log|
      log.source_files = 'Framework/Core/Log/**/*.swift'
    end

    # KVO
    core.subspec 'Observable' do |observable|
      observable.source_files = 'Framework/Core/Observable/**/*.swift'
    end

    # 设计模式
    core.subspec 'Pattern' do |pattern|
      pattern.source_files = 'Framework/Core/Pattern/**/*.swift'
    end

    # 数据结构
    core.subspec 'Structure' do |structure|
      structure.source_files = 'Framework/Core/Structure/**/*.swift'
    end

    # 工具模块
    core.subspec 'Util' do |util|
      util.source_files = 'Framework/Core/Util/**/*.swift'
    end
  end

  # 扩展库
  s.subspec 'Extension' do |extension|
    extension.source_files = 'Framework/Extension/**/*.swift'
  end

  # 模块库
  s.subspec 'Module' do |modules|
    modules.subspec 'App' do |app|
      app.source_files = 'Framework/Module/App/**/*.swift'
    end

    modules.subspec 'PermissionScope' do |permissionscope|
      permissionscope.source_files = 'Framework/Module/PermissionScope/**/*.swift'
    end

    modules.subspec 'System' do |systems|
      systems.source_files = 'Framework/Module/System/**/*.swift'
    end
  end

  # 组件库
  s.subspec 'Component' do |component|
    component.subspec 'Core' do |core|
      core.source_files = 'Framework/Component/Core/**/*.swift'
    end

    component.subspec 'HudView' do |hudview|
      hudview.source_files = "Framework/Component/HudView/HudView/**/*.swift"
    end

    component.subspec 'TabBarController' do |tabbarcontroller|
      tabbarcontroller.source_files = 'Framework/Component/TabBarController/**/*.swift'
    end
  end
end
