//
//  MapForViewController.h
//  MyappFinder
//
//  Created by gaurav sinha on 15/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SharedInstance.h"
#import <MapKit/MapKit.h>
#import "MyAnnotation.h"
#import "iCodeBlogAnnotationView.h"
@interface MapForViewController : UIViewController<MKMapViewDelegate> {
	SharedInstance *share;
	NSMutableArray *arrayForMap;
	IBOutlet MKMapView *mapView;
	MKReverseGeocoder *geoCoder;
	MKPlacemark *mPlacemark;
	CLLocationCoordinate2D location;
	
}
@property (nonatomic, retain)IBOutlet MKMapView *mapView;
@end
