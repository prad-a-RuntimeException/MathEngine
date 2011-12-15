//
//  LevelCreator.m
//  MathEngine
//
//  Created by Pradheep Raju on 9/18/11.
//  Copyright 2011 Personal. All rights reserved.
//

#import "LevelManager.h"


@implementation LevelManager

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}



-(Level*) createLevel:(int) levelNumber {
        
    if(levelNumber > maximumLevel) {
        
        levelNumber = maximumLevel; //ensure that the levelnumber does not exceed the maximum.
    }    
    
       Level* level = [[Level alloc] initWithLevelNumber:levelNumber];
        
    Operator* newOperator1;
    Operator* newOperator2;
    Operator* newOperator3;
//  Operator* newOperator4;
                     
    
    switch (levelNumber) {
        case 1: 
            //level 1 only allows Addition of single digit positive integers 
            newOperator1 = [Operator alloc];
            newOperator1.symbolIndex = ADDITION;
            newOperator1.firstMaximumOperand = SINGLEDIGIT;
            newOperator1.secondMaximumOperand = SINGLEDIGIT;
            
            level.permittedOperators = [NSArray arrayWithObject:newOperator1];
            
            break;
            
        case 2:
            //level 2 only allows Addition and Subtraction of single digit positive integers  
            newOperator1 = [Operator alloc];
            newOperator1.symbolIndex = ADDITION;
            newOperator1.firstMaximumOperand = SINGLEDIGIT;
            newOperator1.secondMaximumOperand = SINGLEDIGIT;
            
            newOperator2 = [Operator alloc];
            newOperator2.symbolIndex = SUBTRACTION;
            newOperator2.firstMaximumOperand = SINGLEDIGIT;
            newOperator2.secondMaximumOperand = SINGLEDIGIT;
            
            level.permittedOperators = [NSArray arrayWithObjects:newOperator1, newOperator2, nil];

            break;
            
        case 3:
            //level 3 only allows Addition and Subtraction of up to two digit positive integers  
            newOperator1 = [Operator alloc];
            newOperator1.symbolIndex = ADDITION;
            newOperator1.firstMaximumOperand = TWODIGITS;
            newOperator1.secondMaximumOperand = TWODIGITS;
            
            newOperator2 = [Operator alloc];
            newOperator2.symbolIndex = SUBTRACTION;
            newOperator2.firstMaximumOperand = TWODIGITS;
            newOperator2.secondMaximumOperand = TWODIGITS;
            
            level.permittedOperators = [NSArray arrayWithObjects:newOperator1, newOperator2, nil];

            break;
            
        case 4:
            //level 4 only allows Addition and Subtraction of up to two digit positive integers, and Multiplication (with single digit multipliers only)
            newOperator1 = [Operator alloc];
            newOperator1.symbolIndex = ADDITION;
            newOperator1.firstMaximumOperand = TWODIGITS;
            newOperator1.secondMaximumOperand = TWODIGITS;
            
            newOperator2 = [Operator alloc];
            newOperator2.symbolIndex = SUBTRACTION;
            newOperator2.firstMaximumOperand = TWODIGITS;
            newOperator2.secondMaximumOperand = TWODIGITS;
            
            newOperator3 = [Operator alloc];
            newOperator3.symbolIndex = MULTIPLICATION;
            newOperator3.firstMaximumOperand = SINGLEDIGIT; //***** note single digit for multiplication ****        
            newOperator3.secondMaximumOperand = SINGLEDIGIT;            
            level.permittedOperators = [NSArray arrayWithObjects:newOperator1, newOperator2, newOperator3, nil];

            break;
            
        case 5:
            // level 5 only allows Addition, Subtraction of up to two digit positive integers, and Multiplication 
            // of no more than one double digit multiplier)  
            newOperator1 = [Operator alloc];
            newOperator1.symbolIndex = ADDITION;
            newOperator1.firstMaximumOperand = TWODIGITS;
            newOperator1.secondMaximumOperand = TWODIGITS;
            
            newOperator2 = [Operator alloc];
            newOperator2.symbolIndex = SUBTRACTION;
            newOperator2.firstMaximumOperand = TWODIGITS;
            newOperator2.secondMaximumOperand = TWODIGITS;
            
            newOperator3 = [Operator alloc];
            newOperator3.symbolIndex = MULTIPLICATION;
            newOperator3.firstMaximumOperand = SINGLEDIGIT; //***** note single digit for multiplication ****        
            newOperator3.secondMaximumOperand = TWODIGITS; 
            
            level.permittedOperators = [NSArray arrayWithObjects:newOperator1, newOperator2, newOperator3, nil];
            
            break;
            
        case 6:
            // level 6 = Level 5 + Division of 

            break;
            
        case 7: 

            break;
            
        case 8:

            break;
            
        case 9:
            
            break;
            
        case 10:
            
            break;
            
        case 11:

            break;
            
        case 12:

            break;
            
        default:
            // Default Level = Level One.
            
            //level 1 only allows Addition of single digit positive integers 
            newOperator1 = [Operator alloc];
            newOperator1.symbolIndex = ADDITION;
            newOperator1.firstMaximumOperand = SINGLEDIGIT;
            newOperator1.secondMaximumOperand = SINGLEDIGIT;
            
            level.permittedOperators = [NSArray arrayWithObject:newOperator1];            
            break;
    }
       
    
    return level;
                     
                     
}


@end
