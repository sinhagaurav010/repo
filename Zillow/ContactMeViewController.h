//
//  ContactMeViewController.h
//  Zillow
//
//  Created by gaurav sinha on 13/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewContrller.h"
#import "ModalHUD.h"
#import <MessageUI/MessageUI.h>


@interface ContactMeViewController : UIViewController<MFMailComposeViewControllerDelegate> {
	NSMutableArray *arrayContact;
	IBOutlet UITableView *_tableView;
}

@end
