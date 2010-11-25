//
//  RefreshViewController.h
//  Refresh
//
//  Created by Vinsol on 23/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RefreshViewController : UIViewController 
{
	//IBOutlet  UIButton   *button;
	NSMutableArray   *array_button;
	IBOutlet  UIView     *view_buttn;
	CGRect  fram1;
}
-(IBAction)clickToDisappear:(id)sender;
@end
