    //
//  GPSViewController.m
//  Photoprj
//
//  Created by gaurav sinha on 06/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GPSViewController.h"
#import "Global.h"
#import "MyAnnotation.h"
@implementation GPSViewController
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
	[self.navigationController setNavigationBarHidden:NO];
	self.navigationItem.title  =  @"Map";
	UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStylePlain target:self action:@selector(doneButtonClick:)];          
	self.navigationItem.rightBarButtonItem = anotherButton;
	if(anotherButton)
	{
		[anotherButton   release];
		anotherButton  =  nil;
	}
	mapView = [[MKMapView alloc]initWithFrame:self.view.bounds];
	[self.view insertSubview:mapView atIndex:1];
	
	//mapView.showsUserLocation=TRUE;
	mapView.mapType=MKMapTypeStandard;
	[mapView setDelegate:self];
	//mapView.delegate   =  self;
	/*Region and Zoom*/
	MKCoordinateRegion region;
	MKCoordinateSpan span;
	span.latitudeDelta=0.003;
	span.longitudeDelta=0.003;
	//-14.179186,-50.449219
	//38.712907,-9.134295
		location.latitude             =38.712907;
		location.longitude			  = -9.134295;
		region.span=span;
		region.center=location;
		[self.mapView setRegion:region animated:TRUE];
		
		[self.mapView regionThatFits:region];
		self.mapView.showsUserLocation = TRUE;
		self.mapView.zoomEnabled = YES;
		MyAnnotation *addAnnotation   = [[[MyAnnotation alloc] initWithCoordinate:location ] retain];
			//MyAnnotation* addAnnotation = [[MyAnnotation alloc]initWithCoordinate:location andID:i];
		
		
		//annotation.mTitle = annData.title;
		/// annotation.mSubtitle = annData.subtitle;
		// addAnnotation.ann_tag = i;
		///addAnnotation.ann_tag   =   i;
	/*	[addAnnotation setAnn_tag:i];
		NSString   *title_string    =  [array_ATMcity objectAtIndex:i];//,[array_ATMstate  objectAtIndex:i],[array_ATMzip objectAtIndex:i]];
		title_string				=	[title_string  stringByAppendingFormat:@","];
		title_string                =   [title_string  stringByAppendingString:[array_ATMstate  objectAtIndex:i]];
		title_string				=	[title_string  stringByAppendingFormat:@" "];
		
		title_string                =   [title_string  stringByAppendingString:[array_ATMzip objectAtIndex:i]];
		//  title_string				=  [title_string stringValue];
		NSLog(@"title_string  title_string  ->>>>>>>%@",title_string);*/
		//[addAnnotation setTitle:[array_ATMstreet objectAtIndex:i]];
		
		//[addAnnotation  setSubtitle:[NSString stringWithFormat:@"%@%@",[array_ATMcity objectAtIndex:i],[array_ATMstate objectAtIndex:i]]];
		//[addAnnotation setTitle:title_string];  
        //  [addAnnotation set]  
		//[addAnnotation  setTitle:@" "];
		[addAnnotation  setSubtitle:@"R. da Costa do Castelo 7"];
	[addAnnotation   setTitle:@"1100 Lisboa, Portugal"];
		/*UIView  *view_details         =  [[UIView alloc ]init];
		 view_details.frame            = CGRectMake(0, 0, 100,100);
		 view_details.backgroundColor  =  [UIColor redColor];
		 addAnnotation.annotation_view =  view_details;
		 */
	//	_index  =  i;
		[self.mapView addAnnotation:addAnnotation];
	
	
	//-14.179186,-50.449219
	[super viewDidLoad];
}

-(IBAction)doneButtonClick:(id)sender
{
	[self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapview viewForAnnotation:(id <MKAnnotation>)annotation
{
	NSString *string   =   mPlacemark.locality;
	NSLog(@"vdsv");
	NSLog(@"location-------------%f",annotation.coordinate.latitude);
	
	MKPinAnnotationView *annView = nil;
	(MKPinAnnotationView *)[mapview dequeueReusableAnnotationViewWithIdentifier:string];
	
	// If we have to, create a new view
	
	annView = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:string] autorelease];
	//MKPinAnnotationView *annView=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:string];  
	
    annView.canShowCallout = YES;  
	NSLog(@"AAN----%f",annView.frame.origin.x);
	NSLog(@"AAN----%f",annView.frame.origin.y);
	NSLog(@"location%f",location.latitude);
	
	
	//[annView setSelected:YES];  	
	
	annView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
	
	[annView setPinColor:MKPinAnnotationColorGreen];
	
    annView.calloutOffset = CGPointMake(-5, 5);
	annView.animatesDrop=TRUE; 
    return annView;
}
-(void)ViewinLandscape
{
	CGRect	frame = CGRectMake(0, 0, 1024, 748);
	mapView.frame = frame;
}

-(void)ViewinPortrait
{
	CGRect	frame = CGRectMake(0, 0, 768, 1004);
	mapView.frame = frame;

}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
	
	if ((interfaceOrientation == UIInterfaceOrientationLandscapeLeft) || (interfaceOrientation == UIInterfaceOrientationLandscapeRight))
	{
		landmode_ph = 1;
		portrMode_ph = 0;
		landmode=1;
		
		NSLog(@"landscape");
		portrMode=0;
		[self ViewinLandscape];
		
	}
	else 
	{
		landmode=0;
		portrMode=1;
		landmode_ph = 0;
		portrMode_ph = 1;
		[self ViewinPortrait];
		
	}
    return YES;
    return YES;
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
    [super dealloc];
}


@end
