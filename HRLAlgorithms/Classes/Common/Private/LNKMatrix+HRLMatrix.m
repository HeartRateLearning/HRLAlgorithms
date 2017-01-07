//
//  LNKMatrix+HRLMatrix.m
//  Pods
//
//  Created by Enrique de la Torre (dev) on 07/01/2017.
//
//

#import "LNKMatrix+HRLMatrix.h"

@implementation LNKMatrix (HRLMatrix)

#pragma mark - HRLMatrix methods

- (HRLClass)classForRow:(HRLSize)row
{
    return self.outputVector[row];
}

@end
