//
//  TwitterViewController.h
//  TwitterToTwit
//
//  Created by gaurav sinha on 17/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//  Company VINSOL
// Email:gaurav.sinha@vinsol.com



#import <UIKit/UIKit.h>
#import "TwitterRushViewController.h"
#import "MGTwitterEngine.h"
#import "XMLParser.h"
#import "AsyncImageView.h"
#import "TwitterRequest.h"

#import "TwitterViewController.h"

@interface TwitterViewController : UIViewController<UITableViewDelegate,UITableViewDataSource> {
	IBOutlet UIButton *buttonToTwit;
    TwitterRequest *tr;
    TreeNode *root;
    BOOL _fromTweet;
    IBOutlet UITableView *_tableView;
}

@property(nonatomic,assign)BOOL _fromTweet;
-(IBAction)clickToTwit:(id)sender;
-(void)friends_timeline_callback:(NSData *)data;
-(void)timeLineFunction;


@end
