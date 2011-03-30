//
//  SearchSortController.h
//  MyappFinder
//
//  Created by gaurav sinha on 12/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SharedInstance.h"

@interface SearchSortController : UIViewController<UITableViewDelegate,UITableViewDataSource> 
{
	SharedInstance *share;
	CGRect frameOfView;
	NSMutableArray *arrayNearByDetails;
}

@end
