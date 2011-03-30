//
//  PhotoViewController.h
//  Photoprj
//
//  Created by gaurav sinha on 03/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"

@interface PhotoViewController : UIViewController 
{
	UIView *view_icons;
	NSTimer   *timer;
	NSMutableString			*currentElementValue;
	IBOutlet UIView         *view_main;
	IBOutlet UIScrollView  *scrll_view;
		NSMutableArray        *array_fromButton;
	NSMutableArray        *arry_foldersButon;
	UIButton *button_rest;
	UIButton *button_coffes ;
	UIButton *button_night;
	UIButton *button_hotel;
	UIButton *button_transportation;
	UIButton *button_museumsunsigthseing;
	UIButton *button_shopping;
	UILabel *label_lisbon;
	UIButton *button_About;
	UIButton *button_Sponsor;
	NSMutableArray *button_array;
	UIActivityIndicatorView *activeindicator;
	float incX;
	float incY;
   // NSMutableArray          *arrayOfImageGallery;
}

@end
