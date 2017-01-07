# HRLAlgorithms

[![CI Status](http://img.shields.io/travis/HeartRateLearning/HRLAlgorithms.svg?style=flat)](https://travis-ci.org/HeartRateLearning/HRLAlgorithms)
[![codecov.io](https://codecov.io/github/HeartRateLearning/HRLAlgorithms/coverage.svg?branch=master)](https://codecov.io/github/HeartRateLearning/HRLAlgorithms?branch=master)
[![Version](https://img.shields.io/cocoapods/v/HRLAlgorithms.svg?style=flat)](http://cocoapods.org/pods/HRLAlgorithms)
[![Docs](https://img.shields.io/cocoapods/metrics/doc-percent/HRLAlgorithms.svg)](http://cocoadocs.org/docsets/HRLAlgorithms)

Wrapper around [LearnKit](https://github.com/mattrajca/LearnKit) to easy its integration
in Swift CocoaPods.

## Installation

HRLAlgorithms is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "HRLAlgorithms"
```

## Usage

```objc

#import "HRLMatrix.h"
#import "HRLMatrixSplitter.h"
#import "HRLSplittedMatrix.h"
#import "HRLTrainedKNNClassifier.h"
#import "HRLTrainedKNNClassifierFactory.h"
#import "HRLVector.h"

id<HRLMatrix> matrix = ...;

id<HRLMatrixSplitter> splitter = [[HRLMatrixSplitter alloc] init];
HRLSplittedMatrix *splittedMatrix = [splitter splittedMatrixWithMatrix:matrix
                                                          trainingBias:0.75f];

id<HRLTrainedKNNClassifierFactory> factory = [[HRLTrainedKNNClassifierFactory alloc] init];
id<HRLTrainedKNNClassifier> classifier = [factory makeTrainedKNNClassifierWithMatrix:splittedMatrix.trainingMatrix
                                                                      neighborsCount:5];

NSLog(@"Accuracy: %f", [classifier estimatedAccuracyWithMatrix:splittedMatrix.testMatrix]);

id<HRLVector> vector = ...;

NSLog(@"Predicted class: %lu", (unsigned long)[classifier predictedClassForVector:vector]);
```

## License

HRLAlgorithms is available under the MIT license. See the LICENSE file for more info.
