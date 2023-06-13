platform :ios, '13.0'
use_frameworks!
inhibit_all_warnings!


target 'ChallengeMeli' do
  pod 'Kingfisher'
  pod 'MBProgressHUD'
  pod 'SwiftyJSON'
end

target 'ChallengeMeliTests' do
  pod 'SwiftyJSON'
end

post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
  end
  installer.generated_projects.each do |project|
           project.targets.each do |target|
               target.build_configurations.each do |config|
                   config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
                end
           end
    end
end
