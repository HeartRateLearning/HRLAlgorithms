//
//  HRLMatrixSplitter.h
//  Pods
//
//  Created by Enrique de la Torre (dev) on 07/01/2017.
//
//

#import <Foundation/Foundation.h>

#import "HRLTypes.h"

@class HRLSplittedMatrix;

@protocol HRLMatrix;

NS_ASSUME_NONNULL_BEGIN

/**
 In most cases, once you have a dataset, you will want to split it in a training set
 (to train your classifier) and a test set (to estimate its accuracy).
 */
@protocol HRLMatrixSplitter <NSObject>

/**
 Once you have loaded the dataset into a matrix, use this method to
 obtain a training & test matrix/set.
 
 @param matrix Matrix to split into a training & test set
 @param trainingBias Percentage of the matrix to be copied into the trainingMatrix
 
 @return A 'HRLSplittedMatrix' instance
 
 @see HRLSplittedMatrix
 */
- (HRLSplittedMatrix *)splittedMatrixWithMatrix:(id<HRLMatrix>)matrix
                                   trainingBias:(HRLFloat)trainingBias;

@end

/**
 Implementation of protocol: 'HRLMatrixSplitter'
 */
@interface HRLMatrixSplitter : NSObject <HRLMatrixSplitter>
@end

NS_ASSUME_NONNULL_END
