//
//  SearchViewController.h
//  Zillow
//
//  Created by gaurav sinha on 10/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XmlParser.h"
#import <MapKit/MapKit.h>
#import "iCodeBlogAnnotationView.h"
#import "MyAnnotation.h"
#import "PlaceDetailViewController.h"
#import "Modal.h"
#import "Global.h"
#import "WebViewContrller.h"


@interface SearchViewController : UIViewController<MKMapViewDelegate,UISearchBarDelegate>
{
	IBOutlet UISearchBar *_searchBar;
	NSMutableArray *arrayAnn;
	NSMutableArray *arrayNearByDetails;
	IBOutlet MKMapView *mapView;
	//MKReverseGeocoder *geoCoder;
	NSInteger _counter;
	MKPlacemark *mPlacemark;
	CLLocationCoordinate2D location;
	NSString *string_xml;
	UIActivityIndicatorView *spinner;
}
-(void)dataArrive;
@property (nonatomic, retain)IBOutlet MKMapView *mapView;
@property(nonatomic,retain)NSMutableArray *arrayNearByDetails;
@property(nonatomic,copy)NSString *string_xml;
-(void)functionForMapView;
-(void)alertForNoNetwork;
-(void)startFind:(BOOL)isThroughUserLocation;


@end
