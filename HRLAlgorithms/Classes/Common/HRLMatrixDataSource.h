//
//  HRLMatrixDataSource.h
//  Pods
//
//  Created by Enrique de la Torre (dev) on 18/12/2016.
//
//

#import <Foundation/Foundation.h>

#import "HRLTypes.h"

NS_ASSUME_NONNULL_BEGIN

@protocol HRLMatrixDataSource <NSObject>

- (HRLSize)rowCount;
- (HRLSize)columnCount;

- (HRLValue)valueAtRow:(HRLSize)row column:(HRLSize)column;
- (HRLClass)classForRow:(HRLSize)row;

@end

NS_ASSUME_NONNULL_END

