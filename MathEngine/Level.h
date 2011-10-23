//
//  Level.h
//  MathEngine
//
//  Created by Momodou Sanyang on 9/25/11.
//  Copyright 2011 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Operator.h"
#import "CommonConstants.h"

@interface Level : NSObject {
    
    int levelNumber;
    NSArray* permittedOperators;
    Operator* activeOperator;
    int maximumOperand;
    BOOL enableNegativeNumbers;
    BOOL enableFractions;    
    
}



- (id)initWithLevelNumber:(int) newLevelNumber;
-(void) setActiveOperator;
-(int) generateOperand:(int) maxOperand;


@property(nonatomic, retain) NSArray* permittedOperators;
@property(nonatomic) int maximumOperand;
@property(nonatomic) int levelNumber;
@property(nonatomic) BOOL enableNegativeNumbers;
@property(nonatomic) BOOL enableFractions;
@property(nonatomic, retain) Operator* activeOperator;


@end
