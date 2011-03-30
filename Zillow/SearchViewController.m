//
//  SearchViewController.m
//  Zillow
//
//  Created by gaurav sinha on 10/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SearchViewController.h"
#import "UserLocationController.h"
#import "DetectNetworkConnection.h"
#define URLSTR @"http://www.zillow.com/webservice/GetSearchResults.htm?zws-id=X1-ZWz1bw8guo3swb_61q4u&address=98109&citystatezip=98109"
@implementation SearchViewController
@synthesize mapView,arrayNearByDetails,string_xml;
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

#pragma mark -
#pragma mark Refresh
-(void)Refresh
{
	if([DetectNetworkConnection isNetworkConnectionActive] == 1)
	{
	[self startFind:1];
	}
	else {
		[self alertForNoNetwork];
	}

	//[[NSNotificationCenter defaultCenter] removeObserver:self name:USERLOCNOT object:nil];
	
	//UserLocationController *userLoc = [[UserLocationController alloc] init];
	//	[userLoc findUserLocation];
	//	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(FinalGetLocation:) name:USERLOCNOT object:nil];

}

- (void)viewDidLoad
{
	if([DetectNetworkConnection isNetworkConnectionActive] == 1)
	{
	_searchBar.placeholder = @"Zip";
	[super viewDidLoad];	
	_searchBar.delegate = self;
	[self startFind:1];
	//UIBarButtonItem *newBackButton				= [[UIBarButtonItem alloc] initWithTitle:nil style: UIBarButtonSystemItemSearch target:self action:@selector(Close)];
	UIBarButtonItem *searchButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(Refresh)];
	 self.navigationItem.rightBarButtonItem = searchButton;
	//[self.navigationItem.leftBarButtonItem setStyle:UIBarButtonSystemItemSearch];
	[searchButton release];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(errorNotification:) name:ERROR object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(aNotificationHandler:) name:@"MyNotification" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(FinalGetLocation:) name:USERLOCNOT object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(zipIdFunc:) name:ZIPIDNOT object:nil];
		
	}
	else 
	{
		[self alertForNoNetwork];
	}

	//_counter = 0;
	
}

-(void)alertForNoNetwork
{
	UIAlertView *alert	 = [[UIAlertView alloc] initWithTitle:@"Info" message:@"No Connection Found" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert show];
	[alert release];
}

#pragma mark -
#pragma mark errorNotification
- (void)errorNotification:(NSNotification*)notification  
{
	[self dataArrive];
	UIAlertView *alert	 = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Error in URL" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert show];
	[alert release];
}


-(void)startSpining
{
	if(mapView!=nil)
	mapView.userInteractionEnabled = NO;
	
	_searchBar.userInteractionEnabled = NO;
	//[self.navigationController setNavigationBarHidden:YES];
	spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	[spinner setCenter:CGPointMake(kScreenWidth/2.0, kScreenHeight/2.0)]; // I do this because I'm in landscape mode
	[self.view addSubview:spinner]; // spinner is not visible until started
	[spinner startAnimating];

}
#pragma mark -
#pragma mark isThroughUserLocation

-(void)startFind:(BOOL)isThroughUserLocation
{
	[[NSNotificationCenter defaultCenter] removeObserver:self name:@"MyNotification" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(aNotificationHandler:) name:@"MyNotification" object:nil];
	
	
	if(isThroughUserLocation == 1)
	{
		[self startSpining];
		UserLocationController *userLoc = [[UserLocationController alloc] init];
		[userLoc findUserLocation];
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(FinalGetLocation:) name:USERLOCNOT object:nil];
	}
	
	else 
	{
		if([_searchBar.text length]>0)
		{
			[self startSpining];
		Modal *modl = [[Modal alloc] init];
		[modl returnArrayWithString:[NSString stringWithFormat:@"http://www.zillow.com/webservice/GetSearchResults.htm?zws-id=X1-ZWz1bw8guo3swb_61q4u&address=%@&citystatezip=%@",_searchBar.text,_searchBar.text] :1];
		[modl  release];
		//[modl returnArrayWithString:[NSString stringWithFormat:@"http://www.zillow.com/webservice/GetSearchResults.htm?zws-id=X1-ZWz1bw8guo3swb_61q4u&address=%@&citystatezip=%@",_searchBar.text,_searchBar.text]];
		}
		else 
		{
			UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Please Enter the Zipcode" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
			[alert show];
			[alert release];
		}

	}

}

