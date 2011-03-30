//
//  UserLocationController.m
//  Zillow
//
//  Created by gaurav sinha on 12/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UserLocationController.h"
#import "Global.h"

@implementation UserLocationController
-(void)findUserLocation
{
	locmanager = [[CLLocationManager alloc] init];
	[locmanager setDelegate:self];
	[locmanager setDesiredAccuracy:kCLLocationAccuracyBest];
	[locmanager startUpdatingLocation];
	
}

#pragma mark -
#pragma mark didUpdateToLocation

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
	// Log the kind of accuracy we got from this
	
	// Location has been found. Create GMap URL
	//CLLocationCoordinate2D loc = [newLocation coordinate];
//	[arrayLat addObject:[NSString stringWithFormat:@"%f",loc.latitude]];
//	[arrayLong addObject:[NSString stringWithFormat:@"%f",loc.longitude]];
//	DIRECTION
	[locmanager stopUpdatingLocation];
    locUser = newLocation;
    [[NSNotificationCenter defaultCenter] postNotificationName:DIRECTION object:nil];
    
	MKReverseGeocoder *geocoder = [[MKReverseGeocoder alloc] initWithCoordinate:newLocation.coordinate];
	geocoder.delegate = self;
	[geocoder start];
}

- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)placemark
{
	ZipCode = placemark.postalCode;
	[[NSNotificationCenter defaultCenter] postNotificationName:USERLOCNOT object:nil];
	
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
}

	
- (void)dealloc {
    [locmanager release];
    [super dealloc];
}

@end
