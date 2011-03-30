    //
//  MapViewController_Ipad.m
//  MobileBanking
//
//  Created by CHROME INFOTECH  on 10/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MapViewController_Ipad.h"
#import "UserViewController.h"
#import "Constant.h"
#import "JSON.h"
#import "DetailvieController.h"


@implementation MapViewController_Ipad
@synthesize mapView;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	self.navigationItem.title  =  @"Map";
	UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(doneButtonClick:)];          
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
	[self.mapView setDelegate:self];
	//mapView.delegate   =  self;
	/*Region and Zoom*/
	MKCoordinateRegion region;
	MKCoordinateSpan span;
	span.latitudeDelta=0.05;
	span.longitudeDelta=0.05;
	
	if(_fromsearchOption == 0  && [arry_foundElement count]==0)
	{
		array_ATMname      =   [NSMutableArray  new];
		array_ATMaddress   =   [NSMutableArray  new]; 
		array_ATMzip	   =   [NSMutableArray  new];	
		array_ATMstreet    =   [NSMutableArray  new];
		array_ATMcity      =   [NSMutableArray  new];
		array_ATMstate     =   [NSMutableArray  new];
		
		
		
		/////////To extract the data from the JSOn file
		NSString *filePath = [[NSBundle mainBundle] pathForResource:@"FindLocationsJSON_Reply"ofType:@"txt"];  
		NSData *myData = [NSData dataWithContentsOfFile:filePath];  
		//NSString *responseString1 = [NSString dataWithContentsOfFile:filePath];  
		
		NSString *responseString = [[NSString alloc] initWithData:myData encoding: NSUTF8StringEncoding];
		NSLog(@"Strg_dicStrg_dic----%@",responseString);
		
		NSMutableDictionary	*Strg_dic   =  [NSMutableDictionary  new];
		Strg_dic  = [[responseString JSONValue] copy]; 
		
		if(DEBUGG)
			NSLog(@"Strg_dicStrg_dic----%@",[[[[[[Strg_dic  objectForKey:@"Reply"] objectForKey:@"LocatorSearchFindLocationsReply"]objectForKey:@"Locations"]objectAtIndex:0] objectForKey:@"LocatorSearchATMLocation"] objectForKey:@"Latitude"]);
		NSLog(@"Strg_dicStrg_dic----%@",[[[[[[Strg_dic  objectForKey:@"Reply"] objectForKey:@"LocatorSearchFindLocationsReply"]objectForKey:@"Locations"]objectAtIndex:0] objectForKey:@"LocatorSearchATMLocation"] objectForKey:@"Longitude"]);
		array_longnititude    =   [NSMutableArray new];
		array_latitude		  =    [NSMutableArray  new];
		
		
		
		array_surcharge  =  [NSMutableArray    new];
		array_deposit    =  [NSMutableArray    new];
		
		
		for(int i=0;i<[[[[Strg_dic  objectForKey:@"Reply"] objectForKey:@"LocatorSearchFindLocationsReply"]objectForKey:@"Locations"]count];i++)
		{
			[array_longnititude  addObject:[[[[[[Strg_dic  objectForKey:@"Reply"] objectForKey:@"LocatorSearchFindLocationsReply"]objectForKey:@"Locations"]objectAtIndex:i] objectForKey:@"LocatorSearchATMLocation"] objectForKey:@"Longitude"] ];
			[array_latitude      addObject:[[[[[[Strg_dic  objectForKey:@"Reply"] objectForKey:@"LocatorSearchFindLocationsReply"]objectForKey:@"Locations"]objectAtIndex:i] objectForKey:@"LocatorSearchATMLocation"] objectForKey:@"Latitude"] ];
			[array_ATMzip addObject:[[[[[[Strg_dic  objectForKey:@"Reply"] objectForKey:@"LocatorSearchFindLocationsReply"]objectForKey:@"Locations"]objectAtIndex:i] objectForKey:@"LocatorSearchAddress"] objectForKey:@"ZipCode"]];
			[array_ATMstreet addObject:[[[[[[Strg_dic  objectForKey:@"Reply"] objectForKey:@"LocatorSearchFindLocationsReply"]objectForKey:@"Locations"]objectAtIndex:i] objectForKey:@"LocatorSearchAddress"] objectForKey:@"Street"]];
			[array_ATMstate addObject:[[[[[[Strg_dic  objectForKey:@"Reply"] objectForKey:@"LocatorSearchFindLocationsReply"]objectForKey:@"Locations"]objectAtIndex:i] objectForKey:@"LocatorSearchAddress"] objectForKey:@"State"]];
			[array_ATMcity addObject:[[[[[[Strg_dic  objectForKey:@"Reply"] objectForKey:@"LocatorSearchFindLocationsReply"]objectForKey:@"Locations"]objectAtIndex:i] objectForKey:@"LocatorSearchAddress"] objectForKey:@"City"]];
			[array_surcharge  addObject:[[[[[[Strg_dic  objectForKey:@"Reply"] objectForKey:@"LocatorSearchFindLocationsReply"]objectForKey:@"Locations"]objectAtIndex:i] objectForKey:@"LocatorSearchATMLocation"] objectForKey:@"SurchargeFree"]];
			[array_deposit  addObject:[[[[[[Strg_dic  objectForKey:@"Reply"] objectForKey:@"LocatorSearchFindLocationsReply"]objectForKey:@"Locations"]objectAtIndex:i] objectForKey:@"LocatorSearchATMLocation"] objectForKey:@"AcceptDeposit"]];
			
		}
		if(DEBUGG)
		{
		NSLog(@"Strg_dicStrg_dic----%@",array_longnititude);
		NSLog(@"Strg_dicStrg_dic----%@",array_latitude);
		NSLog(@"Strg_dicStrg_dic----%@",array_ATMzip);
		NSLog(@"Strg_dicStrg_dic----%@",array_ATMstreet);
		NSLog(@"Strg_dicStrg_dic----%@",array_ATMstate);
		NSLog(@"array_deposit----%@",array_deposit);
		NSLog(@"array_surchargearray_surcharge===%@",array_surcharge);
		}
		
		for(int i=0;i<[array_latitude count];i++)
		{
			location.latitude             = [[array_latitude objectAtIndex:i] floatValue];
			location.longitude			  = [[array_longnititude objectAtIndex:i]floatValue];
			region.span=span;
			region.center=location;
			[self.mapView setRegion:region animated:TRUE];
			
			[self.mapView regionThatFits:region];
			self.mapView.showsUserLocation = TRUE;
			self.mapView.zoomEnabled = YES;
			MyAnnotation *addAnnotation   = [[[MyAnnotation alloc] initWithCoordinate:location ] retain];
			//	MyAnnotation* addAnnotation = [[MyAnnotation alloc]initWithCoordinate:location andID:i];
			
			
			//annotation.mTitle = annData.title;
			/// annotation.mSubtitle = annData.subtitle;
			// addAnnotation.ann_tag = i;
			///addAnnotation.ann_tag   =   i;
			[addAnnotation setAnn_tag:i];
			NSString   *title_string    =  [array_ATMcity objectAtIndex:i];//,[array_ATMstate  objectAtIndex:i],[array_ATMzip objectAtIndex:i]];
			title_string				=	[title_string  stringByAppendingFormat:@","];
			title_string                =   [title_string  stringByAppendingString:[array_ATMstate  objectAtIndex:i]];
			title_string				=	[title_string  stringByAppendingFormat:@" "];
			
			title_string                =   [title_string  stringByAppendingString:[array_ATMzip objectAtIndex:i]];
			//  title_string				=  [title_string stringValue];
			//NSLog(@"title_string  title_string  ->>>>>>>%@",title_string);
			[addAnnotation setTitle:[array_ATMstreet objectAtIndex:i]];
			
			//[addAnnotation  setSubtitle:[NSString stringWithFormat:@"%@%@",[array_ATMcity objectAtIndex:i],[array_ATMstate objectAtIndex:i]]];
			//[addAnnotation setTitle:title_string];  
			//  [addAnnotation set]  
			//[addAnnotation  setTitle:@" "];
			[addAnnotation  setSubtitle:title_string];
			//[addAnnotation   setTitle:@""]
			/*UIView  *view_details         =  [[UIView alloc ]init];
			 view_details.frame            = CGRectMake(0, 0, 100,100);
			 view_details.backgroundColor  =  [UIColor redColor];
			 addAnnotation.annotation_view =  view_details;
			 */
			_index  =  i;
			[self.mapView addAnnotation:addAnnotation];
		}
	}
	else
	{
		[[self navigationItem] setHidesBackButton:YES];
		for(int i=0;i<[arry_foundElement count];i++)
		{
			location.latitude             = [[array_latitude objectAtIndex:[[arry_foundElement  objectAtIndex:i]integerValue]] floatValue];
			location.longitude			  = [[array_longnititude objectAtIndex:[[arry_foundElement  objectAtIndex:i]integerValue]]floatValue];
			region.span=span;
			region.center=location;
			[self.mapView setRegion:region animated:TRUE];
			
			[self.mapView regionThatFits:region];
			self.mapView.showsUserLocation = TRUE;
			self.mapView.zoomEnabled = YES;
			MyAnnotation *addAnnotation   = [[[MyAnnotation alloc] initWithCoordinate:location ] retain];
			//	MyAnnotation* addAnnotation = [[MyAnnotation alloc]initWithCoordinate:location andID:i];
			
			
			//annotation.mTitle = annData.title;
			/// annotation.mSubtitle = annData.subtitle;
			// addAnnotation.ann_tag = i;
			///addAnnotation.ann_tag   =   i;
			[addAnnotation setAnn_tag:[[arry_foundElement  objectAtIndex:i]integerValue]];
			NSString   *title_string    =  [array_ATMcity objectAtIndex:[[arry_foundElement  objectAtIndex:i]integerValue]];//,[array_ATMstate  objectAtIndex:i],[array_ATMzip objectAtIndex:i]];
			title_string				=	[title_string  stringByAppendingFormat:@","];
			title_string                =   [title_string  stringByAppendingString:[array_ATMstate  objectAtIndex:[[arry_foundElement  objectAtIndex:i]integerValue]]];
			title_string				=	[title_string  stringByAppendingFormat:@" "];
			
			title_string                =   [title_string  stringByAppendingString:[array_ATMzip objectAtIndex:[[arry_foundElement  objectAtIndex:i]integerValue]]];
			//  title_string				=  [title_string stringValue];
			//NSLog(@"title_string  title_string  ->>>>>>>%@",title_string);
			[addAnnotation setTitle:[array_ATMstreet objectAtIndex:[[arry_foundElement  objectAtIndex:i] integerValue]]];
			
			//[addAnnotation  setSubtitle:[NSString stringWithFormat:@"%@%@",[array_ATMcity objectAtIndex:i],[array_ATMstate objectAtIndex:i]]];
			//[addAnnotation setTitle:title_string];  
			//  [addAnnotation set]  
			//[addAnnotation  setTitle:@" "];
			[addAnnotation  setSubtitle:title_string];
			//[addAnnotation   setTitle:@""]
			/*UIView  *view_details         =  [[UIView alloc ]init];
			 view_details.frame            = CGRectMake(0, 0, 100,100);
			 view_details.backgroundColor  =  [UIColor redColor];
			 addAnnotation.annotation_view =  view_details;
			 */
			_index  =  i;
			[self.mapView addAnnotation:addAnnotation];
		}
		
		
	}
	
    [super viewDidLoad];
}
//////////////////////////////////////////
-(IBAction) timer_main_menu:(id)sender
{
	//[spinner stopAnimating];
	
    NSString *url1 = [NSString stringWithFormat: @"http://maps.google.com/maps?saddr=%f,%f&daddr=%f,%f", 36.17191,-115.14,36.17489,-115.1371];	
	NSURL *url = [NSURL URLWithString:url1];
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	if(_IPAD  == 0)
		webView   =  [[UIWebView  alloc]initWithFrame:CGRectMake(0,0, 320,420)];
	else 
	{
		webView   =  [[UIWebView  alloc]initWithFrame:CGRectMake(0,0, 768,1004)];
		
	}
	
	[webView loadRequest:request];
	[self.view addSubview:webView];
	/*  NSString *url = [NSString stringWithFormat: @"http://maps.google.com/maps?saddr=%f,%f&daddr=%f,%f", 36.17191,-115.14,36.17489,-115.1371]; 
	 // [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
	 mapViewWindow					= [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
	 CGRect frameOfnxtbutton				=   CGRectMake(446, 883, 40, 28);
	 UIButton *overlayNxtButton					= [[UIButton alloc] initWithFrame:frameOfnxtbutton];
	 // We want to get notified whenever the overlay control is touched
	 //NSString    *imageName						=	@"nextVideo.png";
	 //[overlayNxtButton setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
	 [overlayNxtButton	 addTarget:self action:@selector(overlayNxtButtonTouched:)  forControlEvents:UIControlEventTouchUpInside];
	 // Add the overlay to the window's subviews
	 [mapViewWindow addSubview:overlayNxtButton	];*/
	
	//Get_Direction_Controller *my_Get_Direction_Controller=[[Get_Direction_Controller alloc]init];
	//[[self navigationController] pushViewController:my_Get_Direction_Controller animated:YES];
}
//////////////////////////////////////////////

