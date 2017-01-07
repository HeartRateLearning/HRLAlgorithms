//
//  HRLMatrix.h
//  Pods
//
//  Created by Enrique de la Torre (dev) on 07/01/2017.
//
//

#import <Foundation/Foundation.h>

#import "HRLTypes.h"

NS_ASSUME_NONNULL_BEGIN

/**
 To train & test a classifier, you have to provide an instance that
 conforms to this protocol.
 */
@protocol HRLMatrix <NSObject>

/**
 @return Number of rows
 */
- (HRLSize)rowCount;

/**
 @return Number of columns
 */
- (HRLSize)columnCount;

/**
 Given a position (row, column), this method returns the value at that position.

 @param row Index of a row
 @param column Index of a column

 @return Value at position (row, column)
 */
- (HRLValue)valueAtRow:(HRLSize)row column:(HRLSize)column;

/**
 Given the index of a row, this method returns the class of that row.
 To say in another way, it returns the category or group where the row fits.

 @param row Index of a row

 @return Class (as an integer) of the row
 */
- (HRLClass)classForRow:(HRLSize)row;

@end

NS_ASSUME_NONNULL_END
