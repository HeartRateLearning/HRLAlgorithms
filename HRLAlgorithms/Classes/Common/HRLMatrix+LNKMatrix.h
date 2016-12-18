//
//  HRLMatrix+LNKMatrix.h
//  Pods
//
//  Created by Enrique de la Torre (dev) on 18/12/2016.
//
//

#import "HRLMatrix.h"

@class LNKMatrix;

NS_ASSUME_NONNULL_BEGIN

@interface HRLMatrix (LNKMatrix)

- (LNKMatrix *)learnKitMatrix NS_RETURNS_INNER_POINTER;

@end

NS_ASSUME_NONNULL_END
