platform :ios, '9.0'
use_frameworks!

def request_pod
    pod 'Alamofire', '4.7.3'
end

workspace 'MovieGo'

target 'MovieGo' do
    request_pod
end

target 'Api' do
    project 'Api/Api.xcodeproj'
    
    target 'ApiTests' do
        inherit! :search_paths
    end
    pod 'OHHTTPStubs/Swift'
    request_pod
end

target 'Storage' do
    project 'Storage/Storage.xcodeproj'
end
