//
//  TransferViewController_Ipad.h
//  MobileBanking
//
//  Created by CHROME INFOTECH  on 01/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//  Email:gauravs@chromeinfotech.com


////////////////////////////////////////
//@Description:This class is for the transfer section 
//of project for ipad
////////////////////////////////


#import <UIKit/UIKit.h>

@interface TransferViewController_Ipad : UIViewController {
	IBOutlet  UITextField  *text_from;
	IBOutlet  UITextField  *text_to;
	IBOutlet  UITextField  *text_amonut;
	IBOutlet  UIButton     *button_transfer;
	IBOutlet  UIButton     *button_cancel;
	IBOutlet  UIButton     *button_dropFrom;
	IBOutlet  UIButton     *button_dropTo;
	IBOutlet  UIPickerView  *pickerView;
	NSString               *string_ammount;
	NSString               *string_effectiveDate;
	NSString               *string_account;
	NSString               *string_SLtype;
	NSString               *string_suffix;
	NSString               *string_frombalance;
	NSString               *string_fromavail;
	NSString               *string_toaccount;
	NSString               *string_toSLtype;
	NSString			   *string_tosuffix;
	NSString			   *string_toavail;
 	BOOL   _isToClicked;
	BOOL   _isFromClicked;
}
-(IBAction)userdidenteringtext:(id)sender;
-(IBAction)clickontarnsfer:(id)sender; 
-(IBAction)clickoncancel:(id)sender; 
-(IBAction)clickondropforto:(id)sender;
-(IBAction)clickondropforfrom:(id)sender; 


@end


