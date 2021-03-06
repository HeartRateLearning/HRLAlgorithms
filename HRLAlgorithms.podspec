Pod::Spec.new do |s|
  s.name             = 'HRLAlgorithms'
  s.version          = '1.0.2'
  s.summary          = '(DEPRECATED) Wrapper around LearnKit.'

  s.description      = <<-DESC
(DEPRECATED) Wrapper around [LearnKit](https://github.com/mattrajca/LearnKit) to easy its integration in Swift CocoaPods.
                       DESC

  s.homepage         = 'https://github.com/HeartRateLearning/HRLAlgorithms'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Enrique de la Torre' => 'indisoluble_dev@me.com' }
  s.source           = { :git => 'https://github.com/HeartRateLearning/HRLAlgorithms.git',
                         :tag => s.version.to_s,
                         :submodules => true }

  s.platform = :ios
  s.ios.deployment_target = '8.0'

  s.prefix_header_file = 'HRLAlgorithms/Submodules/LearnKit/LearnKit/Prefix.pch'

  s.source_files = 'HRLAlgorithms/Classes/**/*.{h,m}',
                   'HRLAlgorithms/Submodules/LearnKit/fmincg/*.{h,m}',
                   'HRLAlgorithms/Submodules/LearnKit/LearnKit/Accelerate Extensions/*.{h,m}',
                   'HRLAlgorithms/Submodules/LearnKit/LearnKit/Config.h',
                   'HRLAlgorithms/Submodules/LearnKit/LearnKit/Core/*.{h,m}',
                   'HRLAlgorithms/Submodules/LearnKit/LearnKit/K-NN/*.{h,m}',
                   'HRLAlgorithms/Submodules/LearnKit/LearnKit/Optimization/*.{h,m}',
                   'HRLAlgorithms/Submodules/LearnKit/liblbfgs/include/*.h',
                   'HRLAlgorithms/Submodules/LearnKit/liblbfgs/lib/*.{h,m}'

  s.exclude_files = 'HRLAlgorithms/Submodules/LearnKit/LearnKit/Core/LNKMatrixImages.{h,m}'

  s.private_header_files = 'HRLAlgorithms/Classes/Common/Private/*.h',
                           'HRLAlgorithms/Classes/K-NN/Private/*.h',
                           'HRLAlgorithms/Submodules/LearnKit/fmincg/*.h',
                           'HRLAlgorithms/Submodules/LearnKit/LearnKit/Accelerate Extensions/*.h',
                           'HRLAlgorithms/Submodules/LearnKit/LearnKit/Config.h',
                           'HRLAlgorithms/Submodules/LearnKit/LearnKit/Core/*.h',
                           'HRLAlgorithms/Submodules/LearnKit/LearnKit/K-NN/*.h',
                           'HRLAlgorithms/Submodules/LearnKit/LearnKit/Optimization/*.h',
                           'HRLAlgorithms/Submodules/LearnKit/liblbfgs/include/*.h',
                           'HRLAlgorithms/Submodules/LearnKit/liblbfgs/lib/*.h'

  s.requires_arc = 'HRLAlgorithms/Classes/**/*.m'

end
