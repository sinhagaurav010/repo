//
//  BillpayeeViewController.m
//  MobileBanking
//
//  Created by CHROME INFOTECH  on 26/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BillpayeeViewController.h"
#import "JSON.h"
#import  "Constant.h"
#import "MakepaymentViewcontroller.h"

@implementation BillpayeeViewController

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
	
	array_buttonClicked  =   [NSMutableArray  new];
	array_Table          =    [NSMutableArray new];
	//array_Billpayee  =  [NSMutableArray new];
	//for(i)
	//[array_Billpayee  addObject:@""]
	
	arry_extra   =  [NSMutableArray  new];
	[arry_extra addObject:@"Make Payement"];
	[arry_extra addObject:@"View Pending Payements"];
	[arry_extra addObject:@"Payment History"];
    
	array_buttoncheck  =  [NSMutableDictionary new];
  	_isButtonClicked  =0 ;
	array_Button  =  [NSMutableArray  new];
	
	
	//////To set the title
	self.navigationItem.title   =  BILLPAYEETITLE;

	/////////To extract the data from the JSOn file
	NSString *filePath = [[NSBundle mainBundle] pathForResource:@"billpayer-payees-reply" ofType:@"txt"];  
	NSData *myData = [NSData dataWithContentsOfFile:filePath];  
	
	NSString *responseString = [[NSString alloc] initWithData:myData encoding: NSUTF8StringEncoding];
	
	NSMutableDictionary	*Strg_dic   =  [NSMutableDictionary  new];
	Strg_dic  = [[responseString JSONValue] copy]; 
	
	if(DEBUGG)
	NSLog(@"Strg_dicStrg_dic----%@",Strg_dic);
	
	array_Summary  =   [NSMutableArray  new];
	for(int i = 0;i<[[[[Strg_dic objectForKey:@"Reply"] objectForKey:@"BillPayerServices"]objectForKey:@"BillPayerPayee"]  count];i++)
		[array_Summary  addObject:[[[[[Strg_dic objectForKey:@"Reply"] objectForKey:@"BillPayerServices"]objectForKey:@"BillPayerPayee"]objectAtIndex:i] objectForKey:@"Nickname"]];

	for(int i=0;i<[array_Summary count];i++ )
	{
		[array_Table  addObject:[array_Summary objectAtIndex:i]];
	    [array_buttonClicked addObject:[array_Summary  objectAtIndex:i]];
	    [array_buttoncheck setObject:@"NO" forKey:[array_Summary  objectAtIndex:i]];
	}
	if(Strg_dic)
	{
		[Strg_dic  release];
		Strg_dic  =  nil;
	}
	if(DEBUGG)
	NSLog(@"Strg_dicStrg_dic----%@",array_Summary);

    ////////To make the logout button
	UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(doneButtonClick:)];          
	self.navigationItem.rightBarButtonItem = anotherButton;
    if(anotherButton)
	{
		[anotherButton   release];
		anotherButton  =  nil;
	}
	
	[super viewDidLoad];
	
}

