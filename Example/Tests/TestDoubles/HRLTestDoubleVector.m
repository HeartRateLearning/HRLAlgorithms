//
//  HRLTestDoubleVector.m
//  HRLAlgorithms
//
//  Created by Enrique de la Torre (dev) on 18/12/2016.
//  Copyright © 2016 Enrique de la Torre. All rights reserved.
//

#import "HRLTestDoubleVector.h"

static const HRLSize kDefaultCount = 2;
static const HRLValue kDefaultValue = 0;

@interface HRLTestDoubleVector ()

@property (nonatomic) NSMutableArray<NSNumber *> *visitedValues;

@end

@implementation HRLTestDoubleVector

#pragma mark - Init

- (instancetype)init
{
    return [self initWithCount:kDefaultCount];
}

- (instancetype)initWithCount:(HRLSize)count
{
    self = [super init];
    if (self)
    {
        _visitedValues = [[NSMutableArray alloc] initWithCapacity:count];
        for (HRLSize i = 0; i < count; i++)
        {
            [_visitedValues addObject:@(FALSE)];
        }
    }

    return self;
}

#pragma mark - HRLVector methods

- (HRLSize)count
{
    return [self.visitedValues count];
}

- (HRLValue)valueAtIndex:(HRLSize)index
{
    self.visitedValues[index] = @(TRUE);

    return kDefaultValue;
}

#pragma mark - Public methods

- (BOOL)wasVisitedValueAtIndex:(HRLSize)index
{
    return [self.visitedValues[index] boolValue];
}

@end
