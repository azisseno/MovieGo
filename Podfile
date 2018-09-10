platform :ios, '9.0'
use_frameworks!

def api_pod
    pod 'Alamofire', '4.7.3'
    pod 'OHHTTPStubs/Swift'
end

workspace 'MovieGo'

target 'MovieGo' do
    api_pod
    pod 'Kingfisher', '~> 4.0'
end

target 'Api' do
    project 'Api/Api.xcodeproj'
    
    target 'ApiTests' do
        inherit! :search_paths
    end
    api_pod
end

target 'Storage' do
    project 'Storage/Storage.xcodeproj'
end
