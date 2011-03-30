//
//  TableViewController.h
//  WaitTimerPage
//
//  Created by Vinsol on 25/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//  Email:sinhagaurav010@gmail.com
///////////////////////////////////////////////
//Description:This class is for the table view 
//for customer and adding new customer
//////////////////////////////////////////////


#import <UIKit/UIKit.h>
#import "DataViewController.h"


@interface TableViewController : UIViewController 
{
	IBOutlet UITableView *Table_View;
    DataViewController *data_fetch;	
	UIButton *doneButton;
	UIButton *button_about;
	NSMutableArray *arry_string;
	NSMutableArray *array_tab;
    NSInteger _todelete;
	BOOL _whichAlert;
	NSMutableArray *array_button;
	
}
@property (nonatomic, retain) 	NSMutableArray *array_tab;


@end
