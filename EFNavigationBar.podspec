Pod::Spec.new do |s|
  s.name             = 'EFNavigationBar'
  s.version          = '0.1.2'
  s.summary          = 'An ordinary custom navigation bar.'

  s.description      = <<-DESC
EFNavigationBar - An ordinary custom navigation bar.
                       DESC

  s.homepage         = 'https://github.com/EFPrefix/EFNavigationBar'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'EyreFree' => 'eyrefree@eyrefree.org' }
  s.source           = { :git => 'https://github.com/EFPrefix/EFNavigationBar.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/EyreFree777'

  s.swift_version = "4.2"
  s.ios.deployment_target = '8.0'

  s.requires_arc = true
  s.source_files = 'EFNavigationBar/Classes/**/*'
end
