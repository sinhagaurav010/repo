//
//  SummryViewController.h
//  MobileBanking
//
//  Created by CHROME INFOTECH  on 25/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//   Email  :  gauravs@chromeinfotech.com


////////////////////////////////////////
//@Description:This class is for the
//summary section of project 
////////////////////////////////


#import <UIKit/UIKit.h>
#import  "Constant.h"
#import "UserViewController.h"

@interface SummryViewController : UIViewController
{
	NSInteger  selectedIndex;
	@private
	NSMutableArray			*array_Summary;  ////To store data in array extract from JSON
	NSMutableArray			*array_Table;    ////To store data in array extract from JSON used when table is reloaded
	IBOutlet  UITableView   *tableView_Summary;
	NSMutableArray			*array_Button;    ////To store the button in cell 
	NSMutableArray			*arry_extra;      /////To store data of extra like date etc.
	NSMutableDictionary		*array_buttoncheck;  
	BOOL					_isButtonClicked;  //////Whether button is clicked or not
	NSMutableArray			*array_buttonClicked;  //////Which buttons has been clicked
	
	//UIButton *customButton_expand ;

}
-(NSMutableArray *)savedata;
@end
