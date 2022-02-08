#
# Copyright (c) 2022-present MoneySwap OU (mercuryo.io)
#

Pod::Spec.new do |s|
  s.name = "MRCRWidget"
  s.version = "0.0.1"
  s.summary = "The wrapper for Mercuryo Widget"

  s.homepage = "https://github.com/mercuryoio/Mercuryo-Widget-Wrapper-iOS"
  s.license = { :type => "MIT", :file => "LICENSE.md" }
  s.source = { :git => "https://github.com/mercuryoio/Mercuryo-Widget-Wrapper-iOS.git", :tag => s.version.to_s }
  s.authors = { "Mercuryo" => "mercuryo.io" }
  s.ios.deployment_target = "9.0"
  s.swift_versions = ["5.1", "5.2", "5.3"]

  s.source_files = "Sources/Mercuryo-Widget/**/*"

  s.frameworks = "UIKit", "Foundation", "SafariServices"
end
