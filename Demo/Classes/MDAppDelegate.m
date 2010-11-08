//
//  MDAppDelegate.m
//  Messages Demo
//
//  Created by Sam Soffes on 11/7/10.
//  Copyright 2010 Sam Soffes. All rights reserved.
//

#import "MDAppDelegate.h"
#import "MDDemoViewController.h"

@implementation MDAppDelegate

#pragma mark NSObject

- (void)dealloc {
    [_window release];
    [super dealloc];
}


#pragma mark UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    MDDemoViewController *viewController = [[MDDemoViewController alloc] init];
	UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
	[viewController release];
	
	_window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	_window.rootViewController = navigationController;
	[_window makeKeyAndVisible];
	
	[navigationController release];
    
    return YES;
}

@end
