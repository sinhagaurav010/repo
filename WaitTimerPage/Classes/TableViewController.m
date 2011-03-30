    //
//  TableViewController.m
//  WaitTimerPage
//
//  Created by Vinsol on 25/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TableViewController.h"
#import "DetailViewController.h"
#import "DataViewController.h"
#import "Global.h"
#import "Webviewcontroller.h"
#import "OptionViewController.h"

@implementation TableViewController
@synthesize 	array_tab;


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom  initialization.
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	//_fromoption = 0;
	self.navigationItem.title = @"";
	self.array_tab = [NSMutableArray new];
	arry_string = [NSMutableArray new];
	array_button = [NSMutableArray new];
	[Table_View reloadData];
	array_global = [NSMutableArray new];
	
	UIBarButtonItem *newBackButton	= [[UIBarButtonItem alloc] initWithTitle: @"Back" style: UIBarButtonItemStyleBordered target: nil action: nil];
	[[self navigationItem] setBackBarButtonItem: newBackButton];
	[newBackButton release];
	
	doneButton = [[UIButton alloc]initWithFrame:CGRectMake(250, 25.0, 90, 32)];
	[doneButton addTarget:self action:@selector(doneButtonClick:) forControlEvents:UIControlEventTouchUpInside];
	[doneButton setTitle:@"Options"  forState:(UIControlState)UIControlStateNormal];
	doneButton.font = [UIFont boldSystemFontOfSize:13];
	doneButton.backgroundColor = [UIColor blackColor];
	//doneButton.userInteractionEnabled = NO;
	self. navigationItem.rightBarButtonItem				= [[UIBarButtonItem alloc] initWithCustomView:doneButton];
	
	button_about = [[UIButton alloc]initWithFrame:CGRectMake(250, 25.0, 90, 32)];
	[button_about addTarget:self action:@selector(aboutbuttonclick:) forControlEvents:UIControlEventTouchUpInside];
	[button_about setTitle:@"About" forState:(UIControlState)UIControlStateNormal];
	button_about.font = [UIFont boldSystemFontOfSize:13];
	button_about.backgroundColor = [UIColor blackColor];
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button_about];

//	[self setBarButtonItems];
    [super viewDidLoad];
}
//////////When option button is clicked 
-(IBAction)doneButtonClick:(id)sender
{
	OptionViewController *obj = [OptionViewController new];
	[self.navigationController pushViewController:obj animated:YES];
	if(obj)
	{
		[obj  release];
		obj = nil;
	}
}
///////////////////////////////////////////////////////////////////////////////////////////
//When about button is clicked
-(IBAction)aboutbuttonclick:(id)sender
{
	Webviewcontroller *obj = [Webviewcontroller new];
	[self.navigationController pushViewController:obj animated:YES];
	if(obj)
	{
		[obj   release];
		obj  = nil;
	}
}

////////////////////////////////////////////////////////////////////////////
////When page button is cicked
-(IBAction)Pagebuttonclicked:(id)sender
{
	if([arry_string count]>0)
	{
		NSLog(@"hi hi%i",[[strin_pageMsg objectAtIndex:0] length]);
	if([strin_pageMsg count]==0)
	{	
		if([[strin_pageMsg objectAtIndex:0] length]==0)
		{
			strin_pageMsg = [NSMutableArray new];
			[strin_pageMsg addObject:@"This is text message"];
		}
		//strin_pageMsg = @"This is text message";
	}
		

	NSArray *comicComponent							= [[strin_pageMsg objectAtIndex:0] componentsSeparatedByString:@" "];
	data_fetch = [array_tab objectAtIndex:[sender tag]];
	NSString *string_inUrl = [comicComponent objectAtIndex:0];
	for(int i = 1;i<[comicComponent count];i++)
	{
		string_inUrl = [string_inUrl stringByAppendingString:@"+"];
		string_inUrl = [string_inUrl stringByAppendingString:[comicComponent objectAtIndex:i]];
	}
		NSLog(@"string_inUrlstring_inUrl%@",string_inUrl);
	//	NSString *url_string = [NSString stringWithFormat:@"http://www.qpins.com/api.php?api_class=message&api_action=sendmsg2list&msg=%@&eni_campaign_id=%@&list=2087910282&api_username=demo&api_password=d3m0",string_inUrl,campaignid,data_fetch.string_mobile,user_name,password];
    //  2087910282
	if ([user_name length]==0 || [password length]==0) 
	{
		//if(_fromoption == 0)
		//{
			user_name = @"demo";
			password = @"demo3";
			campaignid = @"157";
		//}
	}
		
	NSString *url_string = [NSString stringWithFormat:@"http://www.qpins.com/api.php?api_class=message&api_action=sendmsg2list&msg=%@&eni_campaign_id=%@&list=%@&api_username=%@&api_password=%@",string_inUrl,campaignid,data_fetch.string_mobile,user_name,password];
	
	NSString  *string_return = [NSString stringWithContentsOfURL:[NSURL URLWithString:url_string] ];
	if(!string_return)
	{
		UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"info" message:@"Net connection  not available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert show];
		[alert release];
	}
	else 
	{
		UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"info" message:@"Page has been sent" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert show];
		[alert release];
	}

	}
}
////////////////////////////////////////////////////////////////////////////
/////To set the section and number of row and hieght of row of table 
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	// The number of sections is based on the number of items in the data property list.
	return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	return ([self.array_tab count]+2);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 50;
	
}
////////////////////////////////////////////////////////////////////////////

