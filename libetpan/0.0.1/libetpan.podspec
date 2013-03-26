Pod::Spec.new do |s|
  s.name         = 'libetpan'
  s.version      = '0.0.1'
  s.summary      = 'Mail Framework for C Language.'
  s.homepage     = 'https://github.com/dinhviethoa/libetpan'
  s.license      = { :type => 'BSD', :file => 'COPYRIGHT' }
  s.author       = 'DINH Viêt Hoà'
  s.source       = { :git => 'https://github.com/iljaiwas/libetpan.git'}
  s.ios.deployment_target = '4.0'
  s.osx.deployment_target = '10.6'
  s.source_files = '*.h', 'include/**/*.{h}', 'src/**/*.{h,c}'
  # TODO this lib is supported also on ios but the hook needs to be adjusted
  s.platform = :osx
  s.preserve_path = "build-mac"
end
