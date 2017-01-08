//
//  HRLTrainedKNNClassifierFactory.m
//  Pods
//
//  Created by Enrique de la Torre (dev) on 07/01/2017.
//
//

#import "HRLTrainedKNNClassifierFactory.h"

#import "HRLLearnKitMatrixFactory.h"
#import "LNKKNNClassifier+HRLTrainedKNNClassifier.h"

static const LNKSize kDefaultNeighborsCount = 5;
static const LNKSize kDefaultClassesCount = 2;

@implementation HRLTrainedKNNClassifierFactory

#pragma mark - HRLTrainedKNNClassifierFactory methods

- (id<HRLTrainedKNNClassifier>)makeTrainedKNNClassifierWithMatrix:(id<HRLMatrix>)matrix
{
    return [self makeTrainedKNNClassifierWithMatrix:matrix
                                     neighborsCount:kDefaultNeighborsCount];
}

- (id<HRLTrainedKNNClassifier>)makeTrainedKNNClassifierWithMatrix:(id<HRLMatrix>)matrix
                                                   neighborsCount:(HRLSize)neighborsCount
{
    LNKMatrix *learnKitMatrix = [HRLLearnKitMatrixFactory makeLearnKitMatrixWithMatrix:matrix];
    LNKImplementationType implementation = LNKImplementationTypeAccelerate;

    // NOTICE: Although 'LNKKNNClassifier' requires param 'classes', it does not use it; that is
    //         why we set it to a default value
    LNKClasses *classes = [LNKClasses withCount:kDefaultClassesCount];

    LNKKNNClassifier *classifier = [[LNKKNNClassifier alloc] initWithMatrix:learnKitMatrix
                                                         implementationType:implementation
                                                      optimizationAlgorithm:nil
                                                                    classes:classes];
    classifier.k = neighborsCount;

    return classifier;
}

@end
