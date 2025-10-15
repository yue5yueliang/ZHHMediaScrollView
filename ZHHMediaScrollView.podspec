Pod::Spec.new do |s|
  s.name             = 'ZHHMediaScrollView'
  s.version          = '0.0.2'
  s.summary          = '一个简单易用的媒体滚动视图组件。'

  s.description      = <<-DESC
  是一个支持图片、视频等媒体内容滚动展示的视图组件，支持分页、手势操作、自定义布局等功能，适用于多种场景下的媒体浏览需求。
  DESC

  s.homepage         = 'https://github.com/yue5yueliang/ZHHMediaScrollView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '桃色三岁' => '136769890@qq.com' }
  s.source           = { :git => 'https://github.com/yue5yueliang/ZHHMediaScrollView.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '13.0'

  s.default_subspec = 'Core'
  
  s.subspec 'Core' do |core|
    core.source_files = 'ZHHMediaScrollView/Classes/**/*'
    # 如果需要，添加依赖项或资源文件
    # core.resources = ['ZHHDropdownMenu/Assets/*.xcassets']
  end
end
