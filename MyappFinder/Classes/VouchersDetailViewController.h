//
//  VouchersDetailViewController.h
//  MyappFinder
//
//  Created by gaurav sinha on 17/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataController.h"
#import "SharedInstance.h"
@interface VouchersDetailViewController : UIViewController 
{
	SharedInstance *share;
	IBOutlet UITableView *tableView;
	IBOutlet UILabel *labelVoucherName;
	NSMutableArray *arrayWeekDay;
}

@end
