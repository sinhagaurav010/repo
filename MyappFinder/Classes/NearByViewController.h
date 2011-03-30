//
//  NearByViewController.h
//  MyappFinder
//
//  Created by gaurav sinha on 06/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SharedInstance.h"
#import "NearByDetailsViewController.h"
@interface NearByViewController : UIViewController {
	IBOutlet UITableView *table_View;
	NSMutableArray *arrayNearByDetails;
	CGRect frameOfView;
	BOOL _openOrClose;
	SharedInstance *share;
}

@end
