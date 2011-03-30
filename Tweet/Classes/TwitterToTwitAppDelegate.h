//
//  TwitterToTwitAppDelegate.h
//  TwitterToTwit
//
//  Company VINSOL
// Email:gaurav.sinha@vinsol.com

#import <UIKit/UIKit.h>
#import "TwitterViewController.h"

@interface TwitterToTwitAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	 UINavigationController *navigation;
	//TwitterViewController *TwitterController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

