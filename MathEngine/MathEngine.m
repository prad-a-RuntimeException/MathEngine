//
//  MathEngine.m
//  MathEngine
//
//  Created by Pradheep Raju on 9/18/11.
//  Copyright 2011 Personal. All rights reserved.
//

#import "MathEngine.h"

/*
@interface MathEngine ()
-(int) generateOperand;
-(int) generateOperator;
-(int) generateNegativeOptions:(int) answer;
@end
*/


@implementation MathEngine


@synthesize currentLevel;
@synthesize mathProblem;
@synthesize levelManager;

// By default the level number should be one, but 
// the the math engine could be instantiated with a higher level number also.
- (id)initWithLevelNumber:(int) newLevelNumber
{
    
    self = [super init];
    if (self != nil) {
        
        levelManager = [LevelManager alloc];
        currentLevel = [levelManager createLevel:newLevelNumber];
        
    }else{
        NSLog(@"Fatal Error: Could not instantiate MathEngine ############################################");
    }
    
    return self;
}

-(void) proceedToNextLevel:(int) stepSize {
    
    
    int levelNumber = [currentLevel levelNumber] + stepSize;
    
    currentLevel = [levelManager createLevel:levelNumber]; 
 
    
}



-(Problem*) generateProblem {
    
/*
     
     1. Get the currently active Level
     2. Get Operator from Level
     3. Get Operand 1 from Level
     4. Get Operand 2 from Level
     5. Generate the problem
     
*/

    
    // 1. Get currently active Level
    
    if(self.currentLevel == nil){

        [self setDefaultLevel];   
            
    }
    
    
    // 2. Set Active Operator
    
    [currentLevel setActiveOperator];
    
    // 3. Get First Operand 
    
    int firstOperand = [currentLevel generateOperand:currentLevel.activeOperator.firstMaximumOperand];
    
    
    // 4. Get second Operand

    int secondOperand = [currentLevel generateOperand:currentLevel.activeOperator.secondMaximumOperand];
    
    //ensure that if negatives are not allowed then answer should not be negative either
    if((firstOperand < secondOperand) && !currentLevel.enableNegativeNumbers){

        //swap the operand so that firstoperand > secondoperand to avoid -ve answer
        int temp = firstOperand;
        firstOperand = secondOperand;
        secondOperand = temp;
        
    }
    
    //if active operator is division, then ensure the second operand (divisor) is never zero.
    if(currentLevel.activeOperator.symbolIndex == DIVISION){
        if(secondOperand == 0){
            secondOperand++;
        }
    }    
    
    // 5. Generate the problem
    
            //5.1 Setup the problem
    Problem* problem = [Problem alloc];
    
    problem.firstOperand = [NSNumber numberWithInt: firstOperand];
    problem.secondOperand = [NSNumber numberWithInt: secondOperand];    
    problem.problemOperator = currentLevel.activeOperator;
    
    problem.answers = [[NSMutableSet alloc] init];
    
    //generate problem solution
    [problem generateSolution];
    
    
    //generate list of possible answers
    [problem generatePossibleAnswers];
    
    
    return problem;
    
}



-(void) setDefaultLevel {
    
   currentLevel = [levelManager createLevel:1 ]; 
    
}



@end
