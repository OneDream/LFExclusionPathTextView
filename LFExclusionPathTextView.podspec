
Pod::Spec.new do |s|

  s.name         = "LFExclusionPathTextView"
  s.version      = "0.0.1"
  s.summary      = "A TextView With ExclusionPath."

  s.description  = <<-DESC
                   
                   DESC

  s.homepage     = "http://EXAMPLE/LFExclusionPathTextView"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  s.license      = "MIT (example)"
  s.author             = { "ethan.lxb" => "ethan.lxb@alibaba-inc.com" }
  s.platform     = :ios
  # s.platform     = :ios, "5.0"
  s.source       = { :git => "http://EXAMPLE/LFExclusionPathTextView.git", :tag => "0.0.1" }

  s.source_files  = "LFExclusionPathTextView", "LFExclusionPathTextView/**/*.{h,m}"

  # s.public_header_files = "Classes/**/*.h"
end
