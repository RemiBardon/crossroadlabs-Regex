Pod::Spec.new do |s|
  s.name = 'CrossroadRegex'
  s.version = '1.2.0'
  s.license = { :type => 'Apache 2.0', :file => 'LICENSE' }
  s.summary = 'Easy, portable and feature-rich Regular Expressions for Swift'
  s.homepage = 'https://github.com/RemiBardon/crossroadlabs-Regex'
  s.social_media_url = 'https://github.com/RemiBardon/crossroadlabs-Regex'
  s.authors = { 'Daniel Leping' => 'daniel@crossroadlabs.xyz' }
  s.source = { :git => 'https://github.com/RemiBardon/crossroadlabs-Regex.git', :tag => "#{s.version}" }
  s.module_name = 'RegExp'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.source_files = 'Sources/RegExp/*.swift'

  s.requires_arc = true
end
