//
//  HRLMatrix.m
//  Pods
//
//  Created by Enrique de la Torre (dev) on 18/12/2016.
//
//

#import "HRLMatrix.h"

#import "HRLMatrixDataSource.h"
#import "LNKMatrix.h"

@interface HRLMatrix ()

@property (nonatomic) LNKMatrix *matrix;

@end

@implementation HRLMatrix

#pragma mark - Init

- (instancetype)init
{
    LNKMatrix *identityMatrix = [[LNKMatrix alloc] initIdentityWithColumnCount:1];

    return [self initWithLearnKitMatrix:identityMatrix];
}

- (instancetype)initWithLearnKitMatrix:(LNKMatrix *)matrix
{
    self = [super init];
    if (self)
    {
        _matrix = matrix;
    }

    return self;
}

#pragma mark - HRLMatrix+LNKMatrix methods

- (LNKMatrix *)learnKitMatrix
{
    return self.matrix;
}

#pragma mark - Public methods

- (void)fillWithDataSource:(id<HRLMatrixDataSource>)dataSource
{
    LNKSize rowCount = dataSource.rowCount;
    LNKSize columnCount = dataSource.columnCount;
    BOOL (^prepareBuffers) (LNKFloat *matrix, LNKFloat *outputVector) = ^BOOL(LNKFloat *matrix, LNKFloat *outputVector) {
        for (LNKSize i = 0; i < rowCount; i++)
        {
            for (LNKSize j = 0; j < columnCount; j++)
            {
                matrix[i * columnCount + j] = [dataSource valueAtRow:i column:j];
            }

            outputVector[i] = [dataSource classForRow:i];
        }

        return TRUE;
    };

    self.matrix = [[LNKMatrix alloc] initWithRowCount:rowCount
                                          columnCount:columnCount
                                       prepareBuffers:prepareBuffers];
}

- (void)splitIntoTrainingMatrix:(HRLMatrix *__nullable *__nonnull)trainingMatrix
                     testMatrix:(HRLMatrix *__nullable *__nonnull)testMatrix
                   trainingBias:(HRLFloat)trainingBias
{
    LNKMatrix *learnKitTrainingMatrix = nil;
    LNKMatrix *learnKitTestMatrix = nil;
    [self.matrix splitIntoTrainingMatrix:&learnKitTrainingMatrix
                              testMatrix:&learnKitTestMatrix
                            trainingBias:trainingBias];

    *trainingMatrix = [[HRLMatrix alloc] initWithLearnKitMatrix:learnKitTrainingMatrix];
    *testMatrix = [[HRLMatrix alloc] initWithLearnKitMatrix:learnKitTestMatrix];
}

@end
