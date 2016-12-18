//
//  HRLMatrixTest.m
//  HRLAlgorithms
//
//  Created by Enrique de la Torre (dev) on 18/12/2016.
//  Copyright © 2016 Enrique de la Torre. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "HRLMatrix.h"

#import "HRLTestDoubleMatrixDataSource.h"

@interface HRLMatrixTest : XCTestCase

@property (nonatomic) HRLMatrix *sut;

@end

@implementation HRLMatrixTest

- (void)setUp
{
    [super setUp];

    self.sut = [[HRLMatrix alloc] init];
}

- (void)testMatrixDataSource_fillWithDataSource_visitAllValuesAndClasses
{
    // given
    HRLSize rowCount = 2;
    HRLSize columCount = 2;
    HRLTestDoubleMatrixDataSource *dataSource = [[HRLTestDoubleMatrixDataSource alloc] initWithRowCount:rowCount
                                                                                            columnCount:columCount];

    // when
    [self.sut fillWithDataSource:dataSource];

    // then
    XCTAssertTrue([dataSource wasVisitedValueAtRow:0 column:0]);
    XCTAssertTrue([dataSource wasVisitedValueAtRow:0 column:1]);
    XCTAssertTrue([dataSource wasVisitedValueAtRow:1 column:0]);
    XCTAssertTrue([dataSource wasVisitedValueAtRow:1 column:1]);
    XCTAssertTrue([dataSource wasVisitedClassAtRow:0]);
    XCTAssertTrue([dataSource wasVisitedClassAtRow:1]);
}

- (void)testSUTBeforeFilling_splitWithAnyTrainingBias_raiseException
{
    // then
    HRLMatrix *trainingMatrix = nil;
    HRLMatrix *testMatrix = nil;
    HRLFloat trainingBias = 0.5f;

    XCTAssertThrows([self.sut splitIntoTrainingMatrix:&trainingMatrix
                                           testMatrix:&testMatrix
                                         trainingBias:trainingBias]);
}

- (void)testSUTFilledWithDataSource_splitWithTrainingBiasEqualToZero_raiseException
{
    // given
    HRLSize rowCount = 2;
    HRLSize columCount = 2;
    HRLTestDoubleMatrixDataSource *dataSource = [[HRLTestDoubleMatrixDataSource alloc] initWithRowCount:rowCount
                                                                                            columnCount:columCount];

    [self.sut fillWithDataSource:dataSource];

    // then
    HRLMatrix *trainingMatrix = nil;
    HRLMatrix *testMatrix = nil;
    HRLFloat trainingBias = 0.0f;

    XCTAssertThrows([self.sut splitIntoTrainingMatrix:&trainingMatrix
                                           testMatrix:&testMatrix
                                         trainingBias:trainingBias]);
}

- (void)testSUTFilledWithDataSource_splitWithTrainingBiasEqualToOne_raiseException
{
    // given
    HRLSize rowCount = 2;
    HRLSize columCount = 2;
    HRLTestDoubleMatrixDataSource *dataSource = [[HRLTestDoubleMatrixDataSource alloc] initWithRowCount:rowCount
                                                                                            columnCount:columCount];

    [self.sut fillWithDataSource:dataSource];

    // then
    HRLMatrix *trainingMatrix = nil;
    HRLMatrix *testMatrix = nil;
    HRLFloat trainingBias = 1.0f;

    XCTAssertThrows([self.sut splitIntoTrainingMatrix:&trainingMatrix
                                           testMatrix:&testMatrix
                                         trainingBias:trainingBias]);
}

- (void)testSUTFilledWithDataSource_splitWithTrainingBiasBetweenZeroAndOne_returnMatrices
{
    // given
    HRLSize rowCount = 2;
    HRLSize columCount = 2;
    HRLTestDoubleMatrixDataSource *dataSource = [[HRLTestDoubleMatrixDataSource alloc] initWithRowCount:rowCount
                                                                                            columnCount:columCount];

    [self.sut fillWithDataSource:dataSource];

    // when
    HRLMatrix *trainingMatrix = nil;
    HRLMatrix *testMatrix = nil;
    HRLFloat trainingBias = 0.9;

    [self.sut splitIntoTrainingMatrix:&trainingMatrix
                           testMatrix:&testMatrix
                         trainingBias:trainingBias];

    // then
    XCTAssertNotNil(trainingMatrix);
    XCTAssertNotNil(testMatrix);
}

@end
