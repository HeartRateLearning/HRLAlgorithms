//
//  HRLMatrix.h
//  Pods
//
//  Created by Enrique de la Torre (dev) on 18/12/2016.
//
//

#import <Foundation/Foundation.h>

#import "HRLTypes.h"

@protocol HRLMatrixDataSource;

NS_ASSUME_NONNULL_BEGIN

@interface HRLMatrix : NSObject

- (void)fillWithDataSource:(id<HRLMatrixDataSource>)dataSource;
- (void)splitIntoTrainingMatrix:(HRLMatrix *__nullable *__nonnull)trainingMatrix
                     testMatrix:(HRLMatrix *__nullable *__nonnull)testMatrix
                   trainingBias:(HRLFloat)trainingBias;

@end

NS_ASSUME_NONNULL_END
