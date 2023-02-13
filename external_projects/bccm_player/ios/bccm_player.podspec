#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint bccm_player.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'bccm_player'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter plugin project.'
  s.description      = <<-DESC
A new Flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
  s.static_framework = true
  s.dependency 'YouboraLib', '6.6.22'
  s.dependency 'YouboraAVPlayerAdapter', '6.6.8'
  

  
  s.ios.vendored_frameworks = 'Frameworks/GoogleCast.xcframework'
  #s.dependency 'Protobuf', '~> 3.13'
  #s.dependency 'google-cast-sdk-no-bluetooth', '~> 4.7.0'

end

