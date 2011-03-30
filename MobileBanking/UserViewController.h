//
//  UserViewController.h
//  MobileBanking
//
//  Created by CHROME INFOTECH  on 25/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//  Email  :  gauravs@chromeinfotech.com
/////////////////////////////////
//@Description:  This class is for the laogin page
///////////////////////////


#import <UIKit/UIKit.h>
#import  "SummaryViewController.h"
#import "Constant.h"
@interface UserViewController : UIViewController 
{
	@private
	IBOutlet   UITextField   *user_text;
	IBOutlet   UITextField   *password_text;
	IBOutlet   UIButton      *button_remember;
	IBOutlet   UIButton      *button_enter;
	IBOutlet   UINavigationBar  *navigation_bar;
	IBOutlet   UIScrollView  *scroll_view;
}
-(IBAction)userdidenteringtext:(id)sender;
-(IBAction)pressToRemember:(id)argName;
-(IBAction)pressToEnter:(id)argName;
@end
