//
//  HRLTestDoubleMatrixDataSource.h
//  HRLAlgorithms
//
//  Created by Enrique de la Torre (dev) on 18/12/2016.
//  Copyright © 2016 Enrique de la Torre. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HRLMatrixDataSource.h"

@interface HRLTestDoubleMatrixDataSource : NSObject <HRLMatrixDataSource>

- (instancetype)init;
- (instancetype)initWithRowCount:(HRLSize)rowCount
                     columnCount:(HRLSize)columnCount NS_DESIGNATED_INITIALIZER;

- (BOOL)wasVisitedValueAtRow:(HRLSize)row column:(HRLSize)column;
- (BOOL)wasVisitedClassAtRow:(HRLSize)row;

@end
