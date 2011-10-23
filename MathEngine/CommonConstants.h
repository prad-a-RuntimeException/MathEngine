//
//  CommonConstants.h
//  MathEngine
//
//  Created by Momodou Sanyang on 10/16/11.
//  Copyright 2011 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>

//define max level
#define maximumLevel 12

//define Operator indices
#define ADDITION 0
#define SUBTRACTION 1
#define MULTIPLICATION 2
#define DIVISION 3

//define Maximum Number of Digits
#define SINGLEDIGIT 10
#define TWODIGITS 100
#define THREEDIGITS 1000
#define FOURDIGITS 10000

#define OperatorSymbols [NSArray arrayWithObjects: @"+", @"-", @"*", @"/", nil]  //Symbol for the operator: i.e +, -, etc


@protocol CommonConstants <NSObject>

@end
