//
//  FullViewController.h
//  Photoprj
//
//  Created by gaurav sinha on 03/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FullViewController : UIViewController
{
	IBOutlet UIImageView *image_view;
	IBOutlet UIButton *button_faceBook;
	IBOutlet UIButton *button_You;
	IBOutlet UIButton *button_gps;
	IBOutlet UIButton *button_home;
	IBOutlet UIButton *button_england;
	IBOutlet UIButton *button_portugal;
	IBOutlet UITextView *text_title;
    IBOutlet UIWebView *web_view;
	IBOutlet UILabel *label_email;
	IBOutlet UILabel *label_email_value;
	IBOutlet UILabel *label_address;
	IBOutlet UILabel *label_address_value;
	IBOutlet UILabel *label_fax;
	IBOutlet UILabel *label_fax_value;
	IBOutlet UILabel *label_value;
	IBOutlet UILabel *label;
	IBOutlet UIView *view1;
	IBOutlet UILabel *label_Morada;
	IBOutlet UILabel *label_Morada_value;
	
    CGRect frame_email;
	CGRect frame_email_val;
	CGRect frame_fax;
	CGRect frame_fax_val;
	CGRect frame_tel;
	CGRect frame_tele_val;
	CGRect frame_label_val;
	
	IBOutlet UITextView *txt_touch; 
	BOOL _inZoom;
	BOOL _chckZoom;

	UIScrollView *scrll;
	BOOL landmode;
	BOOL portrMode;
	CGRect frame_image;
	CGRect frame_web;
	CGRect frame_face;
	CGRect frame_gps;
	CGRect frame_home;
	CGRect frame_eng;
	CGRect frame_port;
	CGRect frame_label;
	CGRect frame_you;
	CGRect frame_text;
	
	UIButton *image_grp;
	UIButton *image_grp1;
}
-(IBAction)clicktogohome:(id)sender;
-(IBAction)clicktoyoutube:(id)sender;
-(IBAction)clickForGps:(id)sender;
-(IBAction)clickForFacebokk:(id)sender;
@end
