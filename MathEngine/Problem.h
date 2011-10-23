//
//  Problem.h
//  MathEngine
//
//  Created by Pradheep Raju on 9/21/11.
//  Copyright 2011 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Operator.h"
#import "CommonConstants.h"

@interface Problem : NSObject {
    
    Operator* problemOperator;
    NSNumber* firstOperand;
    NSNumber* secondOperand;
    NSNumber* solution;
    NSMutableSet* answers;
    
}

- (id)initWithFirstOperand:(NSNumber*) newFirstOperand
         withSecondOperand:(NSNumber*) newSecondOperand
         withOperators:(Operator*) newOperator
           withAnswers:(NSMutableSet*) newAnswers;


@property (nonatomic, retain) NSNumber* firstOperand;
@property (nonatomic, retain) NSNumber* secondOperand;
@property (nonatomic, retain) NSNumber* solution;
@property (nonatomic, retain) NSMutableSet* answers;
@property (nonatomic, retain) Operator* problemOperator;


@end
