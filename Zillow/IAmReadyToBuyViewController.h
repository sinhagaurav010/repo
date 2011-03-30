//
//  IAmReadyToBuyViewController.h
//  Zillow
//
//  Created by gaurav sinha on 20/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalHUD.h"
#import <MessageUI/MessageUI.h>
#import "Global.h"

@interface IAmReadyToBuyViewController : UIViewController<MFMailComposeViewControllerDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UIGestureRecognizerDelegate> {
	IBOutlet UITextField *textname;
	IBOutlet UITextField *textphone;
	IBOutlet UITextField *textMove;
	IBOutlet UITextField *textPool;
	IBOutlet UITextField *textBedRooms;
	IBOutlet UITextField *textBath;
	IBOutlet UITextField *textfea;
	IBOutlet UIScrollView *scrollView;
    IBOutlet UIButton *buttonTime;
    NSMutableArray *arrayNo;
    
    IBOutlet UIButton *buttonBed;
    NSInteger _fromBed;
    IBOutlet UIButton *buttonBath;
    UIPickerView *picker;
    UIView *viewForPicker;
    
	UITextField *editingField;	
}
-(IBAction)sendEmail:(id)sender;
-(IBAction)userdidenteringtext:(id)sender;
-(IBAction)Fortimeframe:(id)sender;
@end
