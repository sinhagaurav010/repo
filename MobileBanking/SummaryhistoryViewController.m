//
//  SummaryhistoryViewController.m
//  MobileBanking
//
//  Created by CHROME INFOTECH  on 27/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SummaryhistoryViewController.h"
#import "Constant.h"
#import  "JSON.h"
@implementation SummaryhistoryViewController

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/////////////////////////////////

-(IBAction)clickToExpand:(id)sender
{
	_isButtonClicked   =   1;
	/*BOOL _isFromloop = 0;   
	NSLog(@"array_tocheckButton-wefewf---%@",array_tocheckButton);*/
	//NSLog(@"[sender tag]--%i",[sender tag]);
	_senderTag  =  [sender tag];
	//_senderTag  = [sender tag];
	
	for(int i=0;i<[sender tag];i++)
	{
		BOOL _isFromloop = 0;
		for(int j=0;j<[array_storeData count];j++)
		{
		if([[array_storeData objectAtIndex:j]isEqualToString:[array_Fordate objectAtIndex:i]]==1)
		{
			_isFromloop = 1;
			break;
		}
			else {
				_isFromloop = 0;
			}

		}
		if(_isFromloop == 0 )
			_senderTag--;
		//NSLog(@"_senderTag_senderTag=======%i",_senderTag);

	}
	//NSLog(@"_senderTag_senderTag_senderTag--------------%i",_senderTag);
	array_tocheckButton   =  [NSMutableArray  new];
	//_senderTag  = 0;
	//if(_isFromloop == 1)
	//[array_clickedButton  addObject:[NSString stringWithFormat:@"%d",_senderTag+1]];
	//else {
		[array_clickedButton  addObject:[NSString stringWithFormat:@"%d",_senderTag]];

	//}
    //
	for(int i=0;i<[array_storeData  count];i++)
	{
		int _sumOfclick= 0;
	for (int j=0; j<[array_clickedButton count]; j++) 
	{
	if ([[array_clickedButton objectAtIndex:j]integerValue ]==i)
	{
		_sumOfclick ++;
	}	
	}
		if(_sumOfclick%2!=0)
			[array_tocheckButton addObject:[NSString stringWithFormat:@"%d",i]];
	}
	
	
	array_Fordate  =  [NSMutableArray  new];
	NSLog(@"array_tocheckButton----%@",array_tocheckButton);
	
	for(int i=0;i<[array_storeData  count];i++)
	{
		[array_Fordate  addObject:[array_storeData objectAtIndex:i]];
		BOOL  _isexit = 0;
		for(int j=0;j<[array_tocheckButton  count];j++)
		{
	    if(i==[[array_tocheckButton objectAtIndex:j]integerValue ])
		 {
			_isexit  = 1;
			break;
		  }	
		}
		if(_isexit  == 1)
		{
			for(int k = 0;k<=2;k++)
			{
				switch(k)
				{
					case 0:
						[array_Fordate  addObject:[array_transfer objectAtIndex:k] ];
						break;
						
					case 1:
						[array_Fordate  addObject:[array_balance objectAtIndex:k] ];
						break;
						
					case 2:
     					[array_Fordate  addObject:[array_dateeffective objectAtIndex:k] ];
						break;
					default:
						break;
						
				}
			}
			
		}
	}
	//NSLog(@"array_Fordate%@",array_Fordate);
	[table_History reloadData];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
-(void)viewDidLoad 
{ 
	_isButtonClicked  =  0;
	_senderTag  = 0;
	_numOfclicked  = 0;
	_clickedButon  =-1;
	array_tocheckButton   =  [NSMutableArray  new];

	array_clickedButton   =  [NSMutableArray new];
	array_storeData       =  [NSMutableArray new];
	array_buttoncheck     =  [NSMutableDictionary new];
    array_SummaryHistory  =  [NSMutableArray new];
	array_transfer        =  [NSMutableArray  new];
	array_balance         =  [NSMutableArray  new];
	array_effectiveDate   =  [NSMutableArray  new];
	array_Key			  =  [NSMutableArray   new];
	/////////////To set the title
	self.navigationItem.title		= HISTORYTITLE;
	
	
	array_history					=  [NSMutableArray  new];
	
	////////To extract the data from the JSON file
	NSString *filePath				= [[NSBundle mainBundle] pathForResource:@"history-reply" ofType:@"txt"];  
	NSData *myData					= [NSData dataWithContentsOfFile:filePath];  
	NSString *responseString		= [[NSString alloc] initWithData:myData encoding: NSUTF8StringEncoding];
	NSMutableDictionary	*Strg_dic   =  [NSMutableDictionary  new];
	Strg_dic						= [[responseString JSONValue] copy];  

	if(DEBUGG)
		NSLog(@"array_historyarray_historyarray_history====%@",Strg_dic);
    //////To store the data in array
	for(int i=0;i<[[[[Strg_dic  objectForKey:@"Reply"] objectForKey:@"HistoryPageReply"]objectForKey:@"historyitem"] count];i++)
	{	
		[array_history addObject:[[[[[Strg_dic  objectForKey:@"Reply"] objectForKey:@"HistoryPageReply"]objectForKey:@"historyitem"]objectAtIndex:i] objectForKey:@"PostDate"]];
	    [array_transfer addObject:[[[[[Strg_dic  objectForKey:@"Reply"] objectForKey:@"HistoryPageReply"]objectForKey:@"historyitem"]objectAtIndex:i] objectForKey:@"Description1"] ];
		[array_balance  addObject:[[[[[Strg_dic  objectForKey:@"Reply"] objectForKey:@"HistoryPageReply"]objectForKey:@"historyitem"]objectAtIndex:i] objectForKey:@"Balance"]];
		[array_effectiveDate addObject:[[[[[Strg_dic  objectForKey:@"Reply"] objectForKey:@"HistoryPageReply"]objectForKey:@"historyitem"]objectAtIndex:i] objectForKey:@"EffectiveDate"]];
		[array_Key addObject:[[[[[Strg_dic  objectForKey:@"Reply"] objectForKey:@"HistoryPageReply"]objectForKey:@"historyitem"]objectAtIndex:i] objectForKey:@"Description2"]];

	}
	if(Strg_dic)
	{
		[Strg_dic  release];
		Strg_dic  =  nil;
	}
	if(DEBUGG)
	{
		NSLog(@"array_historyarray_historyarray_history====%@",array_history);
		NSLog(@"array_historyarray_historyarray_history====%@",array_transfer);
		NSLog(@"array_historyarray_historyarray_history====%@",array_balance);
		NSLog(@"array_historyarray_historyarray_history====%@",array_effectiveDate);
	}
	array_Fordate  =  [NSMutableArray new];
	
	///////To store the data of transfer , balance and effective date
	for(int i=0;i<[array_history count];i++)
	{
		NSString  *sting_connect  =  [[[array_history objectAtIndex:i] substringWithRange:NSMakeRange(4,2)] stringByAppendingString:@"/"];
		sting_connect             =  [sting_connect stringByAppendingString:[[array_history objectAtIndex:i] substringWithRange:NSMakeRange(6,2)] ];
		sting_connect             =  [sting_connect stringByAppendingString:@"/"];  
		sting_connect             =  [sting_connect stringByAppendingString:[[array_history objectAtIndex:i] substringWithRange:NSMakeRange(0,4)]];
		[array_Fordate addObject:sting_connect];
		[array_SummaryHistory  addObject:sting_connect];
		[array_storeData addObject:sting_connect];
	}

	for(int i=0;i<[array_Key count];i++)
	{
		[array_buttoncheck setObject:@"NO" forKey:[array_Key objectAtIndex:i]];
	}
	
	array_dateeffective           =  [NSMutableArray  new];
	
	for(int i=0;i<[array_history count];i++)
	{
		NSString  *sting_connect  =  [[[array_effectiveDate objectAtIndex:i] substringWithRange:NSMakeRange(4,2)] stringByAppendingString:@"/"];
		sting_connect             =  [sting_connect stringByAppendingString:[[array_effectiveDate objectAtIndex:i] substringWithRange:NSMakeRange(6,2)] ];
		sting_connect             =  [sting_connect stringByAppendingString:@"/"];  
		sting_connect             =  [sting_connect stringByAppendingString:[[array_effectiveDate objectAtIndex:i] substringWithRange:NSMakeRange(0,4)]];
		sting_connect             =   [sting_connect stringByAppendingString:@"  "];
		[array_dateeffective addObject:sting_connect];
	}
		
	UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(doneButtonClick:)];          
	self.navigationItem.rightBarButtonItem = anotherButton;
	if(anotherButton)
	{
		[anotherButton   release];
		anotherButton  =  nil;
	}
	
    [super viewDidLoad];

}

