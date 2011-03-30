//
//  BuyHomeViewController.h
//  Zillow
//
//  Created by gaurav sinha on 16/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"
#import "LoadHtmlViewController.h"
#import "WhatICanAffrdViewController.h"
#import "WebViewContrller.h"
#import "AppointmentViewController.h"
#import "IAmReadyToBuyViewController.h"

@interface BuyHomeViewController : UIViewController 
{
	NSMutableArray *arrayElement;
	IBOutlet UITableView *_tableView;
}

@end
