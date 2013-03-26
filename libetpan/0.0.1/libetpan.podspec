Pod::Spec.new do |s|
  s.name         = 'libetpan'
  s.version      = '0.0.1'
  s.summary      = 'Mail Framework for C Language.'
  s.homepage     = 'https://github.com/dinhviethoa/libetpan'
  s.license      = { :type => 'BSD', :file => 'COPYRIGHT' }
  s.author       = 'DINH Viêt Hoà'
  s.source       = { :git => 'https://github.com/dinhviethoa/libetpan.git'}
  s.ios.deployment_target = '4.0'
  s.osx.deployment_target = '10.6'
  s.source_files = '*.h', 'src/data-types/**/*.{h,c}', 'src/driver/**/*.{h,c}', 'src/engine/**/*.{h,c}', 'src/low-level/**/*.{h,c}' 
  # TODO this lib is supported also on ios but the hook needs to be adjusted
  s.platform = :osx
  s.preserve_path = "build-mac"
  s.compiler_flags = '-DHAVE_INTTYPES_H=1', '-DHAVE_CFNETWORK=1', '-DHAVE_CONFIG_H=1'
  
  def s.pre_install (pod, _)
    Dir.chdir(pod.root ) do
      `tar xzf build-mac/autogen-result.tar.gz`
      `./configure --enable-debug`
      `make stamp-prepare-target`
      `make libetpan-config.h`
      #`sed -i -e "s/#include <libetpan\/libetpan.h>/\/\/#include <libetpan\/libetpan.h>/g\" src/engine/mailprivacy.c`
      raise "[!] Failed pre install hook" unless $?.to_i == 0
    end
  end
end