#pragma mark -
#pragma mark searchBarSearchButtonClicked

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
	[self startFind:0];
	[searchBar resignFirstResponder];
}
- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
	[searchBar resignFirstResponder];
}
#pragma mark -
#pragma mark FinalGetLocation

- (void)FinalGetLocation:(NSNotification*)notification  
{
	if([DetectNetworkConnection isNetworkConnectionActive] == 1)
	{
	Modal *modl = [[Modal alloc] init];
	[modl returnArrayWithString:[NSString stringWithFormat:@"http://www.zillow.com/webservice/GetSearchResults.htm?zws-id=X1-ZWz1bw8guo3swb_61q4u&address=%@&citystatezip=%@",ZipCode,ZipCode] :1];
	}
	else 
	{
		[self alertForNoNetwork];
	}

	//[modl returnArrayWithString:[NSString stringWithFormat:@"http://www.zillow.com/webservice/GetSearchResults.htm?zws-id=X1-ZWz1bw8guo3swb_61q4u&address=%@&citystatezip=%@",ZipCode,ZipCode]];
}

#pragma mark -
#pragma mark aNotificationHandler

- (void)aNotificationHandler:(NSNotification*)notification  
{
	
	NSMutableArray  *array_element  =  [NSMutableArray new];
	[array_element  addObject:@"SearchResults:searchresults"];
	[array_element  addObject:@"result"];
	[array_element  addObject:@"request"];
	[array_element  addObject:@"address"];
	[array_element  addObject:@"citystatezip"];
	[array_element  addObject:@"message"];
	[array_element  addObject:@"text"];
	[array_element  addObject:@"code"];
	[array_element  addObject:@"response"];
	[array_element  addObject:@"results"];
	[array_element  addObject:@"zpid"];
	[array_element  addObject:@"links"];
	[array_element  addObject:@"homedetails"];
	[array_element  addObject:@"mapthishome"];
	[array_element  addObject:@"comparables"];
	[array_element  addObject:@"address"];
	[array_element  addObject:@"street"];
	[array_element  addObject:@"zipcode"];
	[array_element  addObject:@"city"];
	[array_element  addObject:@"state"];
	[array_element  addObject:@"latitude"];
	[array_element  addObject:@"longitude"];
	[array_element addObject:@"amount"];
	
	arrayNearByDetails = [NSMutableArray new];
	
	arrayNearByDetails=[XmlParser  sharedparseeee:stringXml :array_element];
		
	if([arrayNearByDetails count]>0)
	{
	if([[[arrayNearByDetails objectAtIndex:0] objectForKey:@"text"] isEqualToString:@"Request successfully processed"])
	{
		[self functionForMapView];
	}
	else 
	{
		[self dataArrive];
		UIAlertView *alert_View = [[UIAlertView alloc] initWithTitle:@"Error" message:[[arrayNearByDetails objectAtIndex:0] objectForKey:@"text"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert_View show];
		[alert_View release];
	}
	}
	else 
	{
		[self dataArrive];
		UIAlertView *alert_View = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Error Error" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert_View show];
		[alert_View release];
	}
	[[NSNotificationCenter defaultCenter] removeObserver:self name:@"MyNotification" object:nil];

	
}


-(void)dataArrive
{
	_searchBar.userInteractionEnabled = YES;
	mapView.userInteractionEnabled = YES;
	[spinner stopAnimating];
//	[self.navigationController setNavigationBarHidden:NO];
}

-(NSString*)placeComma:(NSString*)string
{
	NSString *myString = [string substringWithRange:NSMakeRange(0, [string length]-3)];
	NSString *string2 = [string substringFromIndex:([string length]-3)];
	NSString *str = [NSString stringWithFormat:@"%@,%@",myString,string2];
	return str;
}
#pragma mark -
#pragma mark functionForMapView

-(void)functionForMapView
{
	[self dataArrive];
	if(mapView!=nil)
	{
		[mapView removeFromSuperview];
		[mapView release];
		mapView = nil;
	}
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
	arrayAnn = [[NSMutableArray alloc] init];
	for(int i = 0;i<[arrayNearByDetails count];i++)
	{
		location.latitude = [[[arrayNearByDetails objectAtIndex:i] objectForKey:@"latitude"]floatValue];
		location.longitude = [[[arrayNearByDetails objectAtIndex:i] objectForKey:@"longitude"]floatValue];
		region.span=span;
		self.mapView.showsUserLocation = TRUE;
		self.mapView.zoomEnabled	   = YES;
		
		region.center=location;
		[self.mapView setRegion:region animated:TRUE];
		[self.mapView regionThatFits:region];
		
		
		MyAnnotation *addAnnotation	   = [[[MyAnnotation alloc] initWithCoordinate:location ] retain];
		[addAnnotation setAnn_tag:i];
		[arrayAnn addObject:addAnnotation];
		
		[addAnnotation setTitle:[[arrayNearByDetails objectAtIndex:i] objectForKey:@"street"] ];
		if([[arrayNearByDetails objectAtIndex:i]objectForKey:@"amount"]!=nil)
		{
			if([[[arrayNearByDetails objectAtIndex:i]objectForKey:@"amount"] length]>0)
				[addAnnotation setSubtitle:[NSString stringWithFormat:@"$%@",[self placeComma:[[arrayNearByDetails objectAtIndex:i] objectForKey:@"amount"]]]];
		}
		[self.mapView addAnnotation:addAnnotation];
	}
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
	annView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
	for(int i=0;i<[arrayAnn count];i++)
	{
		if([(MyAnnotation*)[arrayAnn objectAtIndex:i] isEqual:anno])
		{
			annView.rightCalloutAccessoryView.tag = i;
			break;
		}
	}
	annView.calloutOffset = CGPointMake(-5, 5);
	annView.animatesDrop=TRUE; 
    return annView;
}

#pragma mark -
#pragma mark zipIdFunc

- (void)zipIdFunc:(NSNotification*)notification  
{
	NSMutableArray  *array_element  =  [NSMutableArray new];
	[array_element  addObject:@"UpdatedPropertyDetails:updatedPropertyDetails"];
	[array_element  addObject:@"response"];
	[array_element  addObject:@"request"];
	[array_element  addObject:@"message"];
	[array_element  addObject:@"text"];
	[array_element  addObject:@"code"];
	[array_element  addObject:@"text"];
	[array_element  addObject:@"zpid"];
	[array_element  addObject:@"address"];
	[array_element  addObject:@"street"];
	[array_element  addObject:@"zipcode"];
	[array_element  addObject:@"city"];
	[array_element  addObject:@"state"];
	[array_element  addObject:@"latitude"];
	[array_element  addObject:@"longitude"];
	[array_element  addObject:@"editedFacts"];
	[array_element  addObject:@"useCode"];
	[array_element  addObject:@"bedrooms"];
	[array_element  addObject:@"bathrooms"];
	[array_element  addObject:@"finishedSqFt"];
	[array_element  addObject:@"lotSizeSqFt"];
	[array_element  addObject:@"yearBuilt"];
	[array_element  addObject:@"yearUpdated"];
	[array_element  addObject:@"numFloors"];
	[array_element  addObject:@"basement"];
	[array_element  addObject:@"roof"];
	[array_element  addObject:@"price"];

	NSMutableArray *arrayDetails = [NSMutableArray new];
	arrayDetails=[XmlParser  sharedparseeee:stringXml :array_element];
	if([arrayDetails count]>0)
	{
		
		if([[[arrayDetails objectAtIndex:0] objectForKey:@"text"] isEqualToString:@"Request successfully processed"])
		{
			PlaceDetailViewController *placeDetailController = [[PlaceDetailViewController alloc] init];
			placeDetailController.DictDetail = [[NSMutableDictionary alloc] init];

			placeDetailController.arrayImages = [[NSMutableArray alloc] init];
			if([[arrayDetails objectAtIndex:0] objectForKey:@"imageUrl"]!=nil)
			{
				if([[[arrayDetails objectAtIndex:0] objectForKey:@"imageUrl"] count]>0)
				{
					for(int i=0;i<[[[arrayDetails objectAtIndex:0] objectForKey:@"imageUrl"] count];i++)
					{
						NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: [[[arrayDetails objectAtIndex:0] objectForKey:@"imageUrl"]objectAtIndex:i]]];
						[placeDetailController.arrayImages  addObject:[UIImage imageWithData:imageData]];
					    [imageData release];
					}
				}
			}
			//if([[arrayDetails objectAtIndex:0] objectForKey:@"imageUrl"]!=nil)
			//	if([[[arrayDetails objectAtIndex:0] objectForKey:@"imageUrl"] count]>0)
			//		placeDetailController.arrayImages = (NSMutableArray*)[[arrayDetails objectAtIndex:0] objectForKey:@"imageUrl"];
				
			if([[arrayDetails objectAtIndex:0]objectForKey:@"zipcode"]!=nil)
			[placeDetailController.DictDetail setObject:[[arrayDetails objectAtIndex:0]objectForKey:@"zipcode"] forKey:@"Zip"];
			
			if([[arrayDetails objectAtIndex:0]objectForKey:@"state"]!=nil)
				[placeDetailController.DictDetail setObject:[[arrayDetails objectAtIndex:0]objectForKey:@"state"] forKey:@"state"];


			if([[arrayDetails objectAtIndex:0]objectForKey:@"yearBuilt"]!=nil)
				[placeDetailController.DictDetail setObject:[[arrayDetails objectAtIndex:0]objectForKey:@"yearBuilt"] forKey:@"yearBuilt"];
			
			
			if([[arrayDetails objectAtIndex:0]objectForKey:@"street"]!=nil)
			[placeDetailController.DictDetail setObject:[[arrayDetails objectAtIndex:0]objectForKey:@"street"] forKey:@"Street"];
			
			if([[arrayDetails objectAtIndex:0]objectForKey:@"price"]!=nil)
				[placeDetailController.DictDetail setObject:[[arrayDetails objectAtIndex:0]objectForKey:@"price"] forKey:@"price"];
			
			if([[arrayDetails objectAtIndex:0]objectForKey:@"city"]!=nil)
			[placeDetailController.DictDetail setObject:[[arrayDetails objectAtIndex:0]objectForKey:@"city"] forKey:@"City"];
			
			if([[arrayDetails objectAtIndex:0]objectForKey:@"finishedSqFt"]!=nil)
				[placeDetailController.DictDetail  setObject:[[arrayDetails objectAtIndex:0]objectForKey:@"finishedSqFt"] forKey:@"finishedSqFt"];
			
			if([[arrayDetails objectAtIndex:0]objectForKey:@"lotSizeSqFt"]!=nil)
				[placeDetailController.DictDetail  setObject:[[arrayDetails objectAtIndex:0]objectForKey:@"lotSizeSqFt"] forKey:@"lotSizeSqFt"];
			
			if([[arrayDetails objectAtIndex:0]objectForKey:@"bedrooms"]!=nil)
				[placeDetailController.DictDetail  setObject:[[arrayDetails objectAtIndex:0]objectForKey:@"bedrooms"] forKey:@"bedrooms"];
			
			if([[arrayDetails objectAtIndex:0]objectForKey:@"bathrooms"]!=nil)
				[placeDetailController.DictDetail  setObject:[[arrayDetails objectAtIndex:0]objectForKey:@"bathrooms"] forKey:@"bathrooms"];
			//[placeDetailController.DictDetail  setObject:[[arrayNearByDetails objectAtIndex:control.tag]objectForKey:@"bathrooms"] forKey:@"bathrooms"];

			[self dataArrive];
			[self.navigationController pushViewController:placeDetailController animated:YES];
			[placeDetailController release];
			
		}
		else
		{
			[self dataArrive];
			UIAlertView *alert  = [[UIAlertView alloc] initWithTitle:@"Info" message:@"No data available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
			[alert show];
			[alert release];
		}
	}
	else
	{
		[self dataArrive];
		UIAlertView *alert  = [[UIAlertView alloc] initWithTitle:@"Info" message:@"No data available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert show];
		[alert release];
	}
	[[NSNotificationCenter defaultCenter] removeObserver:self name:ZIPIDNOT object:nil];
	//[[NSNotificationCenter defaultCenter] removeObserver:self forKeyPath:ZIPIDNOT];
}
#pragma mark -
#pragma mark annotationView

-(void)mapView:(MKMapView *)mapView annotationView:(iCodeBlogAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{	
 	if([DetectNetworkConnection isNetworkConnectionActive] == 1)
	{
		if([[[arrayNearByDetails objectAtIndex:control.tag] objectForKey:@"homedetails"] length]>0)
		{
		WebViewContrller *webController = [[WebViewContrller alloc] init];
		webController.stringTitle = @"Details"; 
		webController.stringUrl = [[arrayNearByDetails objectAtIndex:control.tag] objectForKey:@"homedetails"];
		[self.navigationController pushViewController:webController animated:YES];
		[webController release];
		}
	////////////////////////////////////////////	
	//?[[NSNotificationCenter defaultCenter] removeObserver:self name:ZIPIDNOT object:nil];
	
		//?[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(zipIdFunc:) name:ZIPIDNOT object:nil];
		//?[self startSpining];
		
	//	Modal *mdl = [[Modal alloc] init];
	//		//	//[mdl returnArrayWithString:[NSString stringWithFormat:@"http://www.zillow.com/webservice/GetUpdatedPropertyDetails.htm?zws-id=X1-ZWz1bw8guo3swb_61q4u&zpid=63334886"] :0];
	//		[mdl returnArrayWithString:[[arrayNearByDetails objectAtIndex:control.tag] objectForKey:@"homedetails"] :0];
	//		[mdl  release];
		
		
	////////////////////////////////////////////	
	//NSLog(@"http://www.zillow.com/webservice/GetUpdatedPropertyDetails.htm?zws-id=X1-ZWz1bw8guo3swb_61q4u&zpid=%@",[[arrayNearByDetails objectAtIndex:control.tag] objectForKey:@"zpid"]);
       //? Modal *mdl = [[Modal alloc] init];
		//[mdl returnArrayWithString:[NSString stringWithFormat:@"http://www.zillow.com/webservice/GetUpdatedPropertyDetails.htm?zws-id=X1-ZWz1bw8guo3swb_61q4u&zpid=63334886"] :0];
        
       //? NSLog(@"id--------------000000---%@",[NSString stringWithFormat:@"http://www.zillow.com/webservice/GetUpdatedPropertyDetails.htm?zws-id=X1-ZWz1bw8guo3swb_61q4u&zpid=%@",[[arrayNearByDetails objectAtIndex:control.tag] objectForKey:@"zpid"]]);
		//?[mdl returnArrayWithString:[NSString stringWithFormat:@"http://www.zillow.com/webservice/GetUpdatedPropertyDetails.htm?zws-id=X1-ZWz1bw8guo3swb_61q4u&zpid=%@",[[arrayNearByDetails objectAtIndex:control.tag] objectForKey:@"zpid"]] :0];
		//?[mdl  release];
	////////////////////////////////////////////	
	//homedetails
	}
	else
	{
		[self alertForNoNetwork];
	}

		
}
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning 
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload 
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc 
{
	[[NSNotificationCenter defaultCenter] removeObserver:self name:USERLOCNOT object:nil];
	[[NSNotificationCenter defaultCenter] removeObserver:self name:ERROR object:nil];
	[[NSNotificationCenter defaultCenter] removeObserver:self name:@"MyNotification" object:nil];
	[[NSNotificationCenter defaultCenter] removeObserver:self name:ZIPIDNOT object:nil];

	//[[NSNotificationCenter defaultCenter] removeObserver:self name:ZIPIDNOT object:nil];
	[_searchBar release];
	[spinner release];
	[arrayAnn release];
	[arrayNearByDetails release];
	[mapView release];
    [super dealloc];
}


@end
