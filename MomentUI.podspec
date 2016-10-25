Pod::Spec.new do |s|
  s.name             = "MomentUI"
  s.version          = "1.3"
  s.summary          = "MomentCam.io UI framework"
  s.homepage         = "https://github.com/nunojfg/MomentUI"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { "NunoGoncalves" => "nunojfg@gmail.com" }
  s.source           = { :git => "https://github.com/nunojfg/MomentUI.git", :tag => s.version }
  s.social_media_url = 'https://twitter.com/nunojfg'

  s.platform     = :ios, '9.0'

  s.source_files = 'Classes'

  s.dependency 'GPUImage'
end
