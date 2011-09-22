//
//  Problem.m
//  MathEngine
//
//  Created by Pradheep Raju on 9/21/11.
//  Copyright 2011 Personal. All rights reserved.
//

#import "Problem.h"

@implementation Problem

@synthesize operands;
@synthesize operatorChar;
@synthesize answers;

- (id)initWithOperands:(CCArray*) newOperands
         withOperators:(CCArray *) newOperator
           withAnswers:(NSDictionary*) newAnswers
{
    self = [super init];
    if (self) {
        
        
        self.operands = newOperands;
        self.operatorChar = newOperator;
        self.answers = newAnswers;
    }
    
    return self;
}

@end
