//
//  HRLTestDoubleMatrixDataSource.m
//  HRLAlgorithms
//
//  Created by Enrique de la Torre (dev) on 18/12/2016.
//  Copyright © 2016 Enrique de la Torre. All rights reserved.
//

#import "HRLTestDoubleMatrixDataSource.h"

static const HRLSize kDefaultRowCount = 2;
static const HRLSize kDefaultColumnCount = 2;
static const HRLValue kDefaultValue = 0;
static const HRLValue kDefaultClass = 0;

@interface HRLTestDoubleMatrixDataSource()

@property (nonatomic) NSMutableArray<NSMutableArray<NSNumber *> *> *visitedValues;
@property (nonatomic) NSMutableArray<NSNumber *> *visitedClasses;

@end

@implementation HRLTestDoubleMatrixDataSource

#pragma mark - Init

- (instancetype)init
{
    return [self initWithRowCount:kDefaultRowCount columnCount:kDefaultColumnCount];
}

- (instancetype)initWithRowCount:(HRLSize)rowCount
                     columnCount:(HRLSize)columnCount
{
    self = [super init];
    if (self)
    {
        NSMutableArray<NSMutableArray<NSNumber *> *> *rows = [[NSMutableArray alloc] initWithCapacity:rowCount];
        NSMutableArray<NSNumber *> *classes = [[NSMutableArray alloc] initWithCapacity:rowCount];

        for (HRLSize i = 0; i < rowCount; i++)
        {
            NSMutableArray<NSNumber *> *columns = [[NSMutableArray alloc] initWithCapacity:columnCount];
            for (HRLSize j = 0; j < columnCount; j++)
            {
                [columns addObject:@(FALSE)];
            }

            [rows addObject:columns];

            [classes addObject:@(FALSE)];
        }

        _visitedValues = rows;
        _visitedClasses = classes;
    }

    return self;
}

#pragma mark - HRLMatrixDataSource methods

- (HRLSize)rowCount
{
    return [self.visitedValues count];
}

- (HRLSize)columnCount
{
    return [self.visitedValues.firstObject count];
}

- (HRLValue)valueAtRow:(HRLSize)row column:(HRLSize)column
{
    self.visitedValues[row][column] = @(TRUE);

    return kDefaultValue;
}

- (HRLClass)classForRow:(HRLSize)row
{
    self.visitedClasses[row] = @(TRUE);

    return kDefaultClass;
}

#pragma mark - Public methods

- (BOOL)wasVisitedValueAtRow:(HRLSize)row column:(HRLSize)column
{
    return [self.visitedValues[row][column] boolValue];
}

- (BOOL)wasVisitedClassAtRow:(HRLSize)row
{
    return [self.visitedClasses[row] boolValue];
}

@end
