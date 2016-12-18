//
//  HRLMatrixDataSource.h
//  Pods
//
//  Created by Enrique de la Torre (dev) on 18/12/2016.
//
//

#import <Foundation/Foundation.h>

#import "HRLTypes.h"

/**
 Matrices used to train & test classifier have to initialized with instances that
 conform to this protocol. These matrices configure themselves with the data they
 get from classes that implement this protocol.
 */

NS_ASSUME_NONNULL_BEGIN

@protocol HRLMatrixDataSource <NSObject>

/**
 @return Expected number of rows in the matrix
 */
- (HRLSize)rowCount;

/**
 @return Expected number of columns in the matrix
 */
- (HRLSize)columnCount;

/**
 Given a position (row, column), it returns the value for the matrix at that position.

 @param row Index of a row
 @param column Index of a column
 
 @return Value at position (row, column)
 */
- (HRLValue)valueAtRow:(HRLSize)row column:(HRLSize)column;

/**
 Given the index of a row, it returns the class of that row. To say in another way,
 it returns the category or group where the row fits.

 @param row Index of a row
 
 @return Class (as an integer) of the row
 */
- (HRLClass)classForRow:(HRLSize)row;

@end

NS_ASSUME_NONNULL_END

