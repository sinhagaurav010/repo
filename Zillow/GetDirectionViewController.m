//
//  GetDirectionViewController.m
//  Zillow
//
//  Created by gaurav sinha on 24/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GetDirectionViewController.h"
#import "Global.h"
#import "Modal.h"
#import "DetectNetworkConnection.h"

@implementation GetDirectionViewController
@synthesize mapView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
        [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    NSLog(@"getdir");
    [self.navigationItem setTitle:@"Direction"];
    mapView = [[MKMapView alloc]initWithFrame:CGRectMake(0, 44, 320, 384)];
	[self.view insertSubview:mapView atIndex:1];
	
	//mapView.showsUserLocation=TRUE;
	mapView.mapType	= MKMapTypeStandard;
	[self.mapView setDelegate:self];
	
	/*Region and Zoom*/
	MKCoordinateRegion region;
	MKCoordinateSpan span;
	span.latitudeDelta=0.05;
	span.longitudeDelta=0.05;
		
    location.latitude = 34.236855; 
		location.longitude = -118.536097;
		region.span=span;
		self.mapView.showsUserLocation = TRUE;
		self.mapView.zoomEnabled	   = YES;
		
		region.center=location;
		[self.mapView setRegion:region animated:TRUE];
		[self.mapView regionThatFits:region];
		
		
		MyAnnotation *addAnnotation	   = [[[MyAnnotation alloc] initWithCoordinate:location ] retain];
		
		
		[addAnnotation setTitle:@"Jeff Black"];
		 
		[self.mapView addAnnotation:addAnnotation];
	


[super viewDidLoad];
// Do any additional setup after loading the view from its nib.
}

#pragma mark -
#pragma mark viewForAnnotation

- (MKAnnotationView *)mapView:(MKMapView *)mapview viewForAnnotation:(id <MKAnnotation>)annotation
{
	NSString *string   =   mPlacemark.locality;
	MyAnnotation *anno = (MyAnnotation*)annotation;
	MKPinAnnotationView *annView = nil;
	
    //	(MKPinAnnotationView *)[mapview dequeueReusableAnnotationViewWithIdentifier:string];
	
	// If we have to, create a new view
	
	annView = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:string] autorelease];
	
    annView.canShowCallout = YES;  
	//annView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
	
	annView.calloutOffset = CGPointMake(-5, 5);
	annView.animatesDrop=TRUE; 
    return annView;
}

    
    
    
    
#pragma -
#pragma FinalGetLocation

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
