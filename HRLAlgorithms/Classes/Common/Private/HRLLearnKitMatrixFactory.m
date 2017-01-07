//
//  HRLLearnKitMatrixFactory.m
//  Pods
//
//  Created by Enrique de la Torre (dev) on 07/01/2017.
//
//

#import "HRLLearnKitMatrixFactory.h"

#import "HRLMatrix.h"
#import "LNKMatrix.h"

@implementation HRLLearnKitMatrixFactory

#pragma mark - Public class methods

+ (LNKMatrix *)makeLearnKitMatrixWithMatrix:(id<HRLMatrix>)matrix
{
    if ([matrix isKindOfClass:[LNKMatrix  class]])
    {
        return matrix;
    }

    LNKSize rowCount = matrix.rowCount;
    LNKSize columnCount = matrix.columnCount;
    BOOL (^prepareBuffers) (LNKFloat *lnkMatrix, LNKFloat *classes) = ^BOOL(LNKFloat *lnkMatrix, LNKFloat *classes) {
        for (LNKSize i = 0; i < rowCount; i++)
        {
            for (LNKSize j = 0; j < columnCount; j++)
            {
                lnkMatrix[i * columnCount + j] = [matrix valueAtRow:i column:j];
            }

            classes[i] = [matrix classForRow:i];
        }

        return TRUE;
    };

    return [[LNKMatrix alloc] initWithRowCount:rowCount
                                   columnCount:columnCount
                                prepareBuffers:prepareBuffers];
    
}

@end
