//
//  AppDelegate_iPad.h
//  MobileBanking
//
//  Created by CHROME INFOTECH  on 25/10/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate_iPad : NSObject <UIApplicationDelegate>
{
	 UINavigationController  *navigation;

    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic,retain) IBOutlet UINavigationController  *navigation;
@end

