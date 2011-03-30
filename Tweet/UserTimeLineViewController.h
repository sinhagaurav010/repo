//
//  UserTimeLineViewController.h
//  TwitterToTwit
//
//  Created by gaurav sinha on 29/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TwitterRequest.h"
#import "XMLParser.h"

@interface UserTimeLineViewController : UIViewController<UITableViewDataSource,UITableViewDelegate> {
    TwitterRequest *tr;
    UITableView *_tableView;
    TreeNode *root;
}
-(void)funcTwitterReq;
@end
