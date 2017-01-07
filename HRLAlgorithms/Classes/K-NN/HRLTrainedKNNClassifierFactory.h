//
//  HRLTrainedKNNClassifierFactory.h
//  Pods
//
//  Created by Enrique de la Torre (dev) on 07/01/2017.
//
//

#import <Foundation/Foundation.h>

#import "HRLTypes.h"

@protocol HRLMatrix;
@protocol HRLTrainedKNNClassifier;

NS_ASSUME_NONNULL_BEGIN

/**
 Factory to create trained K-NN classifiers.
 */
@protocol HRLTrainedKNNClassifierFactory <NSObject>

/**
 Create a new K-NN classifier already trained and ready to make predictions.

 @param matrix Provides a list of vectors and the output class/result for each vector

 @return A new K-NN classifier trained with the specified matrix (and 5 neighbors)
 */
- (id<HRLTrainedKNNClassifier>)makeTrainedKNNClassifierWithMatrix:(id<HRLMatrix>)matrix;

/**
 Create a new K-NN classifier already trained and ready to make predictions.

 @param matrix Provides a list of vectors and the output class/result for each vector
 @param neighborsCount Number of neighbors to configure the K-NN classifier

 @return A new K-NN classifier trained with the specified matrix and number of neighbors
 */
- (id<HRLTrainedKNNClassifier>)makeTrainedKNNClassifierWithMatrix:(id<HRLMatrix>)matrix
                                                   neighborsCount:(HRLSize)neighborsCount;

@end

/**
 Implementation of protocol: 'HRLTrainedKNNClassifierFactory'
 */
@interface HRLTrainedKNNClassifierFactory : NSObject <HRLTrainedKNNClassifierFactory>
@end

NS_ASSUME_NONNULL_END
