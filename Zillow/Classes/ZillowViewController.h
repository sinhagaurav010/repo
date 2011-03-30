//
//  ZillowViewController.h
//  Zillow
//
//  Created by gaurav sinha on 10/03/11.
//  Copyright 2011 . All rights reserved.
//
#define kScreenWidthPortrait 768
#define kScreenHeightPortrait 1004

#import "IAmReadyToSellViewController.h"

#import "ContactMeViewController.h"
#import <UIKit/UIKit.h>
#import "Modal.h"
#import "LoadHtmlViewController.h"
#import "SearchViewController.h"
#import "HomeWorthViewController.h"
#import "MortaggeCalculatorViewController.h"
#import "BuyHomeViewController.h"


@interface ZillowViewController : UIViewController {
	NSMutableArray *arrayHome;
	UIActivityIndicatorView *spinner;
	IBOutlet UITableView *_tableView;
}

@end
