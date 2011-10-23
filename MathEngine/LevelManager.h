//
//  LevelCreator.h
//  MathEngine
//
//  Created by Pradheep Raju on 9/18/11.
//  Copyright 2011 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Level.h"
#import "Operator.h"
#import "CommonConstants.h"


@interface LevelManager : NSObject



-(Level*) createLevel:(int) levelNumber;

@end
