# ignore all warnings from all pods
inhibit_all_warnings!
use_frameworks!

platform :ios, '10.0'

def all_pods
  pod 'Typhoon'
  pod 'AFNetworking'
end

target 'FloppyPillow' do
  all_pods
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
