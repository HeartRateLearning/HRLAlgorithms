//
//  HRLSplittedMatrix.h
//  Pods
//
//  Created by Enrique de la Torre (dev) on 07/01/2017.
//
//

#import <Foundation/Foundation.h>

@protocol HRLMatrix;

NS_ASSUME_NONNULL_BEGIN

/**
 Struct to store the two matrices created after splitting another matrix.
 */
@interface HRLSplittedMatrix : NSObject

@property (nonatomic, readonly) id<HRLMatrix> trainingMatrix;
@property (nonatomic, readonly) id<HRLMatrix> testMatrix;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithTrainingMatrix:(id<HRLMatrix>)trainingMatrix
                            testMatrix:(id<HRLMatrix>)testMatrix;

@end

NS_ASSUME_NONNULL_END
