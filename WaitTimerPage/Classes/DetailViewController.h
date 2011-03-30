//
//  DetailViewController.h
//  WaitTimerPage
//
//  Created by gaurav sinha on 26/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//  Email:sinhagaurav010@gmail.com
///////////////////////////////////////////////
//Description:This class is for the detail 
//of the customer
//////////////////////////////////////////////

#import <UIKit/UIKit.h>
#import "DataViewController.h"
#import "TableViewController.h"
@interface DetailViewController : UIViewController 
{
	IBOutlet UITextField *text_name; 
	IBOutlet UITextField *text_mobileno;
	IBOutlet UITextField *text_notes;
	IBOutlet UITextField *text_time;
	IBOutlet UIButton    *button_save;
	IBOutlet  UITextField *text_waiting;
	IBOutlet UIDatePicker *picker_timming;
	TableViewController *data_table;
	DataViewController *data;
}
-(IBAction)saved:(id)sender;
@end
