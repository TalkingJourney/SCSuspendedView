#
#  Be sure to run `pod spec lint SCSuspendedView.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "SCSuspendedView"
  s.version      = "1.1"
  s.summary      = "SCSuspendedView provide a suspended view with transition animation."
  s.description  = "SCSuspendedView provide a suspended view with transition animation. It is a easy way to show a suspended view and transition animation."

  s.homepage     = "https://github.com/TalkingJourney/SCSuspendedView"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author             = { "TalkingJourney" => "https://github.com/TalkingJourney" }

  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/TalkingJourney/SCSuspendedView.git", :tag => "1.1" }

  s.source_files = "SCSuspendedView/**/*.{h,m}"
  s.public_header_files = "SCSuspendedView/**/*.h"
  s.requires_arc = true

end
