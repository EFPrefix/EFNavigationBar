Pod::Spec.new do |s|
    s.name             = 'EFNavigationBar'
    s.version          = '5.1.7'
    s.summary          = 'An ordinary custom navigation bar.'
    
    s.description      = <<-DESC
    EFNavigationBar - An ordinary custom navigation bar, in Swift.
    DESC
    
    s.homepage         = 'https://github.com/EFPrefix/EFNavigationBar'
    s.screenshots      = 'https://raw.githubusercontent.com/EFPrefix/EFNavigationBar/master/Assets/EFNavigationBar.png'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'EyreFree' => 'eyrefree@eyrefree.org' }
    s.source           = { :git => 'https://github.com/EFPrefix/EFNavigationBar.git', :tag => s.version.to_s }
    s.social_media_url = 'https://twitter.com/EyreFree777'
    
    s.swift_version = '5.0'
    s.ios.deployment_target = '8.0'
    
    s.requires_arc = true
    s.source_files = 'EFNavigationBar/**/*'
    s.dependency 'EFFoundation/Device', '~> 1.3.0'
end
