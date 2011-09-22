//
//  AppDelegate.h
//  MathEngine
//
//  Created by Pradheep Raju on 9/18/11.
//  Copyright Personal 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
