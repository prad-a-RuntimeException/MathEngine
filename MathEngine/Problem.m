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

- (void) generateSolution {
    
    
    int correctAnswer; 
    int divisor;
    
    switch (self.problemOperator.symbolIndex) {
        case ADDITION:
            correctAnswer = [self.firstOperand intValue ] + [self.secondOperand intValue];
            
            break;
            
        case SUBTRACTION:
            correctAnswer = [self.firstOperand intValue ] - [self.secondOperand intValue];
            
            break;
            
        case MULTIPLICATION:
            correctAnswer = [self.firstOperand intValue ] * [self.secondOperand intValue];
            
            break;
            
        case DIVISION:
            divisor = [self.secondOperand intValue];
            
            if (divisor == 0) {//avoid divide by zero
                divisor++;
            }
            correctAnswer = [self.firstOperand intValue ] / divisor;
            
            break;
            
        default:
            break;
    }
    
    self.solution = [NSNumber numberWithInt: correctAnswer];
    
    // add the solution to the list of possible answers
    [self.answers addObject: self.solution];
    
}

- (void) generatePossibleAnswers {
    
    NSNumber* wrongAnswer1;
    NSNumber* wrongAnswer2;
    NSNumber* wrongAnswer3;    
    NSNumber* wrongAnswer4;
    
    
    // then add at least three wrong answers by using all possible operators except 
    // the operator selected for the current problem
    
    if(self.problemOperator.symbolIndex != ADDITION){
        wrongAnswer1 = [NSNumber numberWithInt: [self.firstOperand intValue] + [self.secondOperand intValue]];
        
        if([self.answers containsObject: wrongAnswer1]){ //avoid overwriting existing entries
            while ([self.answers containsObject:wrongAnswer1]) {
                wrongAnswer1 = [NSNumber numberWithInt: [wrongAnswer1 intValue] + (arc4random() % SINGLEDIGIT)];
            }
        }
        
        [self.answers addObject: wrongAnswer1];
    }    
    
    if(self.problemOperator.symbolIndex != SUBTRACTION){
        wrongAnswer2 = [NSNumber numberWithInt: [self.firstOperand intValue] - [self.secondOperand intValue]];
    
        if([self.answers containsObject: wrongAnswer2]){ //avoid overwriting existing entries
            while ([self.answers containsObject:wrongAnswer2]) {
                wrongAnswer2 = [NSNumber numberWithInt: [wrongAnswer2 intValue] + (arc4random() % SINGLEDIGIT)];
            }
        }
        
        [self.answers addObject: wrongAnswer2];
    }
    
    if(self.problemOperator.symbolIndex != MULTIPLICATION){
        wrongAnswer3 = [NSNumber numberWithInt: [self.firstOperand intValue] * [self.secondOperand intValue]];
    
        if([self.answers containsObject: wrongAnswer3] ){ //avoid overwriting existing entries
            while ([self.answers containsObject:wrongAnswer3]) {
                wrongAnswer3 = [NSNumber numberWithInt: [wrongAnswer3 intValue] + (arc4random() % SINGLEDIGIT)];
            }
        }
    
        [self.answers addObject: wrongAnswer3];
    }
    
    
    if(self.problemOperator.symbolIndex != DIVISION){    
        int divisor = [self.secondOperand intValue];
    
        if (divisor == 0) {//avoid divide by zero
            divisor++;
        }
    
        wrongAnswer4 = [NSNumber numberWithInt:[self.firstOperand intValue] / divisor];
    
        if([self.answers containsObject: wrongAnswer4]){ //avoid overwriting existing entries
            while ([self.answers containsObject:wrongAnswer4]) {
                wrongAnswer4 = [NSNumber numberWithInt: [wrongAnswer4 intValue] + (arc4random() % SINGLEDIGIT)];
            }
        }
   
        [self.answers addObject: wrongAnswer4];        

    }

}


@end
