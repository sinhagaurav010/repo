//
//  NearByMapViewController.h
//  MyappFinder
//
//  Created by gaurav sinha on 07/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "SharedInstance.h"
#import "GetDirectionViewController.h"
#import "MyAnnotation.h"
@interface NearByMapViewController : UIViewController <MKMapViewDelegate>{
	IBOutlet MKMapView *mapView;
	//MKReverseGeocoder *geoCoder;
	SharedInstance *share;
	//MKPlacemark *mPlacemark;
	MKReverseGeocoder *geoCoder;
	MKPlacemark *mPlacemark;
	CLLocationCoordinate2D location;
}
@property (nonatomic, retain)IBOutlet MKMapView *mapView;

@end