/////////When logout button is clicked
-(IBAction)doneButtonClick:(id)sender
{
	
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
/////////////////When cell button is pressed to expand
-(IBAction)clickToExpand:(id)sender
{
	if(DEBUGG)
		NSLog(@"[sender tag]%i",[sender tag]);
    /////////Take the button from the array of buttons
	UIButton  *customButton_expand   =  [UIButton new];
	customButton_expand				=  [array_Button objectAtIndex:[sender tag]];
	
	/*if(customButton_expand.selected  ==  0)
	 customButton_expand.selected  =  1;
	 else 
	 customButton_expand.selected  =  0;*/
    
	int k=0;
	int _counterFrExtra=0;
    ///////////////////Now to check button is closed or disclose
	if([[array_buttoncheck objectForKey:[array_Summary  objectAtIndex:[sender  tag]]]isEqualToString:@"NO" ])
	{
		/////////To set the buton check Yes if it is diclose
     	[array_buttoncheck setObject:@"YES" forKey:[array_Summary  objectAtIndex:[sender  tag]]];
		
		/////To check whether button is clicked or not
		_isButtonClicked  = 1;
		
		/////////To reload the table again
		array_Table				= [NSMutableArray  new];
		
		if(DEBUGG)
			NSLog(@"[array_Summary count]  %i",[array_Summary count]+3);
		for(int i=0;i<[array_Summary count]+3;i++)
		{
			/////////To add the history ,Availabe,and balance
			if(i == [sender tag]+1 )
			{
				[array_Table  addObject:[arry_extra objectAtIndex:_counterFrExtra] ];
				_counterFrExtra++;
			}
			else if(i == [sender tag]+2 )
			{
				[array_Table  addObject:[arry_extra objectAtIndex:_counterFrExtra] ];
				_counterFrExtra++;
				
			}
			else if(i == [sender tag]+3 )
			{
				[array_Table  addObject:[arry_extra objectAtIndex:_counterFrExtra] ];
				_counterFrExtra++;
				
			}
			else
			{
				[array_Table addObject:[array_Summary objectAtIndex:k]];
				k++;
			}
			/////////////////////////
		}
		////////////To again set the value of array_Summary
		array_Summary   =  [NSMutableArray new]; 
		for(int i=0;i<[array_Table count];i++ )
			[array_Summary  addObject:[array_Table objectAtIndex:i]];
		if(DEBUGG)
			NSLog(@"array_Summary------------%@",array_Summary);
	}
	else
	{
		if(DEBUGG)
			NSLog(@"[array_Summary count]  %i",[array_Summary count]+3);
		/////////To set the buton check NO if it is close
		[array_buttoncheck setObject:@"NO" forKey:[array_Summary  objectAtIndex:[sender  tag]]];
		
	    array_Table  = [NSMutableArray  new];
		for(int i=0;i<[array_Summary count];i++ )
		{
			/////////To reload the table again
			if(i>=[sender tag]+1  &&  i<=[sender tag]+3)
			{}
			else
				[array_Table  addObject:[array_Summary objectAtIndex:i]];
		}
		array_Summary   =  [NSMutableArray new]; 
		for(int i=0;i<[array_Table count];i++ )
			[array_Summary  addObject:[array_Table objectAtIndex:i]];
		if(DEBUGG)
			NSLog(@"array_Summary------------%@",array_Summary);
	}
	[table_Billpayer reloadData];
}
//////////////////////////////////////////


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return NO;
}

