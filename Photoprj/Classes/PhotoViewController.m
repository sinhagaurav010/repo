    //
//  PhotoViewController.m
//  Photoprj
//
//  Created by gaurav sinha on 03/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PhotoViewController.h"
#import "FullViewController.h"
#import "DifferentViewController.h"
#import "GPSViewController.h"
#import "AboutTheCompany.h"
#define SIZE 8

@implementation PhotoViewController
BOOL timer_bool  = 1;
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNamOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/
- (PhotoViewController *) initXMLParser {
	
	//arrayForKey					=	[NSMutableArray new];
	[super init];
	//appDelegate				= (ComiciPadAppDelegate *)[[UIApplication sharedApplication] delegate];
	return self;
}

////////////////////////////////////////////
//
-(void)parsingofComicgalleryXmlfile
{	
//	NSString  *string_xml;
//	if(_whichButonClicked == 5)
//	string_xml = @"xmlFilefrhotels";
//	else {
    NSString  *		string_xml = @"xmlFilefrWallpapers";

//	}

	NSString *filePath					= [[NSBundle mainBundle]pathForResource:string_xml ofType:@"xml"];
	NSString *fileContents				= [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
	NSData  *galleryXmlfileData			= [fileContents dataUsingEncoding:NSUTF8StringEncoding];
	NSXMLParser *xmlParser				= [[NSXMLParser alloc] initWithData:galleryXmlfileData];
	PhotoViewController *parser		=	[[PhotoViewController alloc] initXMLParser];// Used for ehat purpose
	[xmlParser setDelegate:parser];
	//	Start parsing the XML file.
	BOOL success						= [xmlParser parse];
	if(success)
		NSLog(@"No Errors");
		else
			NSLog(@"Error Error Error!!!");
			if (xmlParser) 
			{
				[xmlParser release];
				xmlParser = nil;
			}
}


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName 
namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName 
attributes:(NSDictionary *)attributeDict 
{
	if([elementName isEqualToString:@"item"]) 
	{
	}
}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string 
{ 
	if(!currentElementValue) 
	{
		currentElementValue	= [[NSMutableString alloc] initWithString:string];
	}
	else
	{
		[currentElementValue appendString:string];
		//if(LOGFLAG==1)
		//NSLog(@"string%@",string);
	}	
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName 
namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{	
	if([elementName isEqualToString:@"item"])
	{
		return;
	}	
	if([elementName isEqualToString:@"image"]){
		
		[arrayOfImageGallery  addObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]]] ;
	    //	if(LOGFLAG==1)
	    //	NSLog(@"comicname------------->>>%@\n",currentElementValue);171045876260320	Your OAuth client_id
		//Application Secret	c6ec363b381d89941e4d64787adbfac5
	}
		
	else 
	{
	}
	
	if(currentElementValue)
	{
		[currentElementValue release];
		currentElementValue		= nil;
	}
}
-(IBAction)myCodeToCallTheView:(id)sender
{
	label_lisbon.hidden = YES;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	self.view.backgroundColor  = [UIColor blackColor];
	view_icons  = [UIView new];
	view_icons.userInteractionEnabled  =  YES;
	//view_icons.frame = 
	[self.view   addSubview:view_icons];
	view_icons.backgroundColor = [UIColor  blackColor];
	//[activeindicator startAnimating];
	//[self performSelector:@selector(myCodeToCallTheView:) withObject:nil afterDelay:6];
	
	UIBarButtonItem *newBackButton				= [[UIBarButtonItem alloc] initWithTitle: @"Back" style: UIBarButtonItemStyleBordered target: nil action: nil];
	
	///////////////////////////////
	///////If it is greater than one then it will go to NumberOfitemViewController to tabluate
	[[self navigationItem] setBackBarButtonItem: newBackButton];
	
	
	arrayOfImageGallery					=	[NSMutableArray new];
	view_main.backgroundColor = [UIColor blackColor];
	self.navigationController.navigationBar.tintColor = [UIColor blackColor];
	
	[self parsingofComicgalleryXmlfile];
	array_fromButton = [NSMutableArray new];
	
	//[[self navigationController] s]
	//self.navigationItem.barStyle = UIBarStyleBlackTranslucent;
	//[self.navigationController setNavigationBarHidden:NO];
	self.navigationItem.title = @"Lisbon Story";
	//arryForImage  = [NSArray new];
	arryForImage					=[NSArray new];
	arryForImage					= [ [arrayOfImageGallery objectAtIndex:0] componentsSeparatedByString:@","];
	array_Global = [NSMutableArray new];
	float wt = [arryForImage count]/SIZE;
	CGRect frame = CGRectMake(0, 40, SIZE*185, 185*wt+185);
	scrll_view.contentSize = frame.size;
    array_ph = [NSMutableArray new];
	for(int i = 0;i<[arryForImage count];i++)
	{
		[array_ph addObject:[arryForImage objectAtIndex:i]];
		[array_Global addObject:[arryForImage objectAtIndex:i]];
	}
	
	//[arryForImage  addObject:[arrayOfImageGallery objectAtIndex:0]]];
	
	incY = 0;
	int counter = 0;
	BOOL _isBreak = 0;
	button_array  = [NSMutableArray  new];
	//for(int i = 0;i<5;i++)
	while(1)
	{
		incX = 0.0;
		for(int j = 0;j<SIZE;j++)
		{
		    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(incX, incY, 175, 175)];
			[button setImage:[UIImage imageNamed:[arryForImage objectAtIndex:counter]] forState:(UIControlState)UIControlStateNormal];
			button.tag = counter;
			//[button setBackgroundImage:<#(UIImage *)image#> forState:<#(UIControlState)state#>]// = YES;
		
			//- (void)setTitleShadowColor:(UIColor *)color forState:(UIControlState)state;  // default is nil. use 50% black
			//[button setTitleShadowColor:[u] forState:<#(UIControlState)state#>];
			//[button setBackgroundColor:[UIColor blueColor] f]
			
			[button addTarget:self action:@selector(homeButtonClicktoenter:) forControlEvents:UIControlEventTouchUpInside];
			counter++;
			[scrll_view addSubview:button];
			[array_fromButton addObject:button];
			incX += 185;
			[button_array addObject:button];
			if(counter == [arryForImage count])
			{
				_isBreak  = 1;
				break;
			}
			if(button)
			{
				[button release];
				button = nil;
			}
		}
		if(_isBreak ==1)
			break;
		incY += 185;
	}
	
	/*
	 
	 NSURL *url = [NSURL URLWithString:@"http://192.168.1.3/mytest/Images/1.gif"];
	 NSData *data = [NSData dataWithContentsOfURL:url];
	 
	 NSLog(@"data%@",data);
	 
	 if (data==nil) {
	 UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Connection Error!" message:@"Unable to connect to the website." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
	 [alert show];
	 } else {
	 UIImage *img = [[UIImage alloc] initWithData:data cache:NO];
	 //myImageView.image = img;
	 
	 UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(incX, incY, 300, 175)];
	 [button setBackgroundImage:img forState:(UIControlState)UIControlStateNormal];
	 button.tag = counter;
	 
	 [button addTarget:self action:@selector(homeButtonClicktoenter:) forControlEvents:UIControlEventTouchUpInside];
	 counter++;
	 [scrll_view addSubview:button];
	 [array_fromButton addObject:button];
	 }*/
	
	
	//arry_foldersButon = [NSMutableArray  new];
	/*label_lisbon = [[UILabel alloc]initWithFrame:CGRectMake(50, 300, 668,500)];
	 label_lisbon.text = @"LISBON STORY";
	 label_lisbon.font = [UIFont systemFontOfSize:85];
	 label_lisbon.textColor = [UIColor whiteColor];
	 label_lisbon.backgroundColor = [UIColor clearColor];
	 [self.view addSubview:label_lisbon];
	 */
	
	
	int counter2 = 0; 
	
	
	button_rest = [[UIButton alloc]initWithFrame:CGRectMake(318,0, 40, 50)];
	[button_rest setImage:[UIImage imageNamed:@"restaurants.png"] forState:(UIControlState)UIControlStateNormal];
	//button_rest.tag = counter;
	[button_rest addTarget:self action:@selector(homeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
	button_rest.tag = 1;
	counter2++;
	[view_icons addSubview:button_rest];
	
	button_coffes = [[UIButton alloc]initWithFrame:CGRectMake(318+50,0, 50, 50)];
	[button_coffes setImage:[UIImage imageNamed:@"coffes.png"] forState:(UIControlState)UIControlStateNormal];
	//button_rest.tag = counter;
	[button_coffes addTarget:self action:@selector(homeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
	button_coffes.tag = 2;
	counter2++;
	//counter++;
	[view_icons addSubview:button_coffes];
	
	
	button_night = [[UIButton alloc]initWithFrame:CGRectMake(318+100,0, 50, 50)];
	[button_night setBackgroundImage:[UIImage imageNamed:@"nigthlife.png"] forState:(UIControlState)UIControlStateNormal];
	//button_rest.tag = counter;
	[button_night addTarget:self action:@selector(homeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
	//counter++;
	button_night.tag = 3;
	counter2++;
	[view_icons addSubview:button_night];
	
	button_hotel = [[UIButton alloc]initWithFrame:CGRectMake(318+150,0, 50, 50)];
	[button_hotel setImage:[UIImage imageNamed:@"hotelspa.png"] forState:(UIControlState)UIControlStateNormal];
	//button_rest.tag = counter;
	[button_hotel addTarget:self action:@selector(homeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
	//counter++;
	button_hotel.tag = 4;
	counter2++;
	[view_icons addSubview:button_hotel];
	
	button_transportation = [[UIButton alloc]initWithFrame:CGRectMake(318+200,900, 50, 50)];
	[button_transportation setBackgroundImage:[UIImage imageNamed:@"transportation.png"] forState:(UIControlState)UIControlStateNormal];
	//button_rest.tag = counter;
	[button_transportation addTarget:self action:@selector(homeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
	//counter++;
	button_transportation.tag =5;
	counter2++;
	[view_icons addSubview:button_transportation];
	
	button_museumsunsigthseing = [[UIButton alloc]initWithFrame:CGRectMake(318+250,0, 50, 50)];
	[button_museumsunsigthseing setBackgroundImage:[UIImage imageNamed:@"point of interests.png"] forState:(UIControlState)UIControlStateNormal];
	//button_rest.tag = counter;
	[button_museumsunsigthseing addTarget:self action:@selector(homeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
	//counter++;
	button_museumsunsigthseing.tag = 6;
	counter2++;
	[view_icons addSubview:button_museumsunsigthseing];
	
	button_shopping = [[UIButton alloc]initWithFrame:CGRectMake(318+300,0, 50, 50)];
	[button_shopping setBackgroundImage:[UIImage imageNamed:@"shooping.png"] forState:(UIControlState)UIControlStateNormal];
	//button_rest.tag = counter;
	[button_shopping addTarget:self action:@selector(homeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
	//counter++;
	button_shopping.tag = 7;
	counter2++;
	[view_icons addSubview:button_shopping];
	
	
	button_Sponsor = [[UIButton alloc]initWithFrame:CGRectMake(318+350,0, 50, 50)];
	[button_Sponsor setBackgroundImage:[UIImage imageNamed:@"sponsor.png"] forState:(UIControlState)UIControlStateNormal];
	//button_rest.tag = counter;
	[button_Sponsor addTarget:self action:@selector(homeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
	//counter++;
	button_Sponsor.tag = 8;
	counter2++;
	[view_icons addSubview:button_Sponsor];
	
	button_About = [[UIButton alloc]initWithFrame:CGRectMake(318+400,0, 50, 50)];
	[button_About setBackgroundImage:[UIImage imageNamed:@"abt.png"] forState:(UIControlState)UIControlStateNormal];
	//button_rest.tag = counter;
	[button_About addTarget:self action:@selector(Aboutthapp:) forControlEvents:UIControlEventTouchUpInside];
	//counter++;
	button_About.tag = 9;
	counter2++;
	
	[view_icons addSubview:button_About];
	
	
    [super viewDidLoad];
}
-(void)invalidate
{
	if(timer_bool == 0)
	{
		//NSLog(@"sddsdsdsdsds");
		timer_bool  = 1;
		[timer  invalidate];
		// [timer  release];
		//timer  = nil;
	}
}
-(IBAction)updateCounter:(id)sender
{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1];
	timer_bool  =  1;
	//frameOfAnimation					=   CGRectMake(0, -60, 768, 45);
	view_icons.frame						= CGRectMake(0, 1004, 768, 80);	
	[UIView commitAnimations];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	
	if(timer_bool == 1)
	{
	timer								=	[NSTimer scheduledTimerWithTimeInterval:6.0f target:self selector:@selector(updateCounter:) userInfo:nil repeats:NO];
	/*UITouch *touchpoints				= [touches anyObject];
	 finalPosition						= [touchpoints locationInView:scrll_view];*/
		timer_bool   =  0;
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1];
	
	//frameOfAnimation					=   CGRectMake(0, -60, 768, 45);
	if(landmode_ph == 0)
	view_icons.frame					= CGRectMake(0, 924, 768, 80);
	else 
	{
		view_icons.frame				= CGRectMake(0, 668, 1024, 80);
	}
	
	[UIView commitAnimations];
	}
	//click=0;
	
}

-(IBAction)Aboutthapp:(id)sender
{
	[self  invalidate];
	AboutTheCompany *obj = [AboutTheCompany new];
	[self.navigationController pushViewController:obj animated:YES];
	if(obj)
	{
		[obj release];
		obj = nil;
	}
}
-(IBAction)homeButtonClicktoenter:(id)sender
{
	[self  invalidate];
	
	   UIButton *btton = [button_array objectAtIndex:[sender  tag]];
	[btton setBackgroundColor:[UIColor  whiteColor]];
	_whichButonClicked_full = [sender tag];
	_FromPhotoViewContrller = 1;
    FullViewController *obj =[FullViewController new];
	[self.navigationController pushViewController:obj animated:YES];
	if(obj)
	{
		[obj release];
		obj = nil;
	}
}

-(IBAction)homeButtonClick:(id)sender
{	
	[self  invalidate];
	
	_whichButonClicked = [sender tag];
	
	DifferentViewController *obj = [DifferentViewController new];
	[self.navigationController pushViewController:obj animated:YES];
	if(obj)
	{
		[obj release];
		obj = nil;
	}
	
}

-(void)ViewinLandscape
{
	if(timer_bool == 0)
	view_icons.frame  = CGRectMake(0, 668, 1024, 80);
	else {
		view_icons.frame  = CGRectMake(0, 848, 1024, 80);

	}

	CGRect frame      = CGRectMake(200, 0, 40, 50);
	
	//frame.origin.y = 648;
	
	button_rest.frame = frame;
	

	frame.origin.x += 70;
	button_coffes.frame = frame;
	
	frame.origin.x += 70;
	button_night.frame = frame;
	
	frame.origin.x += 70;
	button_hotel.frame = frame;
	
	frame.origin.x += 70;
	button_transportation.frame = frame;
	
	frame.origin.x += 70;
	button_museumsunsigthseing.frame = frame;
	
	frame.origin.x += 70;
	button_shopping.frame = frame;
	
	CGRect frame1 = CGRectMake(80, 100, 900,500);
	label_lisbon.font  = [UIFont systemFontOfSize:120];
    label_lisbon.frame = frame1;
	
	frame.origin.x += 70;
	button_Sponsor.frame = frame;
	
	frame.origin.x += 70;
	button_About.frame = frame;
}
-(void)ViewinPortrait
{
	if(timer_bool == 0)
	view_icons.frame  = CGRectMake(0, 924, 768, 80);
	else {
		view_icons.frame  = CGRectMake(0, 1084, 768, 80);

	}

	CGRect frame = 	CGRectMake(100,0, 40, 50);
	//frame.origin.y = 648;
	button_rest.frame = frame;
	
	 frame = 	CGRectMake(100,0, 50, 50);

	CGRect frame1 = CGRectMake(50, 250, 668,500);
	label_lisbon.font  = [UIFont systemFontOfSize:80];
	
    label_lisbon.frame = frame1;
	
	frame.origin.x += 70;
	button_coffes.frame = frame;
	
	frame.origin.x += 70;
	button_night.frame = frame;
	
	frame.origin.x += 70;
	button_hotel.frame = frame;
	
	frame.origin.x += 70;
	button_transportation.frame = frame;
	
	frame.origin.x += 70;
	button_museumsunsigthseing.frame = frame;
	
	frame.origin.x += 70;
	button_shopping.frame = frame;
	
	frame.origin.x += 70;
	button_Sponsor.frame = frame;
	
	
	frame.origin.x += 70;
	button_About.frame = frame;
	
	
}

-(void)viewWillAppear:(BOOL)animated
{
	[self.navigationController setNavigationBarHidden:YES];
	array_Global = [NSMutableArray new];
	for(int i = 0;i<[array_ph count];i++)
		[array_Global addObject:[array_ph objectAtIndex:i]]; 
	NSLog(@"d vdf");
    if(landmode_ph == 1)
		[self ViewinLandscape];
	else {
		[self ViewinPortrait];
	}
	
	
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
	if ((interfaceOrientation == UIInterfaceOrientationLandscapeLeft) || (interfaceOrientation == UIInterfaceOrientationLandscapeRight))
	{
		landmode_ph=1;
		portrMode_ph=0;
		[self ViewinLandscape];
		
	}
	else 
	{
		landmode_ph=0;
		portrMode_ph=1;
		[self ViewinPortrait];
		
	}
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
