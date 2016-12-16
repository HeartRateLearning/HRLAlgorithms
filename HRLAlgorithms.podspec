Pod::Spec.new do |s|
  s.name             = 'HRLAlgorithms'
  s.version          = '0.1.0'
  s.summary          = 'Wrapper around LearnKit.'

  s.description      = <<-DESC
Wrapper around [LearnKit](https://github.com/mattrajca/LearnKit) to easy its integration with Swift code.
                       DESC

  s.homepage         = 'https://github.com/HeartRateLearning/HRLAlgorithms'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Enrique de la Torre' => 'indisoluble_dev@me.com' }
  s.source           = { :git => 'https://github.com/HeartRateLearning/HRLAlgorithms.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'HRLAlgorithms/Classes/**/*'
  
  # s.public_header_files = 'Pod/Classes/**/*.h'
end
