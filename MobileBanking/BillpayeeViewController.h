//
//  BillpayeeViewController.h
//  MobileBanking
//
//  Created by CHROME INFOTECH  on 26/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//  Email: gauravs@chromeinfotech.com



/////////////////////////////////
//@Description : This class is for 
//billpayee tabbar
////////////////////////////////

#import "UserViewController.h"

#import <UIKit/UIKit.h>


@interface BillpayeeViewController : UIViewController
{
	@private
	NSMutableArray			*array_Summary;         
	NSMutableArray			*array_Billpayee;    ///////To store data from the JSON 
	IBOutlet UITableView    *table_Billpayer;   
	NSMutableArray          *array_Button;      /////Array of button in cell of tableview
	NSMutableArray          *arry_extra;         /////Array for extra like make payement
	NSMutableDictionary		*array_buttoncheck;  ///Araay of button clicked
	BOOL					_isButtonClicked;    ////Whether teh button is clicked
	NSMutableArray			*array_Table;    
	NSMutableArray			*array_buttonClicked; //Array of clicked button
}

@end
