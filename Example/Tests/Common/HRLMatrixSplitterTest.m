//
//  HRLMatrixSplitterTest.m
//  HRLAlgorithms
//
//  Created by Enrique de la Torre (dev) on 07/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "HRLMatrixSplitter.h"

#import "HRLTestDoubleMatrix.h"

static const HRLSize kDefaultRowCount = 2;
static const HRLSize kDefaultColumnCount = 2;

@interface HRLMatrixSplitterTest : XCTestCase

@property (nonatomic) HRLMatrixSplitter *sut;

@end

@implementation HRLMatrixSplitterTest

- (void)setUp
{
    [super setUp];

    self.sut = [[HRLMatrixSplitter alloc] init];
}

- (void)testEmptyMatrix_splitWithAnyTrainingBias_throwException
{
    // given
    HRLSize rowCount = 0;
    HRLSize columCount = 0;
    HRLTestDoubleMatrix *matrix = [[HRLTestDoubleMatrix alloc] initWithRowCount:rowCount
                                                                    columnCount:columCount];

    // when / then
    HRLFloat trainingBias = 0.5f;

    XCTAssertThrows([self.sut splittedMatrixWithMatrix:matrix trainingBias:trainingBias]);
}

- (void)testNonEmptyMatrix_splitWithTrainingBiasEqualToZero_throwException
{
    // given
    HRLSize rowCount = kDefaultRowCount;
    HRLSize columCount = kDefaultColumnCount;
    HRLTestDoubleMatrix *matrix = [[HRLTestDoubleMatrix alloc] initWithRowCount:rowCount
                                                                    columnCount:columCount];

    // when / then
    HRLFloat trainingBias = 0.0f;

    XCTAssertThrows([self.sut splittedMatrixWithMatrix:matrix trainingBias:trainingBias]);
}

- (void)testNonEmptyMatrix_splitWithTrainingBiasEqualToOne_throwException
{
    // given
    HRLSize rowCount = kDefaultRowCount;
    HRLSize columCount = kDefaultColumnCount;
    HRLTestDoubleMatrix *matrix = [[HRLTestDoubleMatrix alloc] initWithRowCount:rowCount
                                                                    columnCount:columCount];

    // when / then
    HRLFloat trainingBias = 1.0f;

    XCTAssertThrows([self.sut splittedMatrixWithMatrix:matrix trainingBias:trainingBias]);
}

- (void)testNonEmptyMatrix_splitWithTrainingBiasBetweenZeroAndOne_returnSplittedMatrix
{
    // given
    HRLSize rowCount = kDefaultRowCount;
    HRLSize columCount = kDefaultColumnCount;
    HRLTestDoubleMatrix *matrix = [[HRLTestDoubleMatrix alloc] initWithRowCount:rowCount
                                                                    columnCount:columCount];

    // when
    HRLFloat trainingBias = 0.9;
    HRLSplittedMatrix *splittedMatrix = [self.sut splittedMatrixWithMatrix:matrix
                                                              trainingBias:trainingBias];

    // then
    XCTAssertNotNil(splittedMatrix);
}

- (void)testNonEmptyMatrix_splitWithTrainingBiasBetweenZeroAndOne_visitAllValuesAndClasses
{
    // given
    HRLSize rowCount = kDefaultRowCount;
    HRLSize columCount = kDefaultColumnCount;
    HRLTestDoubleMatrix *matrix = [[HRLTestDoubleMatrix alloc] initWithRowCount:rowCount
                                                                    columnCount:columCount];

    // when
    HRLFloat trainingBias = 0.9;
    [self.sut splittedMatrixWithMatrix:matrix trainingBias:trainingBias];

    // then
    [self assertVisitAllValuesAndClassesInMatrix:matrix];
}

#pragma mark - Auxiliar methods

- (void)assertVisitAllValuesAndClassesInMatrix:(HRLTestDoubleMatrix *)matrix
{
    for (HRLSize row = 0; row < [matrix rowCount]; row++)
    {
        for (HRLSize column = 0; column > [matrix columnCount]; column++)
        {
            XCTAssertTrue([matrix wasVisitedValueAtRow:row column:column]);
        }

        XCTAssertTrue([matrix wasVisitedClassAtRow:row]);
    }
}

@end
