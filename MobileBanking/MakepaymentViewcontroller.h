//
//  MakepaymentViewcontroller.h
//  MobileBanking
//
//  Created by CHROME INFOTECH  on 28/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//  Email:gauravs@chromeinfotech.com


////////////////////////////////////////
//@Description:This class is for the 
//Make payment section of project 
////////////////////////////////

#import <UIKit/UIKit.h>
#import "UserViewController.h"


@interface MakepaymentViewcontroller : UIViewController {

	IBOutlet  UILabel      *lable_payee;
	IBOutlet  UITextField  *text_amount;
	IBOutlet  UITextField  *text_sendon;
	IBOutlet  UIButton     *buttonMakepayment;
    IBOutlet  UIButton     *button_cancel;
	IBOutlet  UIButton     *button_calender;
	IBOutlet  UIDatePicker *datePicker;
	NSString               *string_amount;
	NSString			   *string_messsage;
	NSString			   *string_confirmation;
	NSString			   *string_DeliverBy;
    NSMutableArray		   *array_MakePayment;
	NSString               *string_sentOn;
	BOOL				   _issendOnfill;
}
-(IBAction)userdidenteringtext:(id)sender;
-(IBAction)togetcalender:(id)sender;
-(IBAction)clickonmakepayement:(id)sender; 
-(IBAction)clickoncancel:(id)sender; 



@end