//////////////////////From here, code for table view
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    return 1;
	
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [array_Table count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	UITableViewCell *cell;// = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	cell	   = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:nil] autorelease];
	
	BOOL   _toAdd;
	/////////////To add custom button to add
	///////////////This is for to check whether cell belongs to extra or main content
	for(int i=0;i<[arry_extra count];i++)
	{
		if([[array_Table objectAtIndex:indexPath.row]isEqualToString:[arry_extra objectAtIndex:i]])
		{
			_toAdd = 0;
			break;
		}
		else
			_toAdd = 1;
		
    }
	if(_toAdd == 1)
	{
		if(_IPAD == 0)
		{
			UIButton *customButton_expand  = [UIButton  new];
			//customButton_expand = [UIButton buttonWithType:UIButtonTypeContactAdd];
			if([[array_buttoncheck objectForKey:[array_Table objectAtIndex:indexPath.row]] isEqualToString:@"YES"])
				[customButton_expand setBackgroundImage:[UIImage imageNamed: @"UIButtonTypeDetailDisclosure.jpg"] forState:UIControlStateNormal];
			//	customButton_expand.selected  =  1;
			else
				[customButton_expand setBackgroundImage:[UIImage imageNamed:@"UIButtonTypeDetailclosure 2.jpg"] forState:UIControlStateNormal];			customButton_expand.frame=CGRectMake(cell.frame.origin.x,cell.frame.origin.y, cell.frame.size.height, cell.frame.size.height);
			customButton_expand.tag  =  indexPath.row;
			customButton_expand.frame=CGRectMake(cell.frame.origin.x,cell.frame.origin.y+5, 30, 30);

			[array_Button   addObject:customButton_expand];
			[customButton_expand addTarget:self action:@selector(clickToExpand:) forControlEvents: UIControlEventTouchUpInside];
			[cell addSubview:customButton_expand];
			
			if(customButton_expand)
			{
				[customButton_expand  release];
				customButton_expand  =  nil;
			}
		}
		else
		{
			UIButton *customButton_expand  = [UIButton  new];
			if([[array_buttoncheck objectForKey:[array_Table objectAtIndex:indexPath.row]] isEqualToString:@"YES"])
				[customButton_expand setBackgroundImage:[UIImage imageNamed: @"UIButtonTypeDetailDisclosure.jpg"] forState:UIControlStateNormal];
			else
				[customButton_expand setBackgroundImage:[UIImage imageNamed:@"UIButtonTypeDetailclosure 2.jpg"] forState:UIControlStateNormal];			customButton_expand.frame=CGRectMake(cell.frame.origin.x,cell.frame.origin.y, cell.frame.size.height, 70);
			customButton_expand.frame=CGRectMake(cell.frame.origin.x,cell.frame.origin.y+20, 30, 30);
			customButton_expand.tag  =  indexPath.row;
			[array_Button   addObject:customButton_expand];
			[customButton_expand addTarget:self action:@selector(clickToExpand:) forControlEvents: UIControlEventTouchUpInside];
			[cell addSubview:customButton_expand];
			
			if(customButton_expand)
			{
				[customButton_expand  release];
				customButton_expand  =  nil;
			}
		}
		/*UIButton *customButton_expand  = [UIButton  new];
	    customButton_expand = [UIButton buttonWithType:UIButtonTypeContactAdd];
		if([[array_buttoncheck objectForKey:[array_Table objectAtIndex:indexPath.row]] isEqualToString:@"YES"])
			customButton_expand.selected  =  1;
		else
			customButton_expand.selected = 0;
		customButton_expand.frame=CGRectMake(cell.frame.origin.x,cell.frame.origin.y, cell.frame.size.height, cell.frame.size.height);
		customButton_expand.tag  =  indexPath.row;
		[array_Button   addObject:customButton_expand];
	    [customButton_expand addTarget:self action:@selector(clickToExpand:) forControlEvents: UIControlEventTouchUpInside];
	    [cell addSubview:customButton_expand];*/
	}
	/*if(customButton_expand)
	 {
	 [customButton_expand   release];
	 customButton_expand   =  nil;
	 }*/
	
	/////////To set the label for content
	
	if(_IPAD == 0)
	{
		CGRect labelFrame			= CGRectMake(cell.frame.origin.x+cell.frame.size.height,cell.frame.origin.y+10, 200, 24);
		UILabel  *lblSummary		= [[UILabel alloc] initWithFrame:labelFrame];
		//lblSummary.font             =  [UIFont boldSystemFontOfSize:30]; 
		lblSummary.text				=	[array_Table objectAtIndex:indexPath.row];	
		[cell addSubview:lblSummary];
		if(lblSummary)
		{
			[lblSummary   release];
			lblSummary				=  nil;
		}
	}
	else
	{
		CGRect labelFrame			= CGRectMake(cell.frame.origin.x+cell.frame.size.height,cell.frame.origin.y, 600, 70);
		UILabel  *lblSummary		= [[UILabel alloc] initWithFrame:labelFrame];
		lblSummary.font             =  [UIFont boldSystemFontOfSize:30]; 
		lblSummary.text				=	[array_Table objectAtIndex:indexPath.row];	
		[cell addSubview:lblSummary];
		if(lblSummary)
		{
			[lblSummary   release];
			lblSummary				=  nil;
		}
  }
return cell;
	
	
}
///////////To set the hieght according to the device is ipad or iphone
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if(_IPAD == 1)
		return 80;
	else
		return 35;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
	//_whichValuePassed  =  indexPath.row;
	if([[array_Summary  objectAtIndex:indexPath.row ]isEqualToString:@"Make Payement"])
	{
	billPayee   =  [array_Summary  objectAtIndex:(indexPath.row-1) ];
		if(_IPAD == 0)
		{
				MakepaymentViewcontroller *objMakepaymentViewcontroller   =  [MakepaymentViewcontroller  new];
				[self.navigationController   pushViewController:objMakepaymentViewcontroller animated:YES];
				if(objMakepaymentViewcontroller)
				{
					[objMakepaymentViewcontroller  release];
					objMakepaymentViewcontroller  =   nil;
				}
		}
		
		else 
		{
			MakepaymentViewcontroller *obj_MakepaymentViewcontroller = [[MakepaymentViewcontroller alloc] initWithNibName:@"MakepaymentViewcontroller_Ipad" bundle:nil];
			[self.navigationController   pushViewController:obj_MakepaymentViewcontroller animated:YES];
			if(obj_MakepaymentViewcontroller)
			    {
				   [obj_MakepaymentViewcontroller  release];
				   obj_MakepaymentViewcontroller  =   nil;
			    }
			
		}

	}
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
	if(array_Summary) 
	{
		[array_Summary  release];
		array_Summary  = nil;
	}
	if(array_Billpayee) 
	{
		[array_Billpayee  release];
		array_Billpayee  = nil;
	}
	if(table_Billpayer) 
	{
		[table_Billpayer  release];
		table_Billpayer  = nil;
	}
	if(array_Button) 
	{
		[array_Button  release];
		array_Button  = nil;
	}
	if(arry_extra) 
	{
		[arry_extra  release];
		arry_extra  = nil;
	}
	if(array_buttoncheck) 
	{
		[array_buttoncheck  release];
		array_buttoncheck  = nil;
	}
	if(array_Table) 
	{
		[array_Table  release];
		array_Table  = nil;
	}
	if(array_buttonClicked) 
	{
		[array_buttonClicked  release];
		array_buttonClicked  = nil;
	}
	
	
    [super dealloc];
}


@end
