//
//  Problem.m
//  MathEngine
//
//  Created by Pradheep Raju on 9/21/11.
//  Copyright 2011 Personal. All rights reserved.
//

#import "Problem.h"

@implementation Problem

@synthesize problemOperator;
@synthesize firstOperand;
@synthesize secondOperand;
@synthesize solution;
@synthesize answers;

- (id)initWithFirstOperand:(NSNumber*) newFirstOperand
         withSecondOperand:(NSNumber*) newSecondOperand
             withOperators:(Operator*) newOperator
               withAnswers:(NSMutableSet*) newAnswers
{
    self = [super init];
    if (self != nil) {
        
        self.problemOperator = newOperator;    
        self.firstOperand = newFirstOperand;
        self.secondOperand = newSecondOperand;
        self.answers = newAnswers;
    }
    
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.problemOperator = [Operator alloc];
        self.answers = [[NSMutableSet alloc] init];
    }
    
    return self;
}

@end
