//
//  GetDirectionViewController.h
//  MyappFinder
//
//  Created by gaurav sinha on 13/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface GetDirectionViewController : UIViewController<UIWebViewDelegate> {
	IBOutlet UIWebView *WebViewForDirection;
	UIActivityIndicatorView *spinner;
}

@end
