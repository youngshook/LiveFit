platform :ios, '7.0'
pod 'RMPickerViewController', '~> 1.2.0'
pod 'BlocksKit', '2.2.0'
pod 'UMeng', '2.2.1'
pod 'SDWebImage-ProgressView', '0.4.0'
pod 'EAIntroView', '2.6.0'
pod 'AFNetworking', '2.3.1'
pod 'Parse', '~> 1.2.20'
pod 'FLEX', '1.1.1'
pod 'TAPKeyboardPop', '0.1.2'
pod 'YSCategorys', '1.0.7'
pod 'AMBTableViewController', '1.1.0'
pod 'RESideMenu', '4.0.7'
pod "APLKeyboardControls"
post_install do |installer|
  installer.project.targets.each do |target|
    target.build_configurations.each do |configuration|
      target.build_settings(configuration.name)['ARCHS'] = 'armv7 armv7s'
    end
  end
end