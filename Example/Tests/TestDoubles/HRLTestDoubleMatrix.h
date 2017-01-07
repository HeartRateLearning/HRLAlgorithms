//
//  HRLTestDoubleMatrix.h
//  HRLAlgorithms
//
//  Created by Enrique de la Torre (dev) on 07/01/2017.
//  Copyright © 2017 Enrique de la Torre. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HRLMatrix.h"

@interface HRLTestDoubleMatrix : NSObject <HRLMatrix>

- (instancetype)init;
- (instancetype)initWithRowCount:(HRLSize)rowCount
                     columnCount:(HRLSize)columnCount NS_DESIGNATED_INITIALIZER;

- (BOOL)wasVisitedValueAtRow:(HRLSize)row column:(HRLSize)column;
- (BOOL)wasVisitedClassAtRow:(HRLSize)row;

@end
