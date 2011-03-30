//
//  MapViewController_Ipad.h
//  MobileBanking
//
//  Created by CHROME INFOTECH  on 10/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//  Email:gauravs@chromeinfotech.com
////////////////////////////
//@Description
//This is map view controller for the 
//Ipad
//////////////////////////////

#import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MyAnnotation.h"
#import  "iCodeBlogAnnotationView.h"
#import "DetailsViewController.h"

@interface MapViewController_Ipad : UIViewController {
@private
	UIWebView			*webView ;
	IBOutlet MKMapView  *mapView;
	//NSMutableArray  *array_longnititude;
	//NSMutableArray   *array_latitude;
	MKReverseGeocoder *geoCoder;
	MKPlacemark *mPlacemark;
	CLLocationCoordinate2D location;
	IBOutlet  UIButton  *button_search;
	
	UIWindow		 * mapViewWindow;
    NSInteger        _index;
}
-(IBAction) timer_main_menu:(id)sender;
-(IBAction)clickedOnsearched:(id)sender;
@property (nonatomic, retain)IBOutlet MKMapView *mapView;
@end