/////////////////////////////////////
//When searched button is clicked
-(IBAction)clickedOnsearched:(id)sender
{
	/*UIBarButtonItem *newBackButton				= [[UIBarButtonItem alloc] initWithTitle: @"Map" style: UIBarButtonItemStyleBordered target: nil action: nil];
	 //	self.newBackButton.tintColor = [UIColor blackColor];
	 [[self navigationItem] setBackBarButtonItem: newBackButton];
	 */
	if(_IPAD  == 0)
	{
		DetailvieController  *obj_DetailvieController  =  [DetailvieController  new];
		[self.navigationController pushViewController:obj_DetailvieController   animated:YES];
		if(obj_DetailvieController)
		{
			[obj_DetailvieController  release];
			obj_DetailvieController  =  nil;
		}
	}
	else
	{
		DetailvieController *obj_DetailsViewController = [[DetailvieController alloc] initWithNibName:@"DetailVieController_Ipad" bundle:nil];
		[self.navigationController  pushViewController:obj_DetailsViewController animated:YES];
		if(obj_DetailsViewController)
		{
			[obj_DetailsViewController  release];
			obj_DetailsViewController   =  nil;
		}
	}
}
/////////////////////////////////////////////

//////////////For the annotation  customization
- (MKAnnotationView *)mapView:(MKMapView *)mapview viewForAnnotation:(id <MKAnnotation>)annotation
{
	
	iCodeBlogAnnotationView *annotationView = nil;
	
	if (annotation == mapView.userLocation) {
		return annotationView;
		
	}
	NSString *string   =   mPlacemark.locality;
	MKPinAnnotationView *annView = nil;
	(MKPinAnnotationView *)[mapview dequeueReusableAnnotationViewWithIdentifier:string];
	
	MyAnnotation* myAnnotation = (MyAnnotation *)annotation;
	annView = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:string] autorelease];
	
	NSString* identifier = @"Bookmark";
	iCodeBlogAnnotationView *newAnnotationView = (iCodeBlogAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
	
	if(nil == newAnnotationView)
	{
		newAnnotationView = [[[iCodeBlogAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
		
		//////////This button is for detail view
		UIButton* details_button = [[UIButton alloc]initWithFrame:CGRectMake(100, 0, 45, 20)];
		//[rightButton addTarget:self action:@selector(doneButtonClick:) forControlEvents:UIControlEventTouchUpInside];
		[details_button setTitle:@"Details"  forState:(UIControlState)UIControlStateNormal];
		details_button.font = [UIFont boldSystemFontOfSize:12];
		details_button.backgroundColor  =  [UIColor  blackColor];
		details_button.tag   =  1;
		//details_button.tag   =  annotationValue;
		[details_button addTarget:self	action:@selector(showDetails:) forControlEvents:UIControlEventTouchUpInside];
		
		
		/*UILabel *Label_ATMcity = [[UILabel alloc] initWithFrame:CGRectMake(0,0, 100, 20)];
		 Label_ATMcity.text = [array_ATMstreet objectAtIndex:_index];
		 Label_ATMcity.backgroundColor = [UIColor clearColor];
		 [Label_ATMcity setTextColor:[UIColor  whiteColor]];
		 Label_ATMcity.font = [UIFont fontWithName:@"Arial" size: 10];
		 // priceLabel.backgroundColor = [UIColor redColor];
		 // [priceLabel setCenter:CGPointMake(view.center.x, view.center.y-30)];
		 */
		
		///////This button is for direction 
		UIButton* direction_button = [[UIButton alloc]initWithFrame:CGRectMake(100, 18, 55, 20)];
		//	direction_button.tag   =  annotationValue;
		//[rightButton addTarget:self action:@selector(doneButtonClick:) forControlEvents:UIControlEventTouchUpInside];
		[direction_button setTitle:@"Direction"  forState:(UIControlState)UIControlStateNormal];
		direction_button.font = [UIFont boldSystemFontOfSize:12];
		direction_button.tag   =  0;
		direction_button.backgroundColor  =  [UIColor  blackColor];
		[direction_button addTarget:self	action:@selector(showDetails:) forControlEvents:UIControlEventTouchUpInside];
		
		
		
		/*UIView  *view_details         =  [[UIView alloc ]init];
		view_details.frame            = CGRectMake(0, 0, 167,38);
		view_details.backgroundColor  =  [UIColor clearColor];
		view_details.userInteractionEnabled  =  YES;
		
		[view_details   addSubview:details_button  ];
		[view_details   addSubview:direction_button];
		//[view_details addSubview: Label_ATMcity];
		*/
		newAnnotationView.rightCalloutAccessoryView =direction_button ;
		newAnnotationView.leftCalloutAccessoryView  =  details_button;
		if(direction_button)
		{
			[direction_button   release];
			direction_button   =  nil;
		}
		
		if(details_button)
		{
			[details_button   release];
			details_button    =  nil;
		}
		//newAnnotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
	}
	
	annotationView = newAnnotationView;
	
	[annotationView setEnabled:YES];
	[annotationView setCanShowCallout:YES];
	
	return annotationView;
	
	return nil;
	//////////////////////////////////////////////////
	
	/*NSString *string   =   mPlacemark.locality;
	 NSLog(@"vdsv");
	 //NSLog(@"stringstring-%@",string);
	 //	NSLog(@"location-------------%i",annotation.ann_tag);
	 MKPinAnnotationView *annView = nil;
	 (MKPinAnnotationView *)[mapview dequeueReusableAnnotationViewWithIdentifier:string];
	 
	 // If we have to, create a new view
	 
	 annView = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:string] autorelease];
	 //MKPinAnnotationView *annView=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:string];  
	 //[annView setBackgroundColor:[UIColor clearColor]];
	 //NSLog(@"anno.tag%i",annotation.ann_tag);
	 annView.canShowCallout = YES;  
	 NSLog(@"AAN----%f",annView.frame.origin.x);
	 NSLog(@"AAN----%f",annView.frame.origin.y);
	 NSLog(@"location%f",location.latitude);
	 ///NSLog(@"annnnnnnnnnn%d", self.ann_tag);
	 
	 
	 [annView setSelected:YES];  	
	 /*UIView  *view_details  =  [[UIView alloc ]init];
	 view_details.frame    = CGRectMake(22, 200, 400,100);
	 view_details.backgroundColor  =  [UIColor colorWithRed:71 green:70 blue:68 alpha:1];
	 //UILabel  *lbl_details   =  
	 [self addSubview:view_details];
	 [view_details release];*/
	
	//NSInteger annotationValue= [self.annotations indexOfObject:annotation];
	//annView.rightCalloutAccessoryView = view_details;
	/*UIButton* details_button = [[UIButton alloc]initWithFrame:CGRectMake(100, 0, 67, 15)];
	 //[rightButton addTarget:self action:@selector(doneButtonClick:) forControlEvents:UIControlEventTouchUpInside];
	 [details_button setTitle:@"Details"  forState:(UIControlState)UIControlStateNormal];
	 details_button.font = [UIFont boldSystemFontOfSize:8];
	 details_button.backgroundColor  =  [UIColor  blackColor];
	 //details_button.tag   =  annotationValue;
	 [details_button addTarget:self	action:@selector(showDetails:) forControlEvents:UIControlEventTouchUpInside];
	 
	 
	 /*UILabel *Label_ATMcity = [[UILabel alloc] initWithFrame:CGRectMake(0,0, 100, 20)];
	 Label_ATMcity.text = [array_ATMstreet objectAtIndex:_index];
	 Label_ATMcity.backgroundColor = [UIColor clearColor];
	 [Label_ATMcity setTextColor:[UIColor  whiteColor]];
	 Label_ATMcity.font = [UIFont fontWithName:@"Arial" size: 10];
	 // priceLabel.backgroundColor = [UIColor redColor];
	 // [priceLabel setCenter:CGPointMake(view.center.x, view.center.y-30)];
	 */
	/*UIButton* direction_button = [[UIButton alloc]initWithFrame:CGRectMake(100, 18, 67, 15)];
	 //	direction_button.tag   =  annotationValue;
	 //[rightButton addTarget:self action:@selector(doneButtonClick:) forControlEvents:UIControlEventTouchUpInside];
	 [direction_button setTitle:@"Direction"  forState:(UIControlState)UIControlStateNormal];
	 direction_button.font = [UIFont boldSystemFontOfSize:8];
	 direction_button.backgroundColor  =  [UIColor  blackColor];
	 [direction_button addTarget:self	action:@selector(showDetails:) forControlEvents:UIControlEventTouchUpInside];
	 
	 
	 
	 UIView  *view_details         =  [[UIView alloc ]init];
	 view_details.frame            = CGRectMake(0, 0, 167,38);
	 view_details.backgroundColor  =  [UIColor clearColor];
	 view_details.userInteractionEnabled  =  YES;
	 
	 [view_details   addSubview:details_button  ];
	 [view_details   addSubview:direction_button];
	 //[view_details addSubview: Label_ATMcity];
	 annView.rightCalloutAccessoryView = details_button;
	 annView.leftCalloutAccessoryView  =  direction_button;
	 [annView setPinColor:MKPinAnnotationColorGreen];
	 
	 ///[annView  ]
	 //[annView  setImage:[UIImage imageNamed:@"dropdown.png"]];
	 annView.calloutOffset = CGPointMake(-5, 5);
	 annView.canShowCallout = YES;
	 annView.animatesDrop=TRUE; 
	 return annView;*/
	///////////////////////////// 
	
	
}

/////////////////when closed button is clicked
-(IBAction)closebuttonclick:(id)sender
{
	[webView removeFromSuperview];
	UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(doneButtonClick:)];          
	self.navigationItem.rightBarButtonItem = anotherButton;
	if(anotherButton)
	{
		[anotherButton   release];
		anotherButton  =  nil;
	}
}
////////////////////////////


/////////////When annotation button is clicked
- (void)mapView:(MKMapView *)mapView annotationView:(iCodeBlogAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
	
	/*array_longnititude
	 array_latitude*/
	/*NSLog(@" calloutAccessoryControlTapped.tag-----%i",control.tag ); 
	 NSInteger loc  = view.annotation_view_tag ;
	 NSLog(@"view.annotation_view_tagview.annotation_view_tag---%d",loc );
	 NSLog(@"[array_latitude objectAtIndex:view.annotation_view_tag],[array_longnititude  objectAtIndex:view.annotation_view_tag]%@",array_latitude);
	 NSLog(@"[array_latitude objectAtIndex:view.annotation_view_tag]-------%f======,[array_longnititude  objectAtIndex:view.annotation_view_tag]--%f",[array_latitude objectAtIndex:loc],[array_longnititude  objectAtIndex:loc]);*/
	NSInteger loc  = view.annotation_view_tag ;
	if(control.tag == 0)
	{
        NSString *url1 = [NSString stringWithFormat: @"http://maps.google.com/maps?saddr=%f,%f&daddr=%f,%f", 36.17191,-115.14,[[array_latitude objectAtIndex:view.annotation_view_tag]floatValue],[[array_longnititude  objectAtIndex:view.annotation_view_tag] floatValue]];	
	    NSURL *url = [NSURL URLWithString:url1];
	    NSURLRequest *request = [NSURLRequest requestWithURL:url];
		if(_IPAD  == 0)
			webView   =  [[UIWebView  alloc]initWithFrame:CGRectMake(0,0, 320,460)];
		else 
		{
			webView   =  [[UIWebView  alloc]initWithFrame:CGRectMake(0,0, 768,1004)];
			
		}
	    [webView loadRequest:request];
		[self.view addSubview:webView]; 
		UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStylePlain target:self action:@selector(closebuttonclick:)];          
		self.navigationItem.rightBarButtonItem = anotherButton;
		if(anotherButton)
		{
			[anotherButton   release];
			anotherButton  =  nil;
		}
	}
	else
	{
		_indexOfAnnotaion    =  loc;
		if(_IPAD  == 0)
		{
			DetailsViewController   *obj_DetailsViewController  =   [DetailsViewController  new];
			[self.navigationController  pushViewController:obj_DetailsViewController animated:YES];
			if(obj_DetailsViewController)
			{
				[obj_DetailsViewController  release];
				obj_DetailsViewController   =  nil;
			}
		}
		else
		{
			DetailsViewController *obj_DetailsViewController = [[DetailsViewController alloc] initWithNibName:@"DetailViewController_Ipad" bundle:nil];
			[self.navigationController  pushViewController:obj_DetailsViewController animated:YES];
			if(obj_DetailsViewController)
			{
				[obj_DetailsViewController  release];
				obj_DetailsViewController   =  nil;
			}
		}
		
	}
	
	
	
}

- (void)addAnnotation:(id <MKAnnotation>)annotation
{}
-(IBAction)showDetails:(id)sender
{
	//NSLog(@"annotationValueannotationValueannotationValueannotationValueannotationValue----%i",[sender tag]);
}
/*
 - (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view	
 {
 //NSLog(@"view view%f",mapView.);
 UIButton* details_button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 67, 18)];
 //[rightButton addTarget:self action:@selector(doneButtonClick:) forControlEvents:UIControlEventTouchUpInside];
 [details_button setTitle:@"Details"  forState:(UIControlState)UIControlStateNormal];
 details_button.font = [UIFont boldSystemFontOfSize:8];
 details_button.backgroundColor  =  [UIColor  blackColor];
 [details_button addTarget:self	action:@selector(showDetails:) forControlEvents:UIControlEventTouchUpInside];
 
 //UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0, 30, 20)];
 
 /* priceLabel.text = @"HI\nTHERE";
 priceLabel.backgroundColor = [UIColor redColor];
 priceLabel.font = [UIFont fontWithName:@"Arial" size: 9.0];
 priceLabel.backgroundColor = [UIColor redColor];
 [priceLabel setCenter:CGPointMake(view.center.x, view.center.y-30)];*/

/*UIButton* direction_button = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, 67, 18)];
 //[rightButton addTarget:self action:@selector(doneButtonClick:) forControlEvents:UIControlEventTouchUpInside];
 [direction_button setTitle:@"Direction"  forState:(UIControlState)UIControlStateNormal];
 direction_button.font = [UIFont boldSystemFontOfSize:8];
 direction_button.backgroundColor  =  [UIColor  blackColor];
 [direction_button addTarget:self	action:@selector(showDetails:) forControlEvents:UIControlEventTouchUpInside];
 
 
 
 UIView  *view_details         =  [[UIView alloc ]init];
 view_details.frame            = CGRectMake(0, 0, 67,38);
 view_details.backgroundColor  =  [UIColor clearColor];
 view_details.userInteractionEnabled  =  YES;
 
 [view_details addSubview:details_button];
 [view_details  addSubview:direction_button];
 view.rightCalloutAccessoryView = view_details;
 
 /// [view addSubview:priceLabel];
 
 }/*
 - (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)annotationViews{
 
 //The final (correct) position of the annotation
 CGRect finalFrame;
 
 //The position we will drop the annotation from
 CGRect offScreenFrame;
 
 for(UIView *annotationView in annotationViews) {
 
 //MapKit has worked out the annotations final position so store it
 finalFrame = annotationView.frame;
 
 //We just want to move the annotation, so it is just above the top of the visible screen
 
 offScreenFrame = CGRectMake(finalFrame.origin.x,(finalFrame.size.height *-1) , finalFrame.size.width, finalFrame.size.height);
 
 //Set and therefore move the annotation to the off screen position
 annotationView.frame = offScreenFrame;
 
 //Set up an animation block to animate the drop
 [UIView beginAnimations:@"AnimateAnnotation" context:NULL];
 [UIView setAnimationDuration:1.0];
 
 //Set the final frame, to be the frame that map kit originally calculated
 annotationView.frame = finalFrame;
 [UIView commitAnimations];
 }
 }*/

////////////////////////////////
////////When user want to logout from the page
-(IBAction)doneButtonClick:(id)sender
{
	//[webView  removeFromSuperview];
	
	if(_IPAD == 0)
	{
		UserViewController    *objUserViewController      =    [UserViewController  new];
		objUserViewController.hidesBottomBarWhenPushed = YES;
		[self.navigationController  pushViewController:objUserViewController animated:YES];
		if(objUserViewController)
		{
			[objUserViewController  release];
			objUserViewController    =   nil;	
		}
	}
	else
	{
		UserViewController    *objUserViewController      =    [[UserViewController alloc] initWithNibName:@"UserViewController_Ipad" bundle:nil];
		objUserViewController.hidesBottomBarWhenPushed = YES;
		[self.navigationController  pushViewController:objUserViewController animated:YES];
		if(objUserViewController)
		{ 
			[objUserViewController  release];
			objUserViewController    =   nil;	
		}
	}
}

/////////////////////////////////

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return NO;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
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
