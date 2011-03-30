//
//  MyappFinderAppDelegate.h
//  MyappFinder
//
//  Created by gaurav sinha on 02/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyappFinderAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	IBOutlet UINavigationController *navigation;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

