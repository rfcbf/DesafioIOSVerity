platform :ios, '13.0'
use_frameworks!


def default_pods
  pod 'Alamofire', '5.4.0'
  pod 'SDWebImage'
  pod 'ReachabilitySwift'
end

target 'UserGithub' do
  default_pods
end

target 'UserGithubTests' do
  inherit! :search_paths
end

target 'UserGithubUITests' do
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '5'
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
    end
  end
end
