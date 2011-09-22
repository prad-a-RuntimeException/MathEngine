//
//  TestsAppDelegate.h
//  Tests
//
//  Created by Pradheep Raju on 9/21/11.
//  Copyright 2011 Personal. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TestsViewController;

@interface TestsAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet TestsViewController *viewController;

@end
