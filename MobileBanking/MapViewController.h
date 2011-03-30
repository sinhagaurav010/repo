//
//  MapViewController.h
//  MobileBanking
//
//  Created by CHROME INFOTECH  on 29/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//  Email:gauravs@chromeinfotech.com


////////////////////////////////////////
//@Description:This class is for the 
//Map section of project
////////////////////////////////


#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MyAnnotation.h"
#import  "iCodeBlogAnnotationView.h"
#import "DetailsViewController.h"

@interface MapViewController : UIViewController 
{
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
//-(void) timer_main_menu:(id)sender;
-(IBAction) timer_main_menu:(id)sender;
-(IBAction)clickedOnsearched:(id)sender;
@property (nonatomic, retain)IBOutlet MKMapView *mapView;
@end
