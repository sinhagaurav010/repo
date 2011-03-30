//
//  PlaceDetailViewController.h
//  Zillow
//
//  Created by gaurav sinha on 11/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlaceDetailViewController.h"
#import "PropertyImaeViewController.h"
#import <MessageUI/MessageUI.h>
#import "ModalHUD.h"
#import "Global.h"
@interface PlaceDetailViewController : UIViewController<UIGestureRecognizerDelegate,MFMailComposeViewControllerDelegate> {
	NSMutableDictionary *DictDetail;
//	IBOutlet UILabel *labelCity;
//	IBOutlet UILabel *labelStreet;
//	IBOutlet UILabel *labelZip;
//	IBOutlet UILabel *labelSizeSqrFt;
//	IBOutlet UILabel *labelFinishedSqFt;
//	IBOutlet UILabel *labelBathrooms;
//	IBOutlet UILabel *labelBedRooms;
	IBOutlet UIView *viewForImage;
	IBOutlet UIImageView *_imageView;
	IBOutlet UITableView *_tableView;
	NSMutableArray *arrayImages;
	NSMutableArray *arrayViewCell;
	
	UIView *viewCell;
	UILabel *labelEle;
 
}

-(void)viewForCell;
@property(nonatomic,retain)		NSMutableDictionary *DictDetail;
@property(nonatomic,retain)			NSMutableArray *arrayImages;

@end
