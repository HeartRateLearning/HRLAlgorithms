//
//  HRLKNNClassifier.m
//  Pods
//
//  Created by Enrique de la Torre (dev) on 16/12/2016.
//
//

#import "HRLKNNClassifier.h"

#import "HRLVector.h"
#import "LNKKNNClassifier.h"
#import "LNKMatrix.h"

#import "HRLMatrix+LNKMatrix.h"

static const LNKSize kDefaultNeighborsCount = 5;
static const LNKSize kDefaultClassesCount = 2;

@interface HRLKNNClassifier ()

@property (nonatomic) LNKSize neighborsCount;
@property (nonatomic) LNKKNNClassifier *classifier;

@end

@implementation HRLKNNClassifier

#pragma mark - Init

- (instancetype)init
{
    return [self initWithNeighborsCount:kDefaultNeighborsCount];
}

- (instancetype)initWithNeighborsCount:(HRLSize)neighborsCount
{
    self = [super init];
    if (self)
    {
        _neighborsCount = neighborsCount;

        LNKMatrix *identityMatrix = [[LNKMatrix alloc] initIdentityWithColumnCount:1];
        _classifier = [HRLKNNClassifier classifierWithMatrix:identityMatrix];
    }

    return self;
}

#pragma mark - Public methods

- (void)trainClassifierWithMatrix:(HRLMatrix *)matrix
{
    self.classifier = [HRLKNNClassifier classifierWithMatrix:matrix.learnKitMatrix];
    self.classifier.k = self.neighborsCount;
}

- (HRLClass)predictClassForVector:(id<HRLVector>)vector
{
    LNKFloat data[vector.count];
    for (LNKSize i = 0; i < vector.count; i++)
    {
        data[i] = [vector valueAtIndex:i];
    }

    LNKVector learnKitVector = LNKVectorWrapUnsafe(data, vector.count);

    LNKClass *learnKitClass = [self.classifier predictValueForFeatureVector:learnKitVector];

    return learnKitClass.unsignedIntegerValue;
}

- (HRLFloat)calculateClassificationAccuracyUsingMatrix:(HRLMatrix *)matrix
{
    return [self.classifier computeClassificationAccuracyOnMatrix:matrix.learnKitMatrix];
}

#pragma mark - Private class methods

+ (LNKKNNClassifier *)classifierWithMatrix:(LNKMatrix *)matrix
{
    // NOTICE: Although 'LNKKNNClassifier' requires param 'classes', it does not use it; that is
    //         the reason why we set it to a default value
    return [[LNKKNNClassifier alloc] initWithMatrix:matrix
                                 implementationType:LNKImplementationTypeAccelerate
                              optimizationAlgorithm:nil
                                            classes:[LNKClasses withCount:kDefaultClassesCount]];
}

@end
