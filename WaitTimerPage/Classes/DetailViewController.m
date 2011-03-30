    //
//  DetailViewController.m
//  WaitTimerPage
//
//  Created by gaurav sinha on 26/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "Global.h"

@implementation DetailViewController

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
	array_global = [NSMutableArray new];
	data = [DataViewController new];
	if(_fromCell == 1)
	{
		data  =(DataViewController *)[array_tab_Global objectAtIndex:_whichCell];
		text_name.text  = data.string_Name ;
		text_notes.text = data.string_notes;
		text_mobileno.text = data.string_mobile;
		text_waiting.text = data.string_waiting;	
	}
    [super viewDidLoad];
}
-(IBAction)saved:(id)sender
{
	if([text_mobileno.text  length]>0)
	{
		if([text_notes.text length]<150)
		{
	data = [DataViewController new];

	if(text_name.text)
	    data.string_Name = text_name.text;
	else
		data.string_Name = @"";
	
	if(text_notes.text)
		data.string_notes = text_notes.text;
	else
		data.string_notes = @"";
	
	if(text_mobileno.text)
		data.string_mobile = text_mobileno.text;
	else
		data.string_mobile = @"";
	
	if(text_waiting.text)
			data.string_waiting = text_waiting.text;
	else
			data.string_waiting = @"";
	if(_fromCell == 0)
	{
	//////////To take the current time from the iphone
	NSDate *today = [NSDate date];
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setTimeStyle:NSDateFormatterShortStyle];
	NSString *currentTime = [dateFormatter stringFromDate:today];
	[dateFormatter release];
	data.string_call = currentTime ;
	}
	else 
	{
		data.string_call = @"";
	}

	array_global = [NSMutableArray new];
	//data_table  = [TableViewController new];
	//2087910282
	[array_global addObject:data];

			if ([user_name length]==0 || [password length]==0) 
			{
				//if(_fromoption == 0)
				//{
				user_name = @"demo";
				password = @"demo3";
				campaignid = @"157";
				//}
			}
	NSString *url_string = [NSString stringWithFormat:@"http://www.qpins.com/api.php?api_class=subscriber&api_action=add&mobile=%@&import_mode=3&eni_campaign_id=%@&api_username=%@&api_password=%@",text_mobileno.text,campaignid,user_name,password];

	//NSString *url_string = [NSString stringWithFormat:@"http://www.qpins.com/api.php?api_class=subscriber&api_action=add&mobile=2087910282&import_mode=3&eni_campaign_id=157&api_username=demo&api_password=d3m0"];

	NSString  *string_return = [NSString stringWithContentsOfURL:[NSURL URLWithString:url_string] ];
	
	if([string_return length]>0)
	{
	[self.navigationController popViewControllerAnimated:YES];
		//[array_global addObject:data];

	}
	else
	{
		
		UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Info" message:@"Net connection is not available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert show];
		[alert release];
	}
		
	}
		else 
		{
			UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Info" message:@"Notes textfield length can'nt exceed above 150 character" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
			[alert show];
			
			[alert release];
		}

	}
	else 
	{
		UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Info" message:@"Mobile number field can't be empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert show];
		
		[alert  release];
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
	if(text_name)
	{
		[text_name release];
		text_name = nil;
	}
	if(text_mobileno)
	{
		[text_mobileno release];
		text_mobileno = nil;
	}
	if(text_notes)
	{
		[text_notes release];
		text_notes = nil;
	}
	if(text_time)
	{
		[text_time release];
		text_time = nil;
	}
	if(button_save)
	{
		[button_save release];
		button_save = nil;
	}
	if(text_waiting)
	{
		[text_waiting release];
		text_waiting = nil;
	}
	if(picker_timming)
	{
		[picker_timming release];
		picker_timming = nil;
	}
	if(data_table)
	{
		[data_table release];
		data_table = nil;
	}
	if(data)
	{
		[data release];
		data = nil;
	}
    [super dealloc];
}


@end
