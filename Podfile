platform :ios, '9.0'
use_frameworks!

def api_pod
    pod 'Alamofire', '4.7.3'
end

workspace 'MovieGo'

target 'MovieGo' do
    api_pod
end

target 'Api' do
    api_pod
    project 'Api/Api.xcodeproj'
end

target 'Storage' do
    project 'Storage/Storage.xcodeproj'
end
