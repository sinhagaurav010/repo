//
//  IAmReadyToSellViewController.h
//  Zillow
//
//  Created by gaurav sinha on 18/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalHUD.h"
#import <MessageUI/MessageUI.h>
#import "Global.h"
@interface IAmReadyToSellViewController :UIViewController <UIGestureRecognizerDelegate,MFMailComposeViewControllerDelegate,UIPickerViewDelegate,UIPickerViewDataSource> {
    NSMutableArray *arrayNo;
	IBOutlet UITextField *textname;
	IBOutlet UITextField *textphone;
	IBOutlet UITextField *textAddress;
	IBOutlet UITextField *textCity;
	IBOutlet UITextField *textBedRooms;
    IBOutlet UIButton *buttonBed;
    IBOutlet UIButton *buttonBath;
    IBOutlet UIButton *buttonTime;
	IBOutlet UITextField *textBath;
	IBOutlet UITextField *textfea;
	IBOutlet UIScrollView *scrollView;
    UIPickerView *picker;
	UITextField *editingField;
    
    NSInteger _fromBed;
    UIView *viewForPicker;
}
-(IBAction)sendEmail:(id)sender;
-(IBAction)timeFrame:(id)sender;
-(IBAction)userdidenteringtext:(id)sender;
-(IBAction)tapToNumBd:(id)sender;
-(IBAction)tapToNumBath:(id)sender;

@end
