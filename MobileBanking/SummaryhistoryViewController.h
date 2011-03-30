//
//  SummaryhistoryViewController.h
//  MobileBanking
//
//  Created by CHROME INFOTECH  on 27/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
//  Email:gauravs@chromeinfotech.com


////////////////////////////////////////
//@Description:This class is for the 
//summary history section of project 
////////////////////////////////

#import <UIKit/UIKit.h>
#import "SummaryTableViewController.h"
#import "UserViewController.h"


@interface SummaryhistoryViewController : UIViewController
{
	@private
	BOOL                  _isButtonClicked;	//////Which buttons has been clicked

	IBOutlet UITableView  *table_History;
	NSMutableArray        *array_history;	////To store data in array extract from JSON
	NSMutableArray        *array_Fordate;	////To store data in array extract from JSON used when table is reloaded
	NSMutableArray        *array_transfer;	/////To store data of extra like date etc.
	NSMutableArray		  *array_balance;	/////To store data of extra like date etc.
	NSMutableArray		  *array_effectiveDate;		/////To store data of extra like date etc.
	NSMutableArray        *array_dateeffective;		/////To store data of extra like date etc.
	NSMutableDictionary   *array_buttoncheck; 	////To store the button in cell 
	NSMutableArray        *array_Button;	////To store the button in cell 
	NSMutableArray        *array_SummaryHistory;
	NSMutableArray        *array_storeData;
	NSMutableArray        *array_Key;
	NSInteger             _numOfclicked;
	NSInteger             _clickedButon;	//////Whether button is clicked or not

	BOOL				  _tocheckyes;
	BOOL			      _tocheckCount;
    int					  _senderTag ;
	NSMutableArray		  *array_clickedButton;
	NSMutableArray        *array_tocheckButton;
}

@end
