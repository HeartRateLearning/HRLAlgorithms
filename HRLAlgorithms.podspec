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

  s.subspec 'K-NN' do |ks|
    ks.source_files = 'HRLAlgorithms/Classes/K-NN/**/*'

    ks.dependency 'HRLAlgorithms/Common'
    ks.dependency 'HRLAlgorithms/LearnKit/K-NN'
  end

  s.subspec 'Common' do |cs|
    cs.source_files = 'HRLAlgorithms/Classes/Common/**/*'
    cs.private_header_files = 'HRLAlgorithms/Classes/Common/HRLMatrix+LNKMatrix.h'
  end

  s.subspec 'LearnKit' do |lks|
    lks.requires_arc = false

    lks.prefix_header_file = 'HRLAlgorithms/Submodules/LearnKit/LearnKit/Prefix.pch'

    lks.subspec 'K-NN' do |ks|
      ks.source_files = 'HRLAlgorithms/Submodules/LearnKit/LearnKit/K-NN/*.{h,m}'
      ks.private_header_files = 'HRLAlgorithms/Submodules/LearnKit/LearnKit/K-NN/*.h'

      ks.dependency 'HRLAlgorithms/LearnKit/Common'
    end

    lks.subspec 'Common' do |cs|
      cs.source_files = 'HRLAlgorithms/Submodules/LearnKit/fmincg/*.{h,m}',
                        'HRLAlgorithms/Submodules/LearnKit/LearnKit/Accelerate Extensions/*.{h,m}',
                        'HRLAlgorithms/Submodules/LearnKit/LearnKit/Config.h',
                        'HRLAlgorithms/Submodules/LearnKit/LearnKit/Core/*.{h,m}',
                        'HRLAlgorithms/Submodules/LearnKit/LearnKit/Optimization/*.{h,m}',
                        'HRLAlgorithms/Submodules/LearnKit/liblbfgs/include/*.h',
                        'HRLAlgorithms/Submodules/LearnKit/liblbfgs/lib/*.{h,m}'
      cs.ios.exclude_files = 'HRLAlgorithms/Submodules/LearnKit/LearnKit/Core/LNKMatrixImages.{h,m}'
      cs.private_header_files = 'HRLAlgorithms/Submodules/LearnKit/**/*.h'
    end
  end
end

