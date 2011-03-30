//
//  AppDelegate_iPhone.h
//  MobileBanking
//
//  Created by CHROME INFOTECH  on 25/10/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//
#import "UserViewController.h"

#import <UIKit/UIKit.h>

@interface AppDelegate_iPhone : NSObject <UIApplicationDelegate>
{
	IBOutlet UINavigationController  *navigation;
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController  *navigation;;

@end

