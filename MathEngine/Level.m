//
//  Level.m
//  MathEngine
//
//  Created by Momodou Sanyang on 9/25/11.
//  Copyright 2011 Personal. All rights reserved.
//

#import "Level.h"


@implementation Level



@synthesize levelNumber;
@synthesize  permittedOperators;
@synthesize  maximumOperand;
@synthesize  enableNegativeNumbers;
@synthesize  enableFractions;
@synthesize  activeOperator;

- (id)initWithLevelNumber:(int) newLevelNumber {
    
    self = [super init];
    self.levelNumber = newLevelNumber;
    
    return self;
    
}

-(void) setActiveOperator {
    
    
    int selectedIndex = arc4random() % [self.permittedOperators count];
    Operator* operator  = [self.permittedOperators objectAtIndex: selectedIndex];

    self.activeOperator = operator;
    
}



-(int) generateOperand: (int) maxOperand {
    
    //Operator* oper = [self generateOperator];

    int operand = (arc4random() % maxOperand);
    
    if (self.enableNegativeNumbers) {
        int negative = arc4random() % 2;//randomly generate number 0 or 1
        
        if(negative > 0){ //if 1, then return negative number
            operand = 0 - operand; //return the negative value of the generated operand
        }
    }
    
    return operand;
    
}


//default initializations

- (id)init
{
    self = [super init];
    if (self) {
        self.maximumOperand = SINGLEDIGIT;
        self.permittedOperators = [[NSArray alloc] initWithObjects:[Operator alloc], nil];
    }
    
    return self;
}

@end
