platform :ios, '12.0'

inhibit_all_warnings!

target 'DNDRx8' do

	use_frameworks!

	pod 'SnapKit', '~> 5.6.0'
	pod 'RxSwift', '6.5.0'
	pod 'RxCocoa', '6.5.0'
	pod 'Then'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
    end
  end
end
