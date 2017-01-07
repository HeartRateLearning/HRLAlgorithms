//
//  HRLTrainedKNNClassifier.h
//  Pods
//
//  Created by Enrique de la Torre (dev) on 07/01/2017.
//
//

#import <Foundation/Foundation.h>

#import "HRLTypes.h"

@protocol HRLMatrix;
@protocol HRLVector;

NS_ASSUME_NONNULL_BEGIN

/**
 Trained K-NN Classifier ready to make predictions.
 */
@protocol HRLTrainedKNNClassifier <NSObject>

/**
 Once the classifier is trained, use this method to make predictions. Pass a vector with
 the same number of values as there were columns in the training matrix and get as a result
 one of the output classes in the training matrix.

 @param vector List of features, as many as columns in the training matrix

 @return Class (integer) that identifies the group the vector belongs
 */
- (HRLClass)predictedClassForVector:(id<HRLVector>)vector;

/**
 Once the classifier is trained, it is possible to estimate its accuracy with this method.
 Pass a new matrix with the same number of columns as the training matrix and get as a
 result a float value between 0.0 & 1.0.

 @param matrix Test matrix with a list of vector and corresponding classes/results for each vector

 @return Float value with the accuracy of the classifier
 */
- (HRLFloat)estimatedAccuracyWithMatrix:(id<HRLMatrix>)matrix;

@end

NS_ASSUME_NONNULL_END
