//
//  FavouritesViewController.h
//  MyappFinder
//
//  Created by gaurav sinha on 06/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataController.h"
#import "SharedInstance.h"
@interface FavouritesViewController : UIViewController {
	IBOutlet UITableView *table_View;
	CGRect frameOfView;
	SharedInstance *share;
	BOOL _isRefresh;
}
@property (nonatomic,assign)BOOL _isRefresh;
@end
