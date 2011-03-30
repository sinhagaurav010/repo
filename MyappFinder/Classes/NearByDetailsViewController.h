//
//  NearByDetailsViewController.h
//  MyappFinder
//
//  Created by gaurav sinha on 06/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SharedInstance.h"
#import "DataController.h"
#import "SendSMSViewController.h"
#import "FavouritesViewController.h"

@interface NearByDetailsViewController : UIViewController 
{
	IBOutlet UILabel *labelRestaruents;
	IBOutlet UITableView *tableview;
	SharedInstance *share;
	NearByDetailsViewController *obj;
	CGRect frameOfView;
	NSInteger _cell;
	
	NSUInteger val;
}
@property (nonatomic, assign) NSInteger _cell;

@property (nonatomic, assign) NSUInteger val;

@end
