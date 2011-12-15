//
//  Operator.m
//  MathEngine
//
//  Created by Momodou Sanyang on 10/2/11.
//  Copyright 2011 Personal. All rights reserved.
//

#import "Operator.h"


@implementation Operator


@synthesize maximumOperand;
@synthesize firstMaximumOperand;
@synthesize secondMaximumOperand;
@synthesize symbolIndex;


- (id)initWithMaximumOperands:(int)newMaximumOperand withFirstMaximumOperand:(int)newFirstMaxOperand withSecondMaximumOperand:(int)newSecondMaxOperand withSymbolIndex:(int)newSymbolIndex {
    
    self = [super init];
    self.maximumOperand = newMaximumOperand;
    self.firstMaximumOperand = newFirstMaxOperand;
    self.secondMaximumOperand = newSecondMaxOperand;
    self.symbolIndex = newSymbolIndex;
    
    
    return self;    
    
}

//default initializations

- (id)init
{ 
    self = [super init];
    if (self != nil) {
        self.maximumOperand = SINGLEDIGIT;
        self.symbolIndex = ADDITION; 
    }
    
    return self;
}

@end


