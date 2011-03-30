//
//  WhatICanAffrdViewController.h
//  Zillow
//
//  Created by gaurav sinha on 17/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"
#import <MessageUI/MessageUI.h>
@interface WhatICanAffrdViewController : UIViewController<MFMailComposeViewControllerDelegate> {
	IBOutlet UITextField *textFldName;
	IBOutlet UITextField *textPhone;
	IBOutlet UITextField *textCredit;
	IBOutlet UITextField *textHome;
	IBOutlet UITextField *textRLCC;
	IBOutlet UIScrollView *_scrollView;
    UITextField *editingField;
	
}
-(IBAction)sentEmail:(id)sender;
-(IBAction)userdidenteringtext:(id)sender;

@end
