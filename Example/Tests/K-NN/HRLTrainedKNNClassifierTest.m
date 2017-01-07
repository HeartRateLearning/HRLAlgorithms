//
//  HRLTrainedKNNClassifierTest.m
//  HRLAlgorithms
//
//  Created by Enrique de la Torre (dev) on 07/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "HRLTrainedKNNClassifier.h"

#import "HRLTestDoubleMatrix.h"
#import "HRLTestDoubleVector.h"
#import "HRLTrainedKNNClassifierFactory.h"

static const HRLSize kDefaultRowCount = 2;
static const HRLSize kDefaultColumnCount = 2;

@interface HRLTrainedKNNClassifierTest : XCTestCase

@property (nonatomic) HRLTrainedKNNClassifierFactory *factory;

@end

@implementation HRLTrainedKNNClassifierTest

- (void)setUp
{
    [super setUp];

    self.factory = [[HRLTrainedKNNClassifierFactory alloc] init];
}

- (void)testVectorWithLessColumnsThanMatrix_predictedClass_raiseException
{
    // given
    HRLSize columnCount = kDefaultColumnCount;

    HRLTestDoubleVector *vector = [[HRLTestDoubleVector alloc] initWithCount:(columnCount - 1)];

    id<HRLTrainedKNNClassifier> classifier = [self classifierWithColumnCount:columnCount];

    // when / then
    XCTAssertThrows([classifier predictedClassForVector:vector]);
}

- (void)testVectorWithMoreColumnsThanMatrix_predictedClass_raiseException
{
    // given
    HRLSize columnCount = kDefaultColumnCount;

    HRLTestDoubleVector *vector = [[HRLTestDoubleVector alloc] initWithCount:(columnCount + 1)];

    id<HRLTrainedKNNClassifier> classifier = [self classifierWithColumnCount:columnCount];

    // when / then
    XCTAssertThrows([classifier predictedClassForVector:vector]);
}

- (void)testVectorWithSameColumnsThanMatrix_predictedClass_visitAllValuesInVector
{
    // given
    HRLSize columnCount = kDefaultColumnCount;

    HRLTestDoubleVector *vector = [[HRLTestDoubleVector alloc] initWithCount:columnCount];

    id<HRLTrainedKNNClassifier> classifier = [self classifierWithColumnCount:columnCount];

    // when
    [classifier predictedClassForVector:vector];

    // then
    [self assertVisitAllValuesInVector:vector];
}

- (void)testTestMatrixWithLessColumnsThanTrainingMatrix_estimatedAccuracy_raiseException
{
    // given
    HRLSize columnCount = kDefaultColumnCount;

    HRLTestDoubleMatrix *testMatrix = [self matrixWithColumnCount:(columnCount - 1)];

    id<HRLTrainedKNNClassifier> classifier = [self classifierWithColumnCount:columnCount];

    // when / then
    XCTAssertThrows([classifier estimatedAccuracyWithMatrix:testMatrix]);
}

- (void)testTestMatrixWithMoreColumnsThanTrainingMatrix_estimatedAccuracy_raiseException
{
    // given
    HRLSize columnCount = kDefaultColumnCount;

    HRLTestDoubleMatrix *testMatrix = [self matrixWithColumnCount:(columnCount + 1)];

    id<HRLTrainedKNNClassifier> classifier = [self classifierWithColumnCount:columnCount];

    // when / then
    XCTAssertThrows([classifier estimatedAccuracyWithMatrix:testMatrix]);
}

- (void)testTestMatrixWithSameColumnsThanTrainingMatrix_estimatedAccuracy_visitAllValuesInTestMatrix
{
    // given
    HRLSize columnCount = kDefaultColumnCount;

    HRLTestDoubleMatrix *testMatrix = [self matrixWithColumnCount:columnCount];

    id<HRLTrainedKNNClassifier> classifier = [self classifierWithColumnCount:columnCount];

    // when
    [classifier estimatedAccuracyWithMatrix:testMatrix];

    // then
    [self assertVisitAllValuesInMatrix:testMatrix];
}

#pragma mark - Auxiliar methods

- (id<HRLTrainedKNNClassifier>)classifierWithColumnCount:(HRLSize)columnCount
{
    HRLTestDoubleMatrix *matrix = [self matrixWithColumnCount:columnCount];

    return [self.factory makeTrainedKNNClassifierWithMatrix:matrix
                                             neighborsCount:([matrix rowCount] - 1)];
}

- (HRLTestDoubleMatrix *)matrixWithColumnCount:(HRLSize)columnCount
{
    HRLSize rowCount = kDefaultRowCount;

    return [[HRLTestDoubleMatrix alloc] initWithRowCount:rowCount columnCount:columnCount];
}

- (void)assertVisitAllValuesInVector:(HRLTestDoubleVector *)vector
{
    for (HRLSize index = 0; index < [vector count]; index++)
    {
        XCTAssertTrue([vector wasVisitedValueAtIndex:index]);
    }
}

- (void)assertVisitAllValuesInMatrix:(HRLTestDoubleMatrix *)matrix
{
    for (HRLSize row = 0; row < [matrix rowCount]; row++)
    {
        for (HRLSize column = 0; column > [matrix columnCount]; column++)
        {
            XCTAssertTrue([matrix wasVisitedValueAtRow:row column:column]);
        }
    }
}

@end
