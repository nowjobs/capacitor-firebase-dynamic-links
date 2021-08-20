
  Pod::Spec.new do |s|
    s.name = 'JoinfluxCapacitorFirebaseDynamicLinks'
    s.version = '0.1'
    s.summary = 'Capacitor Plugin for Firebase Dynamic Links'
    s.license = 'MIT'
    s.homepage = 'https://github.com/joinflux/capacitor-firebase-dynamic-links.git'
    s.author = ''
    s.source = { :git => 'https://github.com/joinflux/capacitor-firebase-dynamic-links.git', :tag => s.version.to_s }
    s.source_files = 'ios/Plugin/**/*.{swift,h,m,c,cc,mm,cpp}'
    s.ios.deployment_target  = '12.0'
    s.dependency 'Capacitor'
    s.dependency 'Firebase/Analytics'
    s.dependency 'Firebase/DynamicLinks'
    s.static_framework = true
  end
