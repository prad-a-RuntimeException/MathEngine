//
//  MathEngine.h
//  MathEngine
//
//  Created by Pradheep Raju on 9/18/11.
//  Copyright 2011 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Problem.h"
#define TotalLevels  7;

typedef enum {
    
    Plus=1,
    Minus=2,
    Multiplication=3,
    Division=4
    
} Operators;


typedef enum {
    
    SingleDigit =1,
    MultipleDigit=2,
    TwoDigits=3
    
} Digits;




@interface MathEngine : NSObject {
    
    
    int permittedOperations;
    int numOfDigits;
    int numOfOperands;
    int levelNumber;
    bool enableNegativeNumbers;
    bool enableFractions;
    
    Problem* mathProblem;

    
    
}

- (id)initWithLevelNumber:(int) newLevelNumber;
-(void) proceedToNextLevel:(int) stepSize;
-(Problem*) problemGenerator;

@property(nonatomic) int permittedOperations;
@property(nonatomic) int numOfDigits;
@property(nonatomic) int numOfOperands;
@property(nonatomic) int levelNumber;
@property(nonatomic) bool enableNegativeNumbers;
@property(nonatomic) bool enableFractions;
@property(nonatomic, retain) Problem* mathProblem;







@end
