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

@protocol HRLVector <NSObject>

- (HRLSize)count;
- (HRLValue)valueAtIndex:(HRLSize)index;

@end

NS_ASSUME_NONNULL_END
