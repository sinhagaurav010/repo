//
//  DifferentViewController.h
//  Photoprj
//
//  Created by gaurav sinha on 05/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DifferentViewController : UIViewController {
	NSMutableString			*currentElementValue;
	//IBOutlet UIView         *view_main;
	IBOutlet UIScrollView  *scrll_view;
	BOOL landmode;
	BOOL portrMode;
	NSMutableArray        *array_fromButton;

}

@end
