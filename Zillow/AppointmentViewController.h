//
//  AppointmentViewController.h
//  Zillow
//
//  Created by gaurav sinha on 18/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ModalHUD.h"
#import <MessageUI/MessageUI.h>

@interface AppointmentViewController : UIViewController <MFMailComposeViewControllerDelegate,UIPickerViewDelegate,UIPickerViewDataSource>{
	IBOutlet UITextField *textOther;
	IBOutlet UITextField *textDataAvail;
	IBOutlet UITextField *textTime;
	IBOutlet UISwitch *swBuy;
	IBOutlet UISwitch *swSale;
	IBOutlet UISwitch *swName;
	IBOutlet UISwitch *swEmail;
	IBOutlet UISwitch *swPhone;
	IBOutlet UISwitch *swMet;
	IBOutlet UISwitch *swUpdate;
	IBOutlet UIScrollView *scrollView;
	UITextField *editingField;
    IBOutlet UIButton *buttonHelp;
    UIPickerView *picker;
    
    IBOutlet UIButton *buttonDaysAvail;
    NSMutableArray  *arrayNo;
    UIView *viewForPicker;
	NSString *_stringToEmail;
    BOOL _fromdays;
}
-(IBAction)sendEmail:(id)sender;
-(IBAction)clickToHelp:(id)sender;
-(IBAction)userdidenteringtext:(id)sender;
-(IBAction)daysAvail:(id)sender;

@end
