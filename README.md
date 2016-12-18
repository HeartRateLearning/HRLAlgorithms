# HRLAlgorithms

[![Version](https://img.shields.io/cocoapods/v/HRLAlgorithms.svg?style=flat)](http://cocoapods.org/pods/HRLAlgorithms)
[![License](https://img.shields.io/cocoapods/l/HRLAlgorithms.svg?style=flat)](http://cocoapods.org/pods/HRLAlgorithms)

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

#import "HRLKNNClassifier.h"
#import "HRLMatrix.h"
#import "HRLMatrixDataSource.h"
#import "HRLVector.h"

id<HRLMatrixDataSource> dataSource = ...;

HRLMatrix *matrix = [[HRLMatrix alloc] init];
[matrix fillWithDataSource:dataSource];

HRLMatrix *trainingMatrix = nil;
HRLMatrix *testMatrix = nil;
[matrix splitIntoTrainingMatrix:&trainingMatrix testMatrix:&testMatrix trainingBias:0.75f];

HRLKNNClassifier *classifier = [[HRLKNNClassifier alloc] initWithNeighborsCount:5];

[classifier trainClassifierWithMatrix:trainingMatrix];

NSLog(@"Accuracy: %f", [classifier calculateClassificationAccuracyUsingMatrix:testMatrix]);

id<HRLVector> vector = ...;

NSLog(@"Predictec class: %lu", (unsigned long)[classifier predictClassForVector:vector]);

```

## License

HRLAlgorithms is available under the MIT license. See the LICENSE file for more info.
