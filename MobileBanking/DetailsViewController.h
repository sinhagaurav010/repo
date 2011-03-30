//
//  DetailsViewController.h
//  MobileBanking
//
//  Created by CHROME INFOTECH  on 10/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//  Email:gauravs@chromeinfotech.com
///////////////////////////////////////////
//@description
//This class is for the details of 
//ATM like street ,city,wetherit is
//surcharged or not
/////////////////////////////////////////
#import <UIKit/UIKit.h>


@interface DetailsViewController : UIViewController
{
	IBOutlet   UILabel  *label_atmName;
	IBOutlet   UILabel  *label_atmstreet;
	IBOutlet   UILabel  *label_atmcity;
 	IBOutlet   UILabel  *label_atmZip;
	IBOutlet   UILabel  *label_atmState;
	IBOutlet   UILabel  *label_atmSurcharge;
	IBOutlet   UILabel  *label_atmDeposit;
}

@end
