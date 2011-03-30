//
//  TabwebbrowserAppDelegate.h
//  Tabwebbrowser
//
//  Created by Vinsol on 24/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebbrowserViewController.h"


@interface TabwebbrowserAppDelegate : NSObject <UIApplicationDelegate> {
     IBOutlet UINavigationController  *navigation;
	UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

