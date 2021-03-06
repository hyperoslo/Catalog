Pod::Spec.new do |s|
  s.name             = "Catalog"
  s.version          = "0.1.0"
  s.summary          = "Catalog"
  s.homepage         = "https://github.com/hyperoslo/Catalog"
  s.license          = {
    :type => 'MIT',
    :file => 'LICENSE.md'
  }
  s.author           = {
    "Hyper Interaktiv AS" => "ios@hyper.no"
  }
  s.source           = {
    :git => "https://github.com/hyperoslo/Catalog.git",
    :tag => s.version.to_s
  }

  s.social_media_url = 'https://twitter.com/hyperoslo'

  s.ios.deployment_target = "8.0"
  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Source/**/*'

  s.frameworks = 'Foundation'

  s.dependency 'Wall'
end
