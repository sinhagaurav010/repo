//
//  SearchViewController.h
//  MyappFinder
//
//  Created by gaurav sinha on 06/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SharedInstance.h"
#import "DataController.h"
@interface SearchViewController : UIViewController {
	SharedInstance *share;
	NSMutableArray *arraySearch;
	CGRect frameOfView;
	NSMutableArray *arrayNearByDetails;
	IBOutlet UIPickerView *pickerViewForSearch;
}

@end
