//
//  GPSViewController.h
//  Photoprj
//
//  Created by gaurav sinha on 06/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface GPSViewController : UIViewController {
	IBOutlet MKMapView  *mapView;
	MKReverseGeocoder *geoCoder;
	MKPlacemark *mPlacemark;
	CLLocationCoordinate2D location;
	BOOL landmode;
	BOOL portrMode;

}
@property (nonatomic, retain) 	IBOutlet MKMapView  *mapView;


@end
