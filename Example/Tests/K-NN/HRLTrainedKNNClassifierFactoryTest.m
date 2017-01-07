//
//  HRLTrainedKNNClassifierFactoryTest.m
//  HRLAlgorithms
//
//  Created by Enrique de la Torre (dev) on 07/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "HRLTrainedKNNClassifierFactory.h"

#import "HRLTestDoubleMatrix.h"

static const HRLSize kDefaultNeighborsCount = 2;
static const HRLSize kDefaultColumnCount = 2;

@interface HRLTrainedKNNClassifierFactoryTest : XCTestCase

@property (nonatomic) HRLTrainedKNNClassifierFactory *sut;

@end

@implementation HRLTrainedKNNClassifierFactoryTest

- (void)setUp
{
    [super setUp];

    self.sut = [[HRLTrainedKNNClassifierFactory alloc] init];
}

- (void)testNonEmptyMatrixWithLessRowsThanNeighbors_makeTrainedKNNClassifier_throwException
{
    // given
    HRLSize neighborsCount = kDefaultNeighborsCount;

    HRLSize rowCount = (neighborsCount - 1);
    HRLSize columnCount = kDefaultColumnCount;
    HRLTestDoubleMatrix *matrix = [[HRLTestDoubleMatrix alloc] initWithRowCount:rowCount
                                                                    columnCount:columnCount];

    // when / then
    XCTAssertThrows([self.sut makeTrainedKNNClassifierWithMatrix:matrix
                                                  neighborsCount:neighborsCount]);
}

- (void)testNonEmptyMatrixWithEqualRowsThanNeighbors_makeTrainedKNNClassifier_throwException
{
    // given
    HRLSize neighborsCount = kDefaultNeighborsCount;

    HRLSize rowCount = neighborsCount;
    HRLSize columnCount = kDefaultColumnCount;
    HRLTestDoubleMatrix *matrix = [[HRLTestDoubleMatrix alloc] initWithRowCount:rowCount
                                                                    columnCount:columnCount];

    // when / then
    XCTAssertThrows([self.sut makeTrainedKNNClassifierWithMatrix:matrix
                                                  neighborsCount:neighborsCount]);
}

- (void)testNonEmptyMatrixWithMoreRowsThanNeighbors_makeTrainedKNNClassifier_visitAllValuesAndClasses
{
    // given
    HRLSize neighborsCount = kDefaultColumnCount;

    HRLSize rowCount = (neighborsCount + 1);
    HRLSize columnCount = kDefaultColumnCount;
    HRLTestDoubleMatrix *matrix = [[HRLTestDoubleMatrix alloc] initWithRowCount:rowCount
                                                                    columnCount:columnCount];

    // when
    [self.sut makeTrainedKNNClassifierWithMatrix:matrix neighborsCount:neighborsCount];

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
