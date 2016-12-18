//
//  HRLKNNClassifier.h
//  Pods
//
//  Created by Enrique de la Torre (dev) on 16/12/2016.
//
//

#import <Foundation/Foundation.h>

#import "HRLTypes.h"

@class HRLMatrix;

@protocol HRLVector;

NS_ASSUME_NONNULL_BEGIN

@interface HRLKNNClassifier : NSObject

- (instancetype)init;
- (instancetype)initWithNeighborsCount:(HRLSize)neighborsCount NS_DESIGNATED_INITIALIZER;

- (void)trainClassifierWithMatrix:(HRLMatrix *)matrix;
- (HRLClass)predictClassForVector:(id<HRLVector>)vector;

- (HRLFloat)calculateClassificationAccuracyUsingMatrix:(HRLMatrix *)matrix;

@end

NS_ASSUME_NONNULL_END
