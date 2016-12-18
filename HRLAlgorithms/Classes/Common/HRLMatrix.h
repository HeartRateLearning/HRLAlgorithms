//
//  HRLMatrix.h
//  Pods
//
//  Created by Enrique de la Torre (dev) on 18/12/2016.
//
//

#import <Foundation/Foundation.h>

#import "HRLTypes.h"

@protocol HRLMatrixDataSource;

/**
 Data type of the matrices used to train & test classifiers.
 */

NS_ASSUME_NONNULL_BEGIN

@interface HRLMatrix : NSObject

/**
 Matrices are initialized as 1x1 identity matrices. Use this method to fill
 the matrix with new data.

 @param dataSource Provides the data that the matrix will use to re-shape and fill itself
 */
- (void)fillWithDataSource:(id<HRLMatrixDataSource>)dataSource;

/**
 In most cases, once you have a dataset, you will want to split it in a training set
 (to train your classifier) and a test set (to estimate its accuracy). Once you have loaded
 the dataset into a matrix, use this method to obtain a training & test matrix/set.

 @param trainingMatrix Output param with the training set
 @param testMatrix Output param with the test set
 @param trainingBias Between 0.0 and 1.0, it specifies the percentage of the matrix that has to be copied into the trainingMatrix
 */
- (void)splitIntoTrainingMatrix:(HRLMatrix *__nullable *__nonnull)trainingMatrix
                     testMatrix:(HRLMatrix *__nullable *__nonnull)testMatrix
                   trainingBias:(HRLFloat)trainingBias;

@end

NS_ASSUME_NONNULL_END
