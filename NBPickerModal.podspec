Pod::Spec.new do |s|
  s.name             = "NBPickerModal"
  s.version          = "1.0.0"
  s.summary          = "A picker inside a mini modal window"
  s.homepage         = "https://github.com/needbee/nbpickermodal"
  s.license          = 'MIT'
  s.author           = { "Josh Justice" => "josh@need-bee.com" }
  s.source           = { :git => "https://github.com/needbee/nbpickermodal.git", :tag => s.version.to_s }
  s.platform         = :ios, '6.0'
  s.requires_arc     = true
  s.source_files     = 'src', 'src/**/*.{h,m}'

  s.dependency 'NBMiniModal', '~> 1.0'
end