/////////////////////When view will appear
-(void)viewWillAppear:(BOOL)animated
{
	if([array_global count]>0)
	{

		for(int i = 0;i<[array_global count];i++)
		{
			
			if(_fromCell == 0)
			{
			    [array_tab addObject:[array_global objectAtIndex:i]];
				data_fetch = [DataViewController new];
				data_fetch = [array_tab objectAtIndex:i];
				[arry_string addObject:data_fetch.string_notes] ;

			}
			else 
			{
				DataViewController *data_fetch1 = [array_tab objectAtIndex:_whichCell];
				data_fetch = [DataViewController new];
				data_fetch = [array_global objectAtIndex:i];
				data_fetch.string_call = data_fetch1.string_call;
				[array_tab replaceObjectAtIndex:_whichCell withObject:data_fetch];
				[arry_string replaceObjectAtIndex:_whichCell withObject:data_fetch.string_call];
			}

		
		}
		if([array_tab count]>0)
		{
			array_tab_Global = [NSMutableArray new];
			for(int i= 0;i<[array_tab count];i++)
				[array_tab_Global addObject:[array_tab objectAtIndex:i]];
		}
		[array_global removeAllObjects];
			[Table_View reloadData];
	}
}
////////////////////////////////////////////////////////////////////////////

-(IBAction)clickTodelete:(id)sender
{
	UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Info" message:@"Are you really want to delete the customer!" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES",nil];
	_todelete = [sender tag];
	_whichAlert = 1;
	[alert show];
	[alert release];
	
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	if(_whichAlert == 1)
	{
		_whichAlert = 0;
	switch(buttonIndex) {
		case 0:
			//cancel
			//resume		=	0;
			//[[NSUserDefaults standardUserDefaults] removeObjectForKey:[NSString stringWithFormat:@"%i",comicsNum]]; 
			//[self functionToInsidecomicsViewController]	;
			break;
		case 1:
			[array_tab removeObjectAtIndex:_todelete];
			[array_button removeObjectAtIndex:_todelete];
			NSLog(@"asdcvad");
			[array_tab_Global removeObjectAtIndex:_todelete];
			
			/*for(int i = _todelete;i<[array_button count];i++)
			{
				UIButton *button = [array_button objectAtIndex:i];
				button.tag--;
			}*/
			[Table_View reloadData];			
			break;
		default:
			break;
	}
	}
}
////////////////////////////////////////
-(IBAction)NoteButtonClicked:(id)sender
{
	data_fetch = [DataViewController new];
	data_fetch = [array_tab objectAtIndex:[sender  tag]];
	UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Page Message" message:data_fetch.string_notes delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert show];
	alert = nil;
}
//////////////////////////////////////
/////Code for the table view
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	UITableViewCell *cell;// = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	//if (cell == nil) {
	cell				   = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:nil] autorelease];
	if(indexPath.row == 0)
	{
		UILabel *labelName = [[UILabel alloc]initWithFrame:CGRectMake(cell.frame.origin.x+34, cell.frame.origin.y+5, 90, 25)];
		labelName.text = @"Name";
		labelName.backgroundColor = [UIColor clearColor];
		labelName.font = [UIFont systemFontOfSize:22];
		[cell addSubview:labelName];
		if(labelName)
		{
			[labelName release];
			labelName = nil;
		}
		
		UILabel *labelmob = [[UILabel alloc]initWithFrame:CGRectMake(cell.frame.origin.x+180, cell.frame.origin.y+5, 90, 25)];
		labelmob.text = @"Mobile";
		labelmob.font = [UIFont systemFontOfSize:22];
		labelmob.backgroundColor = [UIColor clearColor];
		[cell addSubview:labelmob];
		if(labelmob)
		{
			[labelmob release];
			labelmob = nil;
		}
		
		UILabel *labeltime = [[UILabel alloc]initWithFrame:CGRectMake(cell.frame.origin.x+300, cell.frame.origin.y+5, 90, 25)];
		labeltime.text = @"Time";
		labeltime.font = [UIFont systemFontOfSize:22];
		labeltime.backgroundColor = [UIColor clearColor];
		[cell addSubview:labeltime];
		if(labeltime)
		{
			[labeltime  release];
			labeltime = nil;
		}
		
		UILabel *labelwait = [[UILabel alloc]initWithFrame:CGRectMake(cell.frame.origin.x+410, cell.frame.origin.y+5, 110, 25)];
		labelwait.text = @"Waiting On";
		labelwait.font = [UIFont systemFontOfSize:22];
		labelwait.backgroundColor = [UIColor clearColor];
		[cell addSubview:labelwait];
		if(labelwait)
		{
			[labelwait release];
			labelwait = nil;
		}
		
		UILabel *labelnotes = [[UILabel alloc]initWithFrame:CGRectMake(cell.frame.origin.x+570, cell.frame.origin.y+5, 90, 25)];
		labelnotes.text = @"Notes";
		labelnotes.font = [UIFont systemFontOfSize:22];
		labelnotes.backgroundColor = [UIColor clearColor];
		[cell addSubview:labelnotes];
		if(labelnotes)
		{
			[labelnotes release];
			labelnotes = nil;
		}
	}
	else if(indexPath.row == [array_tab count]+1)
	{//UIButtonTypeContactAdd
		UIButton *customButton_expand  = [UIButton new  ];
		customButton_expand  = [UIButton buttonWithType:UIButtonTypeContactAdd  ];
		customButton_expand.frame=CGRectMake(cell.frame.origin.x,cell.frame.origin.y+5, 29, 29);
		customButton_expand.tag  =  indexPath.row;
	    [customButton_expand addTarget:self action:@selector(clickToExpand:) forControlEvents: UIControlEventTouchUpInside];
	    [cell addSubview:customButton_expand];
		
		UILabel *labelwait = [[UILabel alloc]initWithFrame:CGRectMake(cell.frame.origin.x+36, cell.frame.origin.y+5, 200, 25)];
		labelwait.text = @"Add customer";
		labelwait.backgroundColor = [UIColor clearColor];
		labelwait.font = [UIFont systemFontOfSize:25];
		[cell addSubview:labelwait];
		/*if(customButton_expand)
		{
			[customButton_expand  release];
			customButton_expand  =  nil;
		}*/
	
	}
	else 
	{
		if([self.array_tab count]>0)
		{
		
			//[Table_View deselectRowAtIndexPath:indexPath animated:NO];
			//[Table_View setEditing:YES animated:YES];

	    	data_fetch = [DataViewController new];
     		data_fetch = [array_tab objectAtIndex:indexPath.row-1];
		    UIButton *customButton_expand  = [UIButton new  ];
			[customButton_expand setBackgroundImage:[UIImage imageNamed:@"deletebtn.png"] forState:(UIControlState)UIControlStateNormal];
			customButton_expand.frame=CGRectMake(cell.frame.origin.x,cell.frame.origin.y+5, 29, 29);
			customButton_expand.tag  =  indexPath.row-1;
			[customButton_expand addTarget:self action:@selector(clickTodelete:) forControlEvents: UIControlEventTouchUpInside];
			[array_button addObject:customButton_expand];
			[cell addSubview:customButton_expand];
			
			
			UILabel *labelName = [[UILabel alloc]initWithFrame:CGRectMake(cell.frame.origin.x+34, cell.frame.origin.y+5, 150, 25)];
			labelName.text = data_fetch.string_Name;
			labelName.textAlignment = UITextAlignmentLeft;
			labelName.backgroundColor = [UIColor clearColor];
			labelName.font = [UIFont systemFontOfSize:20];
			[cell addSubview:labelName];
			if(labelName)
			{
				[labelName release];
				labelName = nil;
			}
			
			UILabel *labelmob = [[UILabel alloc]initWithFrame:CGRectMake(cell.frame.origin.x+160, cell.frame.origin.y+5, 140, 25)];
			labelmob.text = data_fetch.string_mobile;
			labelmob.font = [UIFont systemFontOfSize:20];
			labelmob.backgroundColor = [UIColor clearColor];
			[cell addSubview:labelmob];
			if(labelmob)
			{
				[labelmob release];
				labelmob = nil;
			}
			
			UILabel *labeltime = [[UILabel alloc]initWithFrame:CGRectMake(cell.frame.origin.x+300, cell.frame.origin.y+5, 90, 25)];
			labeltime.text = data_fetch.string_call;
			labeltime.font = [UIFont systemFontOfSize:20];
			labeltime.textAlignment = UITextAlignmentCenter; 
			labeltime.backgroundColor = [UIColor clearColor];
			[cell addSubview:labeltime];
			if(labeltime)
			{
				[labeltime  release];
				labeltime = nil;
			}
			
			UILabel *labelwait = [[UILabel alloc]initWithFrame:CGRectMake(cell.frame.origin.x+410, cell.frame.origin.y+5, 110, 25)];
			labelwait.text = data_fetch.string_waiting;
			labelwait.font = [UIFont systemFontOfSize:20];
			labelwait.textAlignment = UITextAlignmentCenter;
			labelwait.backgroundColor = [UIColor clearColor];
			[cell addSubview:labelwait];
			if(labelwait)
			{
				[labelwait release];
				labelwait = nil;
			}
			
			UILabel *labelnotes = [[UILabel alloc]initWithFrame:CGRectMake(cell.frame.origin.x+538, cell.frame.origin.y+5, 90, 25)];
			labelnotes.text = data_fetch.string_notes;
			labelnotes.font = [UIFont systemFontOfSize:20];
			labelnotes.backgroundColor = [UIColor clearColor];
			[cell addSubview:labelnotes];
			if(labelnotes)
			{
				[labelnotes release];
				labelnotes = nil;
			}
			button_about = [[UIButton alloc]initWithFrame:CGRectMake(cell.frame.origin.x+640, cell.frame.origin.y+5, 50, 32)];
			[button_about addTarget:self action:@selector(Pagebuttonclicked:) forControlEvents:UIControlEventTouchUpInside];
			[button_about setTitle:@"Page" forState:(UIControlState)UIControlStateNormal];
			button_about.font = [UIFont boldSystemFontOfSize:13];
			button_about.tag = indexPath.row-1;
			button_about.backgroundColor = [UIColor blackColor];
			
			UIButton *button_about1 = [[UIButton alloc]initWithFrame:CGRectMake(cell.frame.origin.x+695, cell.frame.origin.y+5, 50, 32)];
			[button_about1 addTarget:self action:@selector(NoteButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
			[button_about1 setTitle:@"Notes" forState:(UIControlState)UIControlStateNormal];
			button_about1.font = [UIFont boldSystemFontOfSize:13];
			button_about1.tag = indexPath.row-1;
			button_about1.backgroundColor = [UIColor blackColor];
			[cell addSubview:button_about1];
			
			
			[cell addSubview:button_about];
			if(button_about1)
			{
				[button_about1 release];
				button_about1  = nil;
			}
		}
	}

	cell.selectionStyle   =  UITableViewCellSelectionStyleNone;
	return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if(indexPath.row != 0 && indexPath.row != [array_tab count]+1)
	{
	_fromCell = 1;
	_fromButton = 0;
	_whichCell = indexPath.row-1;
	DetailViewController *obj = [DetailViewController new];
	[self.navigationController pushViewController:obj animated:YES];
	if(obj)
	{
		[obj release];
		obj = nil;
	}
	}
}
////////////////////////////////////////////////////////////////////////////


-(IBAction)clickToExpand:(id)sender
{
	_fromButton = 1;
	_fromCell = 0;
	DetailViewController *obj  = [DetailViewController new];
	[self.navigationController pushViewController:obj animated:YES];
	if(obj)
	{
		[obj release];
		obj = nil;
	}
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
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
	if(Table_View)
	{
		[Table_View release];
		Table_View = nil;
	}
	if(data_fetch)
	{
		[data_fetch release];
		data_fetch = nil;
	}
	if(doneButton)
	{
		[doneButton release];
		doneButton = nil;
	}
	if(button_about)
	{
		[button_about release];
		button_about = nil;
	}
	if(arry_string)
	{
		[arry_string release];
		arry_string = nil;
	}
	if(array_tab)
	{
		[array_tab release];
		array_tab = nil;
	}
	if(array_button )
	{
		[array_button  release];
		array_button  = nil;
	}
	
	
	
	
    [super dealloc];
}


@end
