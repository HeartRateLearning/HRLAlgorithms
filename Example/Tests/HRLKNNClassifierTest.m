//
//  HRLKNNClassifierTest.m
//  HRLAlgorithms
//
//  Created by Enrique de la Torre (dev) on 18/12/2016.
//  Copyright © 2016 Enrique de la Torre. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "HRLKNNClassifier.h"

#import "HRLMatrix.h"
#import "HRLTestDoubleMatrixDataSource.h"
#import "HRLTestDoubleVector.h"

static const HRLSize kNeighborsCount = 5;

@interface HRLKNNClassifierTest : XCTestCase

@property (nonatomic) HRLKNNClassifier *sut;

@end

@implementation HRLKNNClassifierTest

- (void)setUp
{
    [super setUp];

    self.sut = [[HRLKNNClassifier alloc] initWithNeighborsCount:kNeighborsCount];
}

- (void)testSUTBeforeTraining_predictClassForVectorWithOnlyOneValue_doNotFail
{
    HRLSize count = 1;
    HRLTestDoubleVector *vector = [[HRLTestDoubleVector alloc] initWithCount:count];

    XCTAssertNoThrow([self.sut predictClassForVector:vector]);
}

- (void)testMatrixWithLessRowsThanNeighborsCount_trainClassifierWithMatrix_raiseException
{
    // given
    HRLSize rowCount = (kNeighborsCount - 1);
    HRLSize columnCount = 3;
    HRLMatrix *matrix = [HRLKNNClassifierTest matrixWithRowCount:rowCount columnCount:columnCount];

    // then
    XCTAssertThrows([self.sut trainClassifierWithMatrix:matrix]);
}

- (void)testMatrixWithSameRowsAsNeighborsCount_trainClassifierWithMatrix_raiseException
{
    // given
    HRLSize rowCount = kNeighborsCount;
    HRLSize columnCount = 3;
    HRLMatrix *matrix = [HRLKNNClassifierTest matrixWithRowCount:rowCount columnCount:columnCount];

    // then
    XCTAssertThrows([self.sut trainClassifierWithMatrix:matrix]);
}

- (void)testTrainedSUT_predictClassForVectorWithLessColumnsThanMatrix_raiseException
{
    // given
    HRLSize rowCount = (kNeighborsCount + 1);
    HRLSize columnCount = 3;
    HRLMatrix *matrix = [HRLKNNClassifierTest matrixWithRowCount:rowCount columnCount:columnCount];

    [self.sut trainClassifierWithMatrix:matrix];

    // when
    HRLTestDoubleVector *vector = [[HRLTestDoubleVector alloc] initWithCount:(columnCount - 1)];

    // then
    XCTAssertThrows([self.sut predictClassForVector:vector]);
}

- (void)testTrainedSUT_predictClassForVectorWithMoreColumnsThanMatrix_raiseException
{
    // given
    HRLSize rowCount = (kNeighborsCount + 1);
    HRLSize columnCount = 3;
    HRLMatrix *matrix = [HRLKNNClassifierTest matrixWithRowCount:rowCount columnCount:columnCount];

    [self.sut trainClassifierWithMatrix:matrix];

    // when
    HRLTestDoubleVector *vector = [[HRLTestDoubleVector alloc] initWithCount:(columnCount + 1)];

    // then
    XCTAssertThrows([self.sut predictClassForVector:vector]);
}

- (void)testTrainedSUT_predictClassForVector_visitAllValuesInVector
{
    // given
    HRLSize rowCount = (kNeighborsCount + 1);
    HRLSize columnCount = 3;
    HRLMatrix *matrix = [HRLKNNClassifierTest matrixWithRowCount:rowCount columnCount:columnCount];

    [self.sut trainClassifierWithMatrix:matrix];

    // when
    HRLTestDoubleVector *vector = [[HRLTestDoubleVector alloc] initWithCount:columnCount];
    [self.sut predictClassForVector:vector];

    // then
    XCTAssertTrue([vector wasVisitedValueAtIndex:0]);
    XCTAssertTrue([vector wasVisitedValueAtIndex:1]);
    XCTAssertTrue([vector wasVisitedValueAtIndex:2]);
}

# pragma mark - Auxiliar methods

+ (HRLMatrix *)matrixWithRowCount:(HRLSize)rowCount columnCount:(HRLSize)columnCount
{
    HRLTestDoubleMatrixDataSource *dataSource = [[HRLTestDoubleMatrixDataSource alloc] initWithRowCount:rowCount
                                                                                            columnCount:columnCount];

    HRLMatrix *matrix = [[HRLMatrix alloc] init];
    [matrix fillWithDataSource:dataSource];

    return matrix;
}

@end
