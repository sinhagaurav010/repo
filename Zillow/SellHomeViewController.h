//
//  SellHomeViewController.h
//  Zillow
//
//  Created by gaurav sinha on 17/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoadHtmlViewController.h"
#import "IAmReadyToSellViewController.h"
#import "Global.h"
#import "AppointmentViewController.h"
@interface SellHomeViewController : UIViewController {
	IBOutlet UITableView *_tableView;
	NSMutableArray *arrayElement;
}

@end
