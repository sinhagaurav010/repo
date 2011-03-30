//
//  TwitterRushViewController.h
//  TwitterRush
//  Company VINSOL
// Email:gaurav.sinha@vinsol.com
#import <UIKit/UIKit.h>
#import "SA_OAuthTwitterController.h"
#import "TwitterViewController.h"
@class SA_OAuthTwitterEngine;

@interface TwitterRushViewController : UIViewController < SA_OAuthTwitterControllerDelegate>
{ 
	IBOutlet UITextView *tweetTextField;
	UIActivityIndicatorView *spinner;
	SA_OAuthTwitterEngine	*_engine;	
	NSString *msgString;
	IBOutlet UILabel *textLengthLabel;
}
- (void)textViewDidChange:(UITextView *)textView;
@property(nonatomic, retain) IBOutlet UITextView *tweetTextField;
@property(nonatomic, retain) NSString *msgString;

-(IBAction)updateTwitter:(id)sender; 

@end

