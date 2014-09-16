Pod::Spec.new do |s|
  s.name             = "NBPickerModal"
  s.version          = "1.0.1"
  s.summary          = "A picker inside a mini modal window"
  s.homepage         = "https://github.com/needbee/nbpickermodal"
  s.license          = 'MIT'
  s.author           = { "Josh Justice" => "josh@need-bee.com" }
  s.source           = { :git => "https://github.com/needbee/nbpickermodal.git", :tag => s.version.to_s }
  s.platform         = :ios, '6.0'
  s.requires_arc     = true
  s.source_files     = 'src', 'src/**/*.{h,m}'

  s.dependency 'NBHighlightButton', '~> 1.0.1'
  s.dependency 'NBMiniModal', '~> 1.0'
  s.dependency 'UIView+PartialRoundedCorner', '~> 1.0'

  s.subspec "NBHighlightButton" do |ss|
    ss.dependency "NBHighlightButton", "~> 1.0.1"
    ss.xcconfig = { "FRAMEWORK_SEARCH_PATHS" => "$(PODS_ROOT)/NBHighlightButton"}
  end
  s.subspec "NBMiniModal" do |ss|
    ss.dependency "NBHighlightButton", "~> 1.0"
    ss.xcconfig = { "FRAMEWORK_SEARCH_PATHS" => "$(PODS_ROOT)/NBMiniModal"}
  end
  s.subspec "UIView+PartialRoundedCorner" do |ss|
    ss.dependency "UIView+PartialRoundedCorner", "~> 1.0"
    ss.xcconfig = { "FRAMEWORK_SEARCH_PATHS" => "$(PODS_ROOT)/UIView+PartialRoundedCorner"}
  end
end
