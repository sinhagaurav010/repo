//
//  GetDirectionViewController.h
//  Zillow
//
//  Created by gaurav sinha on 24/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserLocationController.h"
#import <MapKit/MapKit.h>
#import "iCodeBlogAnnotationView.h"
#import "MyAnnotation.h"

@interface GetDirectionViewController : UIViewController <MKMapViewDelegate>{
   
     MKMapView *mapView;
	//MKReverseGeocoder *geoCoder;
	NSInteger _counter;
	MKPlacemark *mPlacemark;
	CLLocationCoordinate2D location;
  
}
@property (nonatomic, retain) MKMapView *mapView;

@end
