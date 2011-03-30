//
//  PhotoprjAppDelegate.h
//  Photoprj
//
//  Created by gaurav sinha on 03/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SplashScreenViewController.h"

@interface PhotoprjAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    IBOutlet UINavigationController *navigation;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

