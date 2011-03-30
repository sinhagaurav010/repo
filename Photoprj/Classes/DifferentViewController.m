    //
//  DifferentViewController.m
//  Photoprj
//
//  Created by gaurav sinha on 05/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DifferentViewController.h"
#define SIZE 8
#import "Global.h"
#import "FullViewController.h"
@implementation DifferentViewController

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

- (DifferentViewController *) initXMLParser {
	
	//arrayForKey					=	[NSMutableArray new];
	[super init];
	//appDelegate				= (ComiciPadAppDelegate *)[[UIApplication sharedApplication] delegate];
	return self;
}

////////////////////////////////////////////
//
-(void)parsingofComicgalleryXmlfile
{	
		NSString  *string_xml;
			switch (_whichButonClicked) {
		case 1:
			self.navigationItem.title = @"Restaurents";
			string_xml = @"xmlFilefrRest";
			break;
		case 5:
			self.navigationItem.title = @"Hotels";
		    string_xml = @"xmlFilefrhotels";
			break;
		case 6:
			self.navigationItem.title = @"Museum";
		    string_xml = @"xmlFilefrMonmnents";
			break;
        case 7:
			self.navigationItem.title = @"Shopping";
			string_xml = @"xmlFilefrShopping";
			break;
		default:
			string_xml = @"xmlFilefrWallpapers";
			break;
	}
	
	NSString *filePath					= [[NSBundle mainBundle]pathForResource:string_xml ofType:@"xml"];
	NSString *fileContents				= [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
	NSData  *galleryXmlfileData			= [fileContents dataUsingEncoding:NSUTF8StringEncoding];
	NSXMLParser *xmlParser				= [[NSXMLParser alloc] initWithData:galleryXmlfileData];
	DifferentViewController *parser		=	[[DifferentViewController alloc] initXMLParser];// Used for ehat purpose
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
		
		[arrayOfHotel  addObject:[currentElementValue stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]]] ;
	    //	if(LOGFLAG==1)
	    //	NSLog(@"comicname------------->>>%@\n",currentElementValue);
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

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
	arrayOfHotel					=	[NSMutableArray new];
	//view_main.backgroundColor = [UIColor blackColor];
	[self.navigationController setNavigationBarHidden:NO];
	NSLog(@"hello%i",_whichButonClicked);
	[self parsingofComicgalleryXmlfile];
	array_fromButton = [NSMutableArray new];
	arryForImage					= [NSArray new];
	arryForImage					= [ [arrayOfHotel objectAtIndex:0] componentsSeparatedByString:@","];
	array_Global_Different          = [NSMutableArray new];
	float wt = [arryForImage count]/SIZE;
	scrll_view.backgroundColor = [UIColor blackColor];
	CGRect frame = CGRectMake(0, 0, SIZE*185, 185*wt+185);
	scrll_view.contentSize = frame.size;
	
	for(int i = 0;i<[arryForImage count];i++)
	{
		[array_Global_Different addObject:[arryForImage objectAtIndex:i]];
	}
	//[arryForImage  addObject:[arrayOfImageGallery objectAtIndex:0]]];
	NSLog(@"--------------------------------------------------\n");
	for(int i = 0;i<[array_Global_Different count];i++)
		NSLog(@"-------------->%@",[array_Global_Different objectAtIndex:i]);
	float incY = 0;
	int counter = 0;
	BOOL _isBreak = 0;
	//for(int i = 0;i<5;i++)
	while(1)
	{
		float incX = 0.0;
		for(int j = 0;j<SIZE;j++)
		{
		    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(incX, incY, 175, 175)];
			[button setBackgroundImage:[UIImage imageNamed:[arryForImage objectAtIndex:counter]] forState:(UIControlState)UIControlStateNormal];
			button.tag = counter;
			
			[button addTarget:self action:@selector(homeButtonClicktoenter:) forControlEvents:UIControlEventTouchUpInside];
			counter++;
			[scrll_view addSubview:button];
			[array_fromButton addObject:button];
			incX += 185;
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
	int counter2 = 1; 
	/*UIButton *button_rest = [[UIButton alloc]initWithFrame:CGRectMake(718,880, 50, 50)];
	[button_rest setBackgroundImage:[UIImage imageNamed:@"home_icon.jpg"] forState:(UIControlState)UIControlStateNormal];
	//button_rest.tag = counter;
	[button_rest addTarget:self action:@selector(homeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
	button_rest.tag = counter2;
	counter2++;
	[self.view addSubview:button_rest];*/
	[super viewDidLoad];
}
-(IBAction)homeButtonClick:(id)sender
{
	[self.navigationController popToRootViewControllerAnimated:YES];
}
-(IBAction)homeButtonClicktoenter:(id)sender
{
	NSLog(@"[sender tag][sender tag][sender tag]%i",[sender tag]);
	_whichButonClicked = [sender tag];
	_FromPhotoViewContrller = 0;
	/*for(int i = 0;i<[array_Global count];i++)
		NSLog(@"array_Global---->%@",[array_Global objectAtIndex:i]);
	*/
	FullViewController *obj = [FullViewController new];
	[self.navigationController pushViewController:obj animated:YES];
	if(obj)
	{
		[obj release];
		obj = nil;
	}

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
		//[self ViewinLandscape];
		
	}
	else 
	{
		landmode=0;
		portrMode=1;
		landmode_ph = 0;
		portrMode_ph = 1;
		//[self ViewinPortrait];
		
	}
    return YES;
    //return YES;
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
