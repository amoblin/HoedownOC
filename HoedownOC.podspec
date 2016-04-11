# coding: utf-8
Pod::Spec.new do |s|
  s.name         = "HoedownOC"
  s.version      = "3.0.7.2"
  s.summary      = "hoedown Objective-C wrapper."

  s.description  = <<-DESC
hoedown Objective-C wrapper, reference with CocoaHoedown and MacDown.
                   DESC

  s.homepage     = "https://github.com/amoblin/HoedownOC"
  s.license      = { :type => "Copyright", :text => "      Copyright 2016 marboo.io All rights reserved.\n" }

  s.author             = { "amoblin" => "amoblin@gmail.com" }
  s.social_media_url   = "https://twitter.com/amoblin"

  s.source       = {
    :git => "https://github.com/amoblin/HoedownOC.git",
    :tag => "3.0.7.2"
  }

  s.source_files  = "HoedownOC/**/*"
  s.public_header_files = "HoedownOC/**/*.h"

  s.requires_arc = true
end
