#
# Be sure to run `pod lib lint ActionSheetSelector.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ActionSheetSelector'
  s.version          = '0.1.0'
  s.summary          = 'Dynamic height action sheet with table view.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "The library provides the ability to use a pop-up list of items with the ability to select one of them."

  s.homepage         = 'https://github.com/llkenny/ActionSheetSelector'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Maxim Doroshenko' => 'm.s.doroshenko@gmail.com' }
  s.source           = { :git => 'https://github.com/llkenny/ActionSheetSelector.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'

  s.source_files = 'ActionSheetSelector/Classes/**/*'

  s.resource_bundles = {
      'ActionSheetSelector' => ['ActionSheetSelector/Assets/*.{storyboard,xib,xcassets,json,imageset,png}']
  }

  s.swift_version = '5.0'
end
