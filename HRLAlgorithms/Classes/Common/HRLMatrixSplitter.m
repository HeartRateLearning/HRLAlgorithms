//
//  HRLMatrixSplitter.m
//  Pods
//
//  Created by Enrique de la Torre (dev) on 07/01/2017.
//
//

#import "HRLMatrixSplitter.h"

#import "HRLLearnKitMatrixFactory.h"
#import "HRLSplittedMatrix.h"

#import "LNKMatrix+HRLMatrix.h"

@implementation HRLMatrixSplitter

# pragma mark - HRLMatrixSplitter methods

- (HRLSplittedMatrix *)splittedMatrixWithMatrix:(id<HRLMatrix>)matrix
                                   trainingBias:(HRLFloat)trainingBias
{
    LNKMatrix *learnKitMatrix = [HRLLearnKitMatrixFactory makeLearnKitMatrixWithMatrix:matrix];

    LNKMatrix *learnKitTrainingMatrix = nil;
    LNKMatrix *learnKitTestMatrix = nil;
    [learnKitMatrix splitIntoTrainingMatrix:&learnKitTrainingMatrix
                                 testMatrix:&learnKitTestMatrix
                               trainingBias:trainingBias];

    return [[HRLSplittedMatrix alloc] initWithTrainingMatrix:learnKitTrainingMatrix
                                                  testMatrix:learnKitTestMatrix];
}

@end
