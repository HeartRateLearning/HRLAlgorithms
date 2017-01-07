//
//  HRLLearnKitMatrixFactory.h
//  Pods
//
//  Created by Enrique de la Torre (dev) on 07/01/2017.
//
//

#import <Foundation/Foundation.h>

@class LNKMatrix;

@protocol HRLMatrix;

NS_ASSUME_NONNULL_BEGIN

@interface HRLLearnKitMatrixFactory : NSObject

+ (LNKMatrix *)makeLearnKitMatrixWithMatrix:(id<HRLMatrix>)matrix;

@end

NS_ASSUME_NONNULL_END
