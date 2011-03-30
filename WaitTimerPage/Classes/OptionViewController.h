//
//  OptionViewController.h
//  WaitTimerPage
//
//  Created by gaurav sinha on 04/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface OptionViewController : UIViewController 
{
	IBOutlet UITextField *username_text;
	IBOutlet UITextField *password_text;
	IBOutlet UITextField *campign_text;
	IBOutlet UITextField *timeformat_text;
	IBOutlet UIButton *save_button;
	IBOutlet UITextField *retypepassword_text;
	IBOutlet UITextView *text_view;
 
}
-(IBAction)clicktosave:(id)sender;
@end
