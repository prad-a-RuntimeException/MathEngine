//
//  MathEngine.h
//  MathEngine
//
//  Created by Pradheep Raju on 9/18/11.
//  Copyright 2011 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "CommonConstants.h"
#import "Problem.h"
#import "LevelManager.h"



@interface MathEngine : NSObject {
    
    
    Level* currentLevel;
    Problem* mathProblem;
    LevelManager* levelManager;

    
    
}

- (id)initWithLevelNumber:(int) newLevelNumber;
-(void) proceedToNextLevel:(int) stepSize;
-(Problem*) generateProblem;
-(void) setDefaultLevel;


@property(nonatomic, retain) Level* currentLevel;
@property(nonatomic, retain) Problem* mathProblem;
@property(nonatomic, retain) LevelManager* levelManager;


@end