////////When user clicked on logout button
-(IBAction)doneButtonClick:(id)sender
{
	
	if(_IPAD == 0)
	{
		UserViewController    *objUserViewController      =    [UserViewController  new];
		objUserViewController.hidesBottomBarWhenPushed    = YES;
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
		objUserViewController.hidesBottomBarWhenPushed    = YES;
		[self.navigationController  pushViewController:objUserViewController animated:YES];
		if(objUserViewController)
          {
		   [objUserViewController  release];
		   objUserViewController    =   nil;	
		  }
	}
}

///////////////////From here code for table view start 
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    return 1;
	
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	_numOfclicked  = 0;
	for(int i = 0;i<[array_Key  count];i++)
	{
	if([[array_buttoncheck  objectForKey:[array_Key objectAtIndex:i]]isEqualToString:@"YES"])
		_numOfclicked++;
	}
	
	
    return ([array_Fordate count]);//+_numOfclicked*3);
}

/////////If device is ipad or iphone height of cell change according to that
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if(_IPAD == 1)
		return 80;
	else
	{
		BOOL _isFromTransfer = 0;
		for(int i=0;i<[array_transfer count];i++)
		{
			if([[array_Fordate objectAtIndex:indexPath.row]isEqualToString:[array_transfer objectAtIndex:i ]])
			{
				_isFromTransfer  =  1;
				break;
			}
		}
        if(_isFromTransfer == 1)
		{
			return 55;
		}
		else
		{
			return 40;
		}
	}
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	UITableViewCell *cell;// = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	cell	   = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:nil] autorelease];
	//cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

	BOOL _toAdd;
	
	for(int i=0;i<[array_storeData count];i++)
	{
		if([[array_Fordate objectAtIndex:indexPath.row]isEqualToString:[array_storeData objectAtIndex:i]])
		{
			_toAdd = 0;
			break;
		}
		else
			_toAdd = 1;
		
    }
	if(_toAdd == 0)
	{
		if(_IPAD == 0)
		{
			BOOL  _isopened = 0;
			for(int i=0;i<[array_transfer  count];i++)
			{
				if(indexPath.row !=[array_Fordate count]-1)
					if ([[array_transfer objectAtIndex:i]isEqualToString:[array_Fordate objectAtIndex:indexPath.row+1]])
					{
						//NSLog(@"sdfgdefd");
						_isopened  = 1;
						break;
					}
			}
							
			UIButton *customButton_expand  = [UIButton  new];
			if(_isopened == 1)			
				[customButton_expand setBackgroundImage:[UIImage imageNamed: @"UIButtonTypeDetailDisclosure.jpg"] forState:UIControlStateNormal];
			else
				[customButton_expand setBackgroundImage:[UIImage imageNamed:@"UIButtonTypeDetailclosure 2.jpg"] forState:UIControlStateNormal];
			customButton_expand.frame=CGRectMake(cell.frame.origin.x,cell.frame.origin.y+5, 30, 30);
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
		else
		{
			BOOL  _isopened = 0;
			for(int i=0;i<[array_transfer  count];i++)
			{
				if(indexPath.row !=[array_Fordate count]-1)
				if ([[array_transfer objectAtIndex:i]isEqualToString:[array_Fordate objectAtIndex:indexPath.row+1]])
				{
					//NSLog(@"sdfgdefd");
					_isopened  = 1;
					break;
				}
			}
			UIButton *customButton_expand  = [UIButton  new];
			//customButton_expand = [UIButton buttonWithType:UIButtonTypeContactAdd];
			if(_isopened == 1)			
				[customButton_expand setBackgroundImage:[UIImage imageNamed: @"UIButtonTypeDetailDisclosure.jpg"] forState:UIControlStateNormal];
				//customButton_expand.selected  =  1;
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
	}
	
	/////////If iphone is there	
	if(_IPAD == 0)
	{
		//////To set the label 
		CGRect labelFrame			= CGRectMake(cell.frame.origin.x+cell.frame.size.height,cell.frame.origin.y, 300, 40);
		UILabel  *lblSummary		= [[UILabel alloc] initWithFrame:labelFrame];
		//lblSummary.font             =  [UIFont boldSystemFontOfSize:30]; 
		lblSummary.numberOfLines    =2;
		BOOL _isFromTransfer = 0;
		BOOL _isFromdate = 0;

		for(int i=0;i<[array_balance count];i++)
		{
			if([[array_Fordate objectAtIndex:indexPath.row]isEqualToString:[array_balance objectAtIndex:i ]])
			{
				_isFromTransfer  =  1;
				break;
			}
			if([[array_Fordate objectAtIndex:indexPath.row]isEqualToString:[array_dateeffective objectAtIndex:i ]])
			{
				_isFromdate      =  1;
				break;
			}
		}
        if(_isFromTransfer == 1)
		{
			lblSummary.text				=	[@"Balance:" stringByAppendingString:[ array_Fordate objectAtIndex:indexPath.row]];
		}
		else if(_isFromdate == 1)
			lblSummary.text				=	[@"Effective Date:" stringByAppendingString:[ array_Fordate objectAtIndex:indexPath.row]];

		else
		{
			lblSummary.text				=	[ array_Fordate objectAtIndex:indexPath.row];
		}	
		lblSummary.lineBreakMode        = UILineBreakModeCharacterWrap;

		[cell addSubview:lblSummary];
		if(lblSummary)
		{
			[lblSummary   release];
			lblSummary				    =  nil;
		}
	 // }
	}
	///////If ipad is there
	else
	{
		CGRect labelFrame			   = CGRectMake(cell.frame.origin.x+cell.frame.size.height,cell.frame.origin.y, 700, 70);
		UILabel  *lblSummary		   = [[UILabel alloc] initWithFrame:labelFrame];
		lblSummary.font                =  [UIFont boldSystemFontOfSize:30]; 
		BOOL _isFromTransfer = 0;
		BOOL _isFromdate = 0;

		for(int i=0;i<[array_balance count];i++)
		{
			if([[array_Fordate objectAtIndex:indexPath.row]isEqualToString:[array_balance objectAtIndex:i ]])
			{
				_isFromTransfer  =  1;
				break;
			}
			if([[array_Fordate objectAtIndex:indexPath.row]isEqualToString:[array_dateeffective objectAtIndex:i ]])
			{
				_isFromdate  =  1;
				break;
			}
		}
        if(_isFromTransfer == 1)
		{
			lblSummary.text				=	[@"Balance:" stringByAppendingString:[ array_Fordate objectAtIndex:indexPath.row]];
		}
		else if(_isFromdate == 1)
			lblSummary.text				=	[@"Effective Date:" stringByAppendingString:[ array_Fordate objectAtIndex:indexPath.row]];
		
		
		else 
		{
			lblSummary.text				=	[ array_Fordate objectAtIndex:indexPath.row];
		}
	
		[cell addSubview:lblSummary];
		if(lblSummary)
		{
			[lblSummary   release];
			lblSummary				=  nil;
		}
	}
	
	
	/*if(	_isButtonClicked  == 1)
	{
	if(_clickedButon == indexPath.row)
	{
		CGRect webFrame		= CGRectMake(cell.frame.origin.x,cell.frame.origin.y+cell.frame.size.height, cell.frame.size.width, 100);
		UIWebView  *webview_cell  =  [[UIWebView alloc]initWithFrame:webFrame];
		[cell  addSubview:webview_cell];
	}
		
    }*/
	return cell;
	
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
	/*_whichValuePassed  =  indexPath.row;
    SummaryTableViewController *objSummaryTableViewController   =  [SummaryTableViewController  new];
	[self.navigationController   pushViewController:objSummaryTableViewController animated:YES];
	if(objSummaryTableViewController)
	{
		[objSummaryTableViewController  release];
		objSummaryTableViewController  =   nil;
	}*/
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
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
	if(table_History)
	{
	    [table_History  release];
		table_History  =  nil;
	}
	if(array_history)
	{
	    [array_history  release];
		array_history  =  nil;
	}
	if(array_Fordate)
	{
	    [array_Fordate  release];
		array_Fordate  =  nil;
	}
	if(array_buttoncheck)
	{
	    [array_buttoncheck  release];
		array_buttoncheck  =  nil;
	}
	if(array_Button)
	{
	    [array_Button  release];
		array_Button  =  nil;
	}
	if(array_SummaryHistory)
	{
	    [array_SummaryHistory  release];
		array_SummaryHistory  =  nil;
	}
	if(array_storeData)
	{
	    [array_storeData  release];
		array_storeData  =  nil;
	}
	if(array_Key)
	{
	    [array_Key  release];
		array_Key  =  nil;
	}
	if(array_clickedButton)
	{
	    [array_clickedButton  release];
		array_clickedButton  =  nil;
	}
	if(array_tocheckButton)
	{
	    [array_tocheckButton  release];
		array_tocheckButton  =  nil;
	}
	if(array_transfer)
	{
		[array_transfer release];
		array_transfer  = nil;
	}
	if(array_balance)
	{
		[array_balance release];
		array_balance  = nil;
	}
	if(array_effectiveDate)
	{
		[array_effectiveDate release];
		array_effectiveDate  = nil;
	}
	if(array_dateeffective)
	{
		[array_dateeffective release];
		array_dateeffective  = nil;
	}
		   
    [super dealloc];
}


@end
