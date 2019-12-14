Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '9.1'
s.name = "AlamofireCodableJson"
s.summary = "AlamofireCodableJson will convert json returned from alamofire to codable objects."
s.requires_arc = true

# 2
s.version = "0.1.0"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "Imran Khan" => "imkhan334@gmail.com" }

# 5 - Replace this URL with your own GitHub page's URL (from the address bar)
s.homepage = "https://github.com/imkhan334/CodableJson"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/imkhan334/CodableJson.git",
:tag => "#{s.version}" }

# 7
s.frameworks = "UIKit", "Foundation"
s.dependency 'Alamofire', '~> 4.7'

# 8
s.source_files = "CodableJson/**/*.{swift}"


# 10
s.swift_version = "4.2"

end
