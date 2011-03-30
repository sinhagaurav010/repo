//
//  WebbrowserViewController.h
//  Tabwebbrowser
//
//  Created by Vinsol on 24/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WebbrowserViewController : UIViewController 
{
	IBOutlet  UISearchBar   *search_Bar;
	IBOutlet  UIWebView     *webView;
	UIImageView             *imageView1;
	IBOutlet  UIButton      *button_left;
	IBOutlet  UIButton      *button_Right;
	IBOutlet  UIButton      *button_Go;
	IBOutlet  UIButton      *button_Back;
	CGRect frameOfScroll;
	IBOutlet  UIButton      *button_forward;
	IBOutlet  UIButton      *button_refresh;
	IBOutlet  UIButton      *button_Add;
	IBOutlet  UIScrollView  *scroll_view;
	UIWebView   *webView1;
    NSMutableArray          *array_webView;
	NSMutableArray          *array_butncls;
	NSMutableArray          *array_butnshow;
	NSMutableArray			*array_imageView;
	NSInteger   _whichOneClicked;
	NSInteger _numOfWeb;
	NSInteger incX;
	NSInteger incinRbhtScrl;
	NSInteger incinLftscrl;
	NSInteger clicked_One;
	NSMutableArray *array_searchBar;
	NSMutableArray *array_backButton;
	NSMutableArray *array_forwardbutton;
	NSMutableArray *array_refreshbutton;
	BOOL landmode;
	BOOL portrMode;
	NSMutableDictionary *dict_web;
}

-(IBAction)gotoscrollleft:(id)sender;
-(IBAction)gotoscrollright:(id)sender;
-(IBAction)gototheURL:(id)sender;
-(IBAction)Addnew:(id)sender;
@end
