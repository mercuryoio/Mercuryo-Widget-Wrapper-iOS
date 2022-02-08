#
# Copyright (c) 2022-present MoneySwap OU (mercuryo.io)
#

Pod::Spec.new do |s|
  s.name = "MRCRWidget"
  s.version = "1.0.0"
  s.summary = "Mercuryo Widget Wrapper is a lightweight library for developers of apps who embed Mercuryo Widget into their mobile UX"

  s.homepage = "https://github.com/mercuryoio/Mercuryo-Widget-Wrapper-iOS"
  s.license = { :type => "MIT", :file => "LICENSE.md" }
  s.source = { :git => "https://github.com/mercuryoio/Mercuryo-Widget-Wrapper-iOS.git", :tag => s.version.to_s }
  s.authors = { "Mercuryo" => "mercuryo.io" }
  s.ios.deployment_target = "9.0"
  s.swift_versions = ["5.1", "5.2", "5.3"]

  s.source_files = "Sources/**/*"

  s.frameworks = "UIKit", "Foundation", "SafariServices"
end
