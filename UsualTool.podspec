#
# Be sure to run `pod lib lint UsualTool.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'UsualTool'
  s.version          = '0.0.1'
  s.summary          = 'A short description of UsualTool.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/葛高召/UsualTool'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '葛高召' => 'gaozhao.ge@huolala.cn' }
  s.source           = { :git => 'git@github.com:GE-GAO-ZHAO/UsualTool.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  case ENV['Flag']
  when 'rel'
    puts "正式安装-二进制安装"
    s.source_files = 'UsualTool/Classes/Framework/*'
  else
    puts "非正式安装-源代码安装"
    s.source_files = 'UsualTool/Classes/Source/**/*'
  end
  
#  if ENV['Flag'] then
#    puts "正式安装-二进制";
#    s.source_files = 'UsualTool/Classes/Framework/*'
#  else
#    puts "非正式安装-源代码";
#    s.source_files = 'UsualTool/Classes/Source/**/*'
#  end
  
  #s.dependency 'SSZipArchive'
  
  # s.resource_bundles = {
  #   'UsualTool' => ['UsualTool/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
