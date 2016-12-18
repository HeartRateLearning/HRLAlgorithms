//
//  HRLTestDoubleVector.h
//  HRLAlgorithms
//
//  Created by Enrique de la Torre (dev) on 18/12/2016.
//  Copyright © 2016 Enrique de la Torre. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HRLVector.h"

@interface HRLTestDoubleVector : NSObject <HRLVector>

- (instancetype)init;
- (instancetype)initWithCount:(HRLSize)count NS_DESIGNATED_INITIALIZER;

- (BOOL)wasVisitedValueAtIndex:(HRLSize)index;

@end
