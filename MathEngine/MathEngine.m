//
//  MathEngine.m
//  MathEngine
//
//  Created by Pradheep Raju on 9/18/11.
//  Copyright 2011 Personal. All rights reserved.
//

#import "MathEngine.h"

@interface MathEngine ()
-(int) opertorGenerator;
-(int) operandGenerator;
-(int) generateNegativeOptions:(int) answer;
@end


@implementation MathEngine

@synthesize numOfDigits;
@synthesize numOfOperands;
@synthesize permittedOperations;
@synthesize levelNumber;
@synthesize enableFractions;
@synthesize enableNegativeNumbers;
@synthesize mathProblem;


// By default the level number should be one, but 
// the the math engine could be instantiated with an higher level number also.
- (id)initWithLevelNumber:(int) newLevelNumber
{
    
    self = [super init];
    if (self) {
        
        levelNumber = newLevelNumber;
        
        if(levelNumber == 0) {
            
            permittedOperations = Plus;
            numOfOperands = 2;
            numOfDigits = SingleDigit;
            enableNegativeNumbers = NO;
            enableFractions = NO;
            
        }
        
    }
    
    return self;
}

-(void) proceedToNextLevel:(int) stepSize {
    
    levelNumber = levelNumber + stepSize;
    
    switch (levelNumber) {
        case 1:
            permittedOperations = Minus;
            break;
            
        case 2:
            numOfDigits = MultipleDigit;
            permittedOperations = Plus;
            break;
            
        case 3:
            numOfDigits = MultipleDigit;
            permittedOperations = Minus;
            break;
            
        case 4:
            numOfDigits = MultipleDigit;
            permittedOperations = Multiplication;
            break;
            
        case 5:
            numOfDigits = MultipleDigit;
            permittedOperations = Division;
            break;
            
        case 6:
            enableNegativeNumbers = YES;
            break;
            
        case 7:
            enableFractions = YES;
            break;
            
        default:
            break;
    }
    
}



-(Problem*) problemGenerator {
    
    // Will have to operand Generator
    CCArray* operands = [[[CCArray alloc] init] autorelease];
    
    NSNumber* firstOperand = [NSNumber numberWithInteger:[self operandGenerator]];
    NSNumber* secondOperand = [NSNumber numberWithInteger:[self operandGenerator]];
    
    if(firstOperand >= secondOperand ) {
        [operands addObject:firstOperand ];
        [operands addObject:secondOperand ];
    } else {
        [operands addObject:secondOperand ];
        [operands addObject:firstOperand ];
    }
    
    CCArray* operators = [[[CCArray alloc] init] autorelease];
    
    NSNumber* operator = [NSNumber numberWithInteger:[self opertorGenerator]];
    
    [operators addObject:operator ];
    
    int solution =0;
    NSNumber* val;
        CCARRAY_FOREACH(operands, val) {
       
        switch (operator.intValue) {
            case Plus:
                solution = solution + val.intValue;
                break;
                
            case Minus:
                solution = solution - val.intValue;
                break;
                
            case Division:
                if(solution == 0)
                    solution = 1;
                solution = solution / val.intValue;
                break;
                
            case Multiplication:
                if(solution == 0)
                    solution = 1;
                solution = solution * val.intValue;
                break;
                
            default:
                break;
        }
        
    }
    
    // Now its time to generate the Problem Object.\
    
//    [[NSDictionary alloc] initWithObjectsAndKeys:
//     [ZFont fontWithUIFont:[UIFont systemFontOfSize:12]], ZFontAttributeName,
//     [UIColor blackColor], ZForegroundColorAttributeName,
//     [UIColor clearColor], ZBackgroundColorAttributeName,
//     [NSNumber numberWithInt:ZUnderlineStyleNone], ZUnderlineStyleAttributeName,
//     nil];
    
    NSNumber* sol = [NSNumber numberWithInt:solution];
    NSNumber* opt1 =  [NSNumber numberWithInt:[self generateNegativeOptions:solution]];
    NSNumber* opt2 =  [NSNumber numberWithInt:[self generateNegativeOptions:solution]];
    
    CCLOG(@"Answers %@, %@, %@", sol, opt1, opt2);
    
    NSMutableDictionary* answers = [[NSMutableDictionary alloc] init];
    [answers setObject:@"True" forKey:sol];
    [answers setObject:@"False" forKey:opt1];
    [answers setObject:@"False" forKey:opt2];
    
    
    Problem* problem = [[[Problem alloc] initWithOperands:operands 
                                           withOperators:operators 
                                             withAnswers:answers] autorelease];
    
    
    return problem;
    
}

-(int) generateNegativeOptions:(int) answer {
    
    NSInteger num = (arc4random() % 29) + answer;
    return num;
    
    
}

-(int) opertorGenerator {
    
    
    int operator  = arc4random()% permittedOperations;
    if(operator  == 0) {
        operator++;
    }
    
    return operator;
    
}



-(int) operandGenerator {
    
    int operand;
    int digit = (arc4random() % 2) +1;
   
    
    switch (numOfDigits) {
        case SingleDigit:
            operand=  arc4random() % 10;
            break;
        case MultipleDigit:
            
            if(digit == SingleDigit) {
                operand=  arc4random() % 10;
            } else if (digit == MultipleDigit) {
                operand = arc4random() % 40;
            }
            break;
            
        case TwoDigits:
            
            
            operand = arc4random() % 40;
            
            break;
            
            
            
        default:
            break;
    }
    
    return operand;
    
    
}



@end
