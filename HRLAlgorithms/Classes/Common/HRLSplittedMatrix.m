//
//  HRLSplittedMatrix.m
//  Pods
//
//  Created by Enrique de la Torre (dev) on 07/01/2017.
//
//

#import "HRLSplittedMatrix.h"

@implementation HRLSplittedMatrix

#pragma mark - Init

- (instancetype)init
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:@"-init is not a valid initializer"
                                 userInfo:nil];
}

- (instancetype)initWithTrainingMatrix:(id<HRLMatrix>)trainingMatrix
                            testMatrix:(id<HRLMatrix>)testMatrix
{
    self = [super init];
    if (self)
    {
        _trainingMatrix = trainingMatrix;
        _testMatrix = testMatrix;
    }

    return self;
}

@end
