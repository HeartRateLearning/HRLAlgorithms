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

/**
 Initialize instance with 5 neighbors.
 */
- (instancetype)init;

/**
 Initialize a K-NN classifier with the specified number of neighbors.

 @param neighborsCount Number of neighbors to configure the K-NN classifier.
 */
- (instancetype)initWithNeighborsCount:(HRLSize)neighborsCount NS_DESIGNATED_INITIALIZER;

/**
 Before being able to make predictions, the classifer has to be trained. Call this method
 with a matrix to do so.

 @param matrix Provides a list of vectors and the output class/result for each vector
 */
- (void)trainClassifierWithMatrix:(HRLMatrix *)matrix;

/**
 Once the classifier is trained, use this method to make predictions. Pass a vector with
 the same number of values as there were columns in the training matrix and get as a result
 one of the output classes in the training matrix.

 @param vector List of features, as many as columns in the training matrix
 
 @return Class (integer) that identifies the group the vector belongs
 */
- (HRLClass)predictClassForVector:(id<HRLVector>)vector;

/**
 Once the classifier is trained, it is possible to estimate how accurate it is with this
 method. Pass a new matrix with the same dimensions as the training matrix but with
 new data.

 @param matrix Test matrix with a list of vector and corresponding classes/results for each vector
 
 @return Float value with the accuracy of the classifier
 */
- (HRLFloat)calculateClassificationAccuracyUsingMatrix:(HRLMatrix *)matrix;

@end

NS_ASSUME_NONNULL_END
