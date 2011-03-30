//
//  MortaggeCalculatorViewController.h
//  Zillow
//
//  Created by gaurav sinha on 16/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MortaggeCalculatorViewController : UIViewController<UIGestureRecognizerDelegate> {
	IBOutlet UITextField *textLA;
	IBOutlet UITextField *textIR;
	IBOutlet UITextField *textMT;
	IBOutlet UITextField *textMP;
	IBOutlet UIScrollView *_scrollView;
	BOOL _check; 
	UITextField *editingField;
 }
-(IBAction)calculate:(id)sender;
-(void)calculateValue;
-(void)alertForTextField:(NSString*)stringValue;

-(IBAction)userdidenteringtext:(id)sender;
@end
