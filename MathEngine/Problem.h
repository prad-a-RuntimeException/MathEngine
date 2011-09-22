//
//  Problem.h
//  MathEngine
//
//  Created by Pradheep Raju on 9/21/11.
//  Copyright 2011 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Problem : NSObject {
    
    CCArray* operands;
    CCArray* operatorChar;
    NSMutableDictionary *answers;
    
    
    
}

- (id)initWithOperands:(CCArray*) newOperands
         withOperators:(CCArray *) newOperator
           withAnswers:(NSDictionary*) newAnswers;

@property (nonatomic, retain) CCArray* operands;
@property (nonatomic, retain) CCArray* operatorChar;
@property (nonatomic, retain) NSDictionary* answers;



@end
