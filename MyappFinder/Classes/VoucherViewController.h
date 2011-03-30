//
//  VoucherViewController.h
//  MyappFinder
//
//  Created by gaurav sinha on 06/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataController.h"
#import "SharedInstance.h"
#import "XmlParser.h"

@interface VoucherViewController : UIViewController 
{
	SharedInstance *share;
	NSMutableArray *arrayVoucher;
	IBOutlet UITableView *table_View;
}

@end
