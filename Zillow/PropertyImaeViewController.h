//
//  PropertyImaeViewController.h
//  Zillow
//
//  Created by gaurav sinha on 14/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PropertyImaeViewController : UIViewController {
	  NSMutableArray *arrayImage;
	 IBOutlet UIScrollView *_scrollView;
	 NSInteger _counter;
	 IBOutlet UIButton *_leftButton;
	 IBOutlet UIButton *_rightButton;
}
-(IBAction)ToMoveRight:(id)sender;
-(IBAction)ToMoveLeft:(id)sender;
@property(nonatomic,retain)NSMutableArray *arrayImage;
@end
