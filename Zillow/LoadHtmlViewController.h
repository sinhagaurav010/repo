//
//  LoadHtmlViewController.h
//  Zillow
//
//  Created by gaurav sinha on 13/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LoadHtmlViewController : UIViewController<UIWebViewDelegate> 
{
	IBOutlet UIWebView *_webView;
	NSString *FileName;
	NSString *StringTitle;
}
@property(nonatomic,retain)NSString *FileName;
@property(nonatomic,retain)NSString *StringTitle;

@end
