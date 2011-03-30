//
//  Constant.h
//  MobileBanking
//
//  Created by CHROME INFOTECH  on 25/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
#define  DEBUGG 1
#define  LOGINTITLE  @"Mobile Banking-Login"
#define  SUMMARYTITLE @"Summary"
#define  BILLPAYEETITLE @"Bill Payer"
#define  HISTORYTITLE   @"Account History"
#define  TRANSFERTITLE  @"Transfer"
#define  DETAILSTITLE   @"Details" 
//#define  BILLPAYEEMAKEPAYMENT @""

BOOL   _IPAD;
BOOL   _fromTabbar  ;
UITabBarController  *tabbarControllerGlbl;
UINavigationController  *navigation;

BOOL  _fromsearchOption;
NSMutableArray		  *array_savedData;
NSInteger				_whichValuePassed;

NSString				*billPayee;

NSMutableArray  *array_longnititude;
NSMutableArray   *array_latitude;
NSInteger   _indexOfAnnotaion;
NSMutableArray  *array_surcharge;
NSMutableArray  *array_deposit;

NSMutableArray   *array_ATMname;
NSMutableArray   *array_ATMaddress;
NSMutableArray   *array_ATMzip;
NSMutableArray   *array_ATMstreet;
NSMutableArray   *array_ATMcity;
NSMutableArray   *array_ATMstate;
NSMutableArray  *arry_foundElement;