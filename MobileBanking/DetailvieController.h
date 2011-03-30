//
//  DetailvieController.h
//  MobileBanking
//
//  Created by CHROME INFOTECH  on 02/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//   Email:gauravs@chromeinfotech.com
///////////////////////////////////////////
//@description
//This class is to search the  
//ATM by street ,cty ,zip,state 
//////////////////////////////////////////
#import <UIKit/UIKit.h>
#import "DetailsViewController.h"


@interface DetailvieController : UIViewController
{
	@private
	IBOutlet   UIButton      *buttton_apply;
	IBOutlet    UITextField  *text_street;
	IBOutlet   UITextField   *text_city;
	IBOutlet   UITextField   *text_zip;
	IBOutlet   UITextField   *text_state; 
    //IBOutlet   UIBarButtonItem  *bar_buttom;
  	NSMutableArray           *array_ATMzip;
	NSMutableArray           *array_ATMstreet;
	NSMutableArray           *array_ATMcity;
	NSMutableArray           *array_ATMstate;
	IBOutlet    UIScrollView   *scrlView;
	IBOutlet    UINavigationBar  *navigationBar;
	BOOL   _searchByZip;
	BOOL   _searchByCity;
	BOOL   _searchByStreet;
	BOOL   _searchByState;
}
-(IBAction)clickonapply:(id)sender;
-(IBAction)userdidenteringtext:(id)sender;

@end
