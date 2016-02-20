# coding: utf-8
Pod::Spec.new do |s|
  s.name         = "HoedownOC"
  s.version      = "3.0.7.1"
  s.summary      = "A short description of HoedownOC."

  s.description  = <<-DESC
hoedown objective-c wrapper
                   DESC

  s.homepage     = "https://github.com/amoblin/HoedownOC"
  s.license      = "MIT"
  s.author             = { "amoblin" => "amoblin@gmail.com" }
  s.social_media_url   = "http://twitter.com/amoblin"

  s.source       = { :git => "https://github.com/amoblin/HoedownOC.git", :tag => "3.0.7.1" }

  s.source_files  = "HoedownOC", "HoedownOC/**/*.{h,m}"
  s.public_header_files = "HoedownOC/**/*.h"

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }

end