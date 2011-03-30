//
//  WebViewContrller.h
//  Zillow
//
//  Created by gaurav sinha on 16/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//  Email:sinhagaurav010@gmail.com

#import <UIKit/UIKit.h>
#import "DetectNetworkConnection.h"


@interface WebViewContrller : UIViewController<UIWebViewDelegate> {
	IBOutlet UIWebView *_webView;
	NSString *stringUrl;
	NSString *stringTitle;
	UIActivityIndicatorView *spinner;
}
@property(nonatomic,retain)NSString *stringUrl;
@property(nonatomic,retain)NSString *stringTitle;

@end
