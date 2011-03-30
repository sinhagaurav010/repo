//
//  NearByMapViewController.m
//  MyappFinder
//
//  Created by gaurav sinha on 07/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NearByMapViewController.h"
#import "DataController.h"

@implementation NearByMapViewController
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
/*NSString *url1 = [NSString stringWithFormat: @"http://maps.google.com/maps?saddr=%f,%f&daddr=%f,%f", 36.17191,-115.14,36.17489,-115.1371];	
 NSURL *url = [NSURL URLWithString:url1];
 NSURLRequest *request = [NSURLRequest requestWithURL:url];
 [webview loadRequest:request];*/
-(IBAction)doneButtonClick:(id)sender
{
	GetDirectionViewController *objGetDirectionViewController = [GetDirectionViewController new];
	[self.navigationController pushViewController:objGetDirectionViewController animated:YES];
	if(objGetDirectionViewController)
	{
		[objGetDirectionViewController release];
		objGetDirectionViewController = nil;
	}
}
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
	UIBarButtonItem *DirectionButton				= [[UIBarButtonItem alloc] initWithTitle: @"Direction" style: UIBarButtonItemStyleBordered target:self action:@selector(doneButtonClick:)];
	self.navigationItem.rightBarButtonItem = DirectionButton;
	[DirectionButton release];
	
	
	[self.navigationItem setTitle:@"Map"];
	share = [SharedInstance sharedInstance];
	
	if(LOG)
		NSLog(@"%@",[[[share gettheArray] objectAtIndex:[share getFieldValueAtPos:1]] objectForKey:@"longitude"]);
	
	mapView = [[MKMapView alloc]initWithFrame:self.view.bounds];
	[self.view insertSubview:mapView atIndex:1];
	
	//mapView.showsUserLocation=TRUE;
	mapView.mapType	= MKMapTypeStandard;
	[self.mapView setDelegate:self];
	//mapView.delegate   =  self;
	/*Region and Zoom*/
	MKCoordinateRegion region;
	MKCoordinateSpan span;
	span.latitudeDelta=0.03;
	span.longitudeDelta=0.03;
	
	location.latitude             = [[[share getTheSaveDictionary] objectForKey:@"latitude"]floatValue];
	location.longitude			  = [[[share getTheSaveDictionary] objectForKey:@"longitude"]floatValue];
	region.span=span;
	region.center=location;
	[self.mapView setRegion:region animated:TRUE];
			
	[self.mapView regionThatFits:region];
	self.mapView.showsUserLocation = TRUE;
	self.mapView.zoomEnabled	   = YES;
	MyAnnotation *addAnnotation	   = [[[MyAnnotation alloc] initWithCoordinate:location ] retain];
		
	[addAnnotation setTitle:[[share getTheSaveDictionary] objectForKey:@"store_name"]];
			
	[self.mapView addAnnotation:addAnnotation];
    [super viewDidLoad];
}
/////////Code to add the annotation
- (MKAnnotationView *)mapView:(MKMapView *)mapview viewForAnnotation:(id <MKAnnotation>)annotation
{
	NSString *string   =   mPlacemark.locality;

	MKPinAnnotationView *annView = nil;
	(MKPinAnnotationView *)[mapview dequeueReusableAnnotationViewWithIdentifier:string];
	
	// If we have to, create a new view
	
	annView = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:string] autorelease];
	//MKPinAnnotationView *annView=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:string];  
	
    annView.canShowCallout = YES;  
	
	//[annView setSelected:YES];  	
	
	annView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
	
	[annView setPinColor:MKPinAnnotationColorGreen];
	
    annView.calloutOffset = CGPointMake(-5, 5);
	annView.animatesDrop=TRUE; 
    return annView;
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


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
	[mapView release];
    [super dealloc];
}


@end
