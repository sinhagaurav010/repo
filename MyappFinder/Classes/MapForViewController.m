//
//  MapForViewController.m
//  MyappFinder
//
//  Created by gaurav sinha on 15/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapForViewController.h"
#import "DataController.h"

@implementation MapForViewController
@synthesize mapView;
// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
		
	share = [SharedInstance sharedInstance];
	//arrayForMap	= [NSMutableArray new];
	//arrayForMap	= [DataController sortByCountry:[[share gettheMutablearrayWithSort] objectAtIndex:[share getFieldValueAtPos:2]]];
	[self.navigationItem setTitle:@"Map"];
	mapView = [[MKMapView alloc]initWithFrame:self.view.bounds];
	[self.view insertSubview:mapView atIndex:1];
	
	//mapView.showsUserLocation=TRUE;
	mapView.mapType	= MKMapTypeStandard;
	[self.mapView setDelegate:self];
	//mapView.delegate   =  self;
	/*Region and Zoom*/
	MKCoordinateRegion region;
	MKCoordinateSpan span;
	span.latitudeDelta=0.3*[[share getlocationLat]count];
	span.longitudeDelta=0.3*[[share getlocationLat]count];
	
	for(int i = 0;i<[[share getlocationLat] count];i++)
	{
	location.latitude             = [[[share getlocationLat] objectAtIndex:i]floatValue];
	location.longitude			  = [[[share getlocationLog] objectAtIndex:i]floatValue];
	region.span=span;
	self.mapView.showsUserLocation = TRUE;
	self.mapView.zoomEnabled	   = YES;

	region.center=location;
	[self.mapView setRegion:region animated:TRUE];
	[self.mapView regionThatFits:region];
		
	MyAnnotation *addAnnotation	   = [[[MyAnnotation alloc] initWithCoordinate:location ] retain];
	//[addAnnotation setTitle:[[arrayForMap objectAtIndex:i] objectForKey:@"store_name"]];
		[addAnnotation setTitle:[[share getArrayName]objectAtIndex:i] ];
	[self.mapView addAnnotation:addAnnotation];
	}
	
	
    [super viewDidLoad];
}


////////Add the annotation in the map view
- (MKAnnotationView *)mapView:(MKMapView *)mapview viewForAnnotation:(id <MKAnnotation>)annotation
{
	NSString *string   =   mPlacemark.locality;
	
	MKPinAnnotationView *annView = nil;
	iCodeBlogAnnotationView *annotationView = nil;
	
	
	if (annotation == mapView.userLocation) {
		return annotationView;
		
	}
	
	
	MyAnnotation* myAnnotation = (MyAnnotation *)annotation;
	annView = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:string] autorelease];

	(MKPinAnnotationView *)[mapview dequeueReusableAnnotationViewWithIdentifier:string];
	
	// If we have to, create a new view
	
	annView = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:string] autorelease];
	//MKPinAnnotationView *annView=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:string];  
	
	annView.canShowCallout = YES;  
	
	//[annView setSelected:YES];  	
	
	annView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
	
	[annView setPinColor:MKPinAnnotationColorPurple];
	
	annView.calloutOffset = CGPointMake(-5, 5);
	annView.animatesDrop=TRUE; 
	return annView;
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
