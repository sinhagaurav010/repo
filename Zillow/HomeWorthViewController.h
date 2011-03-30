//
//  HomeWorthViewController.h
//  Zillow
//
//  Created by gaurav sinha on 13/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "ModalHUD.h"
#import "Global.h"


@interface HomeWorthViewController : UIViewController<MFMailComposeViewControllerDelegate> {
	IBOutlet UITextField *textName;
	IBOutlet UITextField *textPhone;
	IBOutlet UITextField *textAddress;
	IBOutlet UITextField *textCity;
	IBOutlet UITextField *textState;
	IBOutlet UITextField *textZip;
	IBOutlet UIScrollView *_scrollView;
    UITextField *editingField;
}
-(IBAction)sendEmail:(id)sender;
-(IBAction)returnKeypad:(id)sender;
-(void)emailTheImage:(UIImage*)imageToEmail;

@end
       