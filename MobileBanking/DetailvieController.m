//
//  DetailvieController.m
//  MobileBanking
//
//  Created by CHROME INFOTECH  on 02/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DetailvieController.h"
#import  "Constant.h"
#import  "JSON.h"
#import  "MapViewController.h"
#import  "MapViewController_Ipad.h"
@implementation DetailvieController

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
	
	self.navigationItem.title  =  @"Search Options";
	//[self.navigationController  setNavigationBarHidden:YES];
	array_ATMzip	   =   [NSMutableArray  new];	
	array_ATMstreet    =   [NSMutableArray  new];
	array_ATMcity      =   [NSMutableArray  new];
	array_ATMstate     =   [NSMutableArray  new];
	NSString *filePath = [[NSBundle mainBundle] pathForResource:@"FindLocationsJSON_Reply"ofType:@"txt"];  
	NSData *myData = [NSData dataWithContentsOfFile:filePath];  
	//NSString *responseString1 = [NSString dataWithContentsOfFile:filePath];  
	
	NSString *responseString = [[NSString alloc] initWithData:myData encoding: NSUTF8StringEncoding];
	NSLog(@"Strg_dicStrg_dic----%@",responseString);
	
	NSMutableDictionary	*Strg_dic   =  [NSMutableDictionary  new];
	Strg_dic  = [[responseString JSONValue] copy]; 
	for(int i=0;i<[[[[Strg_dic  objectForKey:@"Reply"] objectForKey:@"LocatorSearchFindLocationsReply"]objectForKey:@"Locations"]count];i++)
	{
		[array_ATMzip    addObject:   [[[[[[Strg_dic  objectForKey:@"Reply"] objectForKey:@"LocatorSearchFindLocationsReply"]objectForKey:@"Locations"]objectAtIndex:i] objectForKey:@"LocatorSearchAddress"] objectForKey:@"ZipCode"]];
		[array_ATMstreet addObject:   [[[[[[Strg_dic  objectForKey:@"Reply"] objectForKey:@"LocatorSearchFindLocationsReply"]objectForKey:@"Locations"]objectAtIndex:i] objectForKey:@"LocatorSearchAddress"] objectForKey:@"Street"]];
		[array_ATMstate  addObject:   [[[[[[Strg_dic  objectForKey:@"Reply"] objectForKey:@"LocatorSearchFindLocationsReply"]objectForKey:@"Locations"]objectAtIndex:i] objectForKey:@"LocatorSearchAddress"] objectForKey:@"State"]];
		[array_ATMcity   addObject:   [[[[[[Strg_dic  objectForKey:@"Reply"] objectForKey:@"LocatorSearchFindLocationsReply"]objectForKey:@"Locations"]objectAtIndex:i] objectForKey:@"LocatorSearchAddress"] objectForKey:@"City"]];
	}
	NSLog(@"Strg_dicStrg_dic----%@",array_ATMzip);
	NSLog(@"Strg_dicStrg_dic----%@",array_ATMstreet);
	NSLog(@"Strg_dicStrg_dic----%@",array_ATMstate);
	NSLog(@"Strg_dicStrg_dic----%@",array_ATMstate);
	CGRect frame										=	CGRectMake(0,0 ,294,342);
	scrlView.contentSize								=	frame.size;
    scrlView.scrollEnabled   =  NO;
	_searchByState  =  0;
	/*for(int i=0;i<[array_ATMstate  count];i++)
	{
	if([text_state.text  caseInsensitiveCompare:[array_ATMstate  objectAtIndex:i]])
	{
		_searchByState = 1;
		break;
	}
	}*/
	/*UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Map" style:UIBarButtonItemStylePlain target:self action:@selector(doneButtonClick:)];          
	self.navigationItem.rightBarButtonItem = anotherButton;*/
	
    [super viewDidLoad];
}
/*-(IBAction)doneButtonClick:(id)sender
{
	_fromsearchOption   =  1;
	MapViewController  *obj_Map   =   [MapViewController  new];
	[self.navigationController  pushViewController:obj_Map animated:YES];
	if(obj_Map)
	{
		[obj_Map  release];
		obj_Map   =  nil;
	}
}*/
- (BOOL)textFieldShouldReturn:(UITextField *)textField		//For rest all text field
{
	[scrlView setContentOffset:CGPointMake(0, 0) animated:YES];
	return YES;
}

//////When editing in text field start
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
	if(DEBUGG)
		NSLog(@"textFieldDidBeginEditing");
	[scrlView setContentOffset:CGPointMake(0, 86) animated:YES];
	
}

-(BOOL)textboxtextexit:(NSMutableArray *)array_ATm:(NSString *)string_textbox
{
	
	for(int i=0;i<[array_ATm count];i++)
	{
		NSLog(@"vdfsvdfsgvsdfbgvdfsbgjjjjjjjjj------%d",[[array_ATm objectAtIndex:i]caseInsensitiveCompare:string_textbox]);
	if([[array_ATm objectAtIndex:i]caseInsensitiveCompare:string_textbox]==0)
	//	if([[array_ATm objectAtIndex:i]caseInsensitiveCompare:string_textbox])
		{
		return 1;
			break;
		}
	}
	return  0;
}

-(IBAction)userdidenteringtext:(id)sender
{
	NSLog(@"textFieldDidBeginEditing");
	[scrlView setContentOffset:CGPointMake(0, 0) animated:YES];
	//[scroll_view setContentOffset:CGPointMake(0, 0) animated:YES];
	[sender resignFirstResponder];
	
}

-(IBAction)clickonapply:(id)sender
{
	NSMutableArray  *arry_Element  =   [NSMutableArray  new];
     arry_foundElement  =   [NSMutableArray  new];
	if([text_street.text length]>0)
	{
		_searchByStreet  =  [self textboxtextexit:array_ATMstreet :text_street.text]; 
	 if(_searchByStreet)
	 {
		for(int i=0;i<[array_ATMstreet count];i++)
		{
			if([[array_ATMstreet objectAtIndex:i]caseInsensitiveCompare:text_street.text]==0)
			{
				[arry_foundElement   addObject:[NSString stringWithFormat:@"%d",i]];
			}
		}
	 }
	 else
	 {
		 UIAlertView  *alert   =  [[UIAlertView  alloc]initWithTitle:@"Street Not Exit" message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
		 [alert show];
		 [alert  release];
		 return; 
 	 }
	
	}
	if([text_city.text length]>0)
	{
		
		_searchByCity  =  [self textboxtextexit:array_ATMcity :text_city.text]; 
		
		if(_searchByCity)
		{
			if([arry_foundElement count]==0)
			{
				for(int i=0;i<[array_ATMcity count];i++)
				{
					if([[array_ATMcity objectAtIndex:i]caseInsensitiveCompare:text_city.text]==0)
					{
						[arry_foundElement   addObject:[NSString stringWithFormat:@"%d",i]];
					}
				}
			}
			else
			{
				arry_Element  =   [NSMutableArray  new];
				for(int i = 0;i<[arry_foundElement count];i++)
				{
					if([[array_ATMcity objectAtIndex:[[arry_foundElement objectAtIndex:i]intValue] ] caseInsensitiveCompare:text_city.text]==0)
						[arry_Element addObject:[arry_foundElement objectAtIndex:i]];
				}
				arry_foundElement  =  [NSMutableArray  new];
				NSLog(@"arry_foundElementarry_foundElement-----%@",arry_Element);
				for(int i = 0;i<[arry_Element count];i++)
					[arry_foundElement addObject:[arry_Element objectAtIndex:i]];	
			}
			
		}
		else
		{
			UIAlertView  *alert   =  [[UIAlertView  alloc]initWithTitle:@"City Not Exit" message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
			[alert show];
			[alert  release];
			return; 
		}
		
	}
	
	
	if([text_state.text length]>0)
	{
		_searchByState  =  [self textboxtextexit:array_ATMstate :text_state.text]; 
		if(_searchByState)
		{
			if([arry_foundElement count]==0)
			{
			 for(int i=0;i<[array_ATMstate count];i++)
			 {
				if([[array_ATMstate objectAtIndex:i]caseInsensitiveCompare:text_state.text]==0)
				{
					[arry_foundElement   addObject:[NSString stringWithFormat:@"%d",i]];
				}
			 }
			}
			else
			{
				arry_Element  =   [NSMutableArray  new];
				for(int i = 0;i<[arry_foundElement count];i++)
				{
				if([[array_ATMstate objectAtIndex:[[arry_foundElement objectAtIndex:i]intValue] ] caseInsensitiveCompare:text_state.text]==0)
					[arry_Element addObject:[arry_foundElement objectAtIndex:i]];
				}
				arry_foundElement  =  [NSMutableArray  new];
				for(int i = 0;i<[arry_Element count];i++)
					[arry_foundElement addObject:[arry_Element objectAtIndex:i]];	
			}

		}
		else
		{
			UIAlertView  *alert   =  [[UIAlertView  alloc]initWithTitle:@"State Not Exit" message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
			[alert show];
			[alert  release];
			return; 
		}
		
	
	}
	if([text_zip.text length]>0)
	{
		_searchByZip  =  [self textboxtextexit:array_ATMzip :text_zip.text]; 
		if(_searchByZip)
		{
			if([arry_foundElement count]==0)
			{
				for(int i=0;i<[array_ATMzip count];i++)
				{
					if([[array_ATMzip objectAtIndex:i]caseInsensitiveCompare:text_zip.text]==0)
					{
						[arry_foundElement   addObject:[NSString stringWithFormat:@"%d",i]];
					}
				}
			}
			else
			{
				arry_Element  =   [NSMutableArray  new];
				for(int i = 0;i<[arry_foundElement count];i++)
				{
					if([[array_ATMzip objectAtIndex:[[arry_foundElement objectAtIndex:i]intValue] ] caseInsensitiveCompare:text_zip.text]==0)
						[arry_Element addObject:[arry_foundElement objectAtIndex:i]];
				}
				arry_foundElement  =  [NSMutableArray  new];
				for(int i = 0;i<[arry_Element count];i++)
					[arry_foundElement addObject:[arry_Element objectAtIndex:i]];	
			}
			
		}
		else
		{
			UIAlertView  *alert   =  [[UIAlertView  alloc]initWithTitle:@"Zip Not Exit" message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
			[alert show];
			[alert  release];
			return; 
		}
		
	}
     if([arry_foundElement count]>0)
	 {
	_fromsearchOption   =  1;
		 //UIBarButtonItem *newBackButton				= [[UIBarButtonItem alloc] initWithTitle: @"" style: UIBarButtonItemStyleBordered target: nil action: nil];
		 //	self.newBackButton.tintColor = [UIColor blackColor];
		 
		if(_IPAD  == 0)
		{
	MapViewController  *obj_Map   =   [MapViewController  new];
	[self.navigationController  pushViewController:obj_Map animated:YES];
	if(obj_Map)
	{
		[obj_Map  release];
		obj_Map   =  nil;
	}
   }
		 else {
			 MapViewController_Ipad  *obj_Map   =   [MapViewController_Ipad  new];
			 [self.navigationController  pushViewController:obj_Map animated:YES];
			 if(obj_Map)
			 {
				 [obj_Map  release];
				 obj_Map   =  nil;
			 }
		 }

  }
	
	NSLog(@"arry_foundElementarry_foundElement-----%@",arry_foundElement);
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
	[buttton_apply    release];
	[text_street     release];
	[text_city       release];
	[text_zip       release];
	[text_state       release];
	[scrlView        release];
	[navigationBar  release];
    [super dealloc];
}


@end
