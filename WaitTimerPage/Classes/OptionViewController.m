    //
//  OptionViewController.m
//  WaitTimerPage
//
//  Created by gaurav sinha on 04/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "OptionViewController.h"
#import "Global.h"

@implementation OptionViewController

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
	_fromoption = 1;
    self.navigationItem.title = @"OPTION";
    [super viewDidLoad];
}

-(IBAction)clicktosave:(id)sender
{
//if([password_text.text isEqualToString:retypepassword_text.text ])
//{
	user_name = username_text.text;
	password  = password_text.text;
	campaignid = campign_text.text;
	
	//strin_pageMsg.text = text_view.text;
	strin_pageMsg = [NSMutableArray new];
	[strin_pageMsg addObject:text_view.text];
	if([[strin_pageMsg objectAtIndex:0] length]>150)
	{
		UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Info" message:@"Maximum length of page message is 150" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert show];
		[alert release];
	}
	else {
		[self.navigationController popViewControllerAnimated:YES];

	}

//}
/*	else
	{
		UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Info" message:@"Password and Retypepassword is not matching" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	    [alert show];
		[alert release];
	}*/   
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
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
    [super dealloc];
}


@end
