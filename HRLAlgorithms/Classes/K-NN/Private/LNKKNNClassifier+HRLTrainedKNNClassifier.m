//
//  LNKKNNClassifier+HRLTrainedKNNClassifier.m
//  Pods
//
//  Created by Enrique de la Torre (dev) on 07/01/2017.
//
//

#import "LNKKNNClassifier+HRLTrainedKNNClassifier.h"

#import "HRLLearnKitMatrixFactory.h"
#import "HRLVector.h"

@implementation LNKKNNClassifier (HRLTrainedKNNClassifier)

#pragma mark - HRLTrainedKNNClassifier methods

- (HRLClass)predictedClassForVector:(id<HRLVector>)vector
{
    LNKFloat data[vector.count];
    for (LNKSize i = 0; i < vector.count; i++)
    {
        data[i] = [vector valueAtIndex:i];
    }

    LNKVector learnKitVector = LNKVectorWrapUnsafe(data, vector.count);

    LNKClass *learnKitClass = [self predictValueForFeatureVector:learnKitVector];

    return learnKitClass.unsignedIntegerValue;
}

- (HRLFloat)estimatedAccuracyWithMatrix:(id<HRLMatrix>)matrix
{
    LNKMatrix *learnKitMatrix = [HRLLearnKitMatrixFactory makeLearnKitMatrixWithMatrix:matrix];

    return [self computeClassificationAccuracyOnMatrix:learnKitMatrix];
}

@end
