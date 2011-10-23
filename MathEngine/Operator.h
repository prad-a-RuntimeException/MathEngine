//
//  Operator.h
//  MathEngine
//
//  Created by Momodou Sanyang on 10/2/11.
//  Copyright 2011 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonConstants.h"


@interface Operator : NSObject {
    
    int maximumOperand;
    int firstMaximumOperand;
    int secondMaximumOperand;
    int symbolIndex;   //the index of the operator in the operatorSymbols array (global array of operator symbols)  
    //NSArray* operatorSymbols = [NSArray arrayWithObjects:"+", "-", "*", "//", nil];   //Symbol for the operator: i.e +, -, etc
    
}

- (id)initWithMaximumOperand:(int) newMaximumOperand
     withFirstMaximumOperand:(int) newFirstMaxOperand
     withSecondMaximumOperand:(int) newSecondMaxOperand
                    withSymbolIndex:(int) newSymbolIndex;


@property(nonatomic) int maximumOperand;
@property(nonatomic) int firstMaximumOperand;
@property(nonatomic) int secondMaximumOperand;
@property(nonatomic) int symbolIndex;


@end
