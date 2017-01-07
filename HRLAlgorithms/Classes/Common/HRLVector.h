//
//  HRLVector.h
//  Pods
//
//  Created by Enrique de la Torre (dev) on 17/12/2016.
//
//

#import <Foundation/Foundation.h>

#import "HRLTypes.h"

NS_ASSUME_NONNULL_BEGIN

/**
 A classifier makes predictions based in the information provided by
 instances that conforms to this protocol.
 */
@protocol HRLVector <NSObject>

/**
 @return Number of values
 */
- (HRLSize)count;

/**
 Given an index, it returns the value at that position in the vector

 @parameter index Position of a value

 @return Value at position 'index'
 */
- (HRLValue)valueAtIndex:(HRLSize)index;

@end

NS_ASSUME_NONNULL_END
