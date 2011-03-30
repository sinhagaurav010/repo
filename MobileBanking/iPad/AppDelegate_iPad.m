//
//  AppDelegate_iPad.m
//  MobileBanking
//
//  Created by CHROME INFOTECH  on 25/10/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "AppDelegate_iPad.h"
#import "Constant.h"
#import "UserViewController.h"
@implementation AppDelegate_iPad

@synthesize window, navigation;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	
	
	UserViewController *userView = [[UserViewController alloc] initWithNibName:@"UserViewController_Ipad" bundle:nil];
	userView.view.frame = CGRectMake(0,-20, 768,1024);
	 // Override point for customization after application launch.
	[window  addSubview:navigation.view];
	_IPAD  = 1;
    [window makeKeyAndVisible];
	
	[navigation pushViewController:userView animated:YES];
	
	return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	[navigation release];
    [window release];
    [super dealloc];
}


@end
