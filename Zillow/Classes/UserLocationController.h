//
//  UserLocationController.h
//  Zillow
//
//  Created by gaurav sinha on 12/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CLLocationManagerDelegate.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface UserLocationController : NSObject<MKReverseGeocoderDelegate,CLLocationManagerDelegate>
{
CLLocationManager *locmanager;
}
-(void)findUserLocation;
@end
