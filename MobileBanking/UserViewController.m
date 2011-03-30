//
//  UserViewController.m
//  MobileBanking
//
//  Created by CHROME INFOTECH  on 25/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "UserViewController.h"


@implementation UserViewController

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
- (void)viewDidLoad
{
	_fromsearchOption   =   0;
	CGRect frame										=	CGRectMake(0,0 ,294,342);
	scroll_view.contentSize								=	frame.size;
	
	UIBarButtonItem *backButton	= [[UIBarButtonItem alloc] initWithTitle: @"Back" style: UIBarButtonItemStyleBordered target: nil action: nil];
	[[self navigationItem] setBackBarButtonItem: backButton];
	[backButton release];
	
	//[button_remember setBackgroundImage:[UIImage imageNamed:@"checkbox.png"] forState:UIControlStateNormal];
	[self.navigationController  setNavigationBarHidden:YES];
	button_remember.selected   =   0;
	
	
	if ([[NSUserDefaults standardUserDefaults]objectForKey:@"user"])
	{
		user_text.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"user"];
		//[button_remember setBackgroundImage:[UIImage imageNamed:@"checkboxchecked.png"] forState:UIControlStateNormal];
		button_remember.selected   =   0;
	}
	if(DEBUGG == 1)
	NSLog(@"[[NSUserDefaults standardUserDefaults] stringForKey:@""];%@",[[NSUserDefaults standardUserDefaults] stringForKey:@"user"]);

	self.navigationItem.title    =  LOGINTITLE;
	//button_enter.  =  [UIColor  redColor];
	

    [super viewDidLoad];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField		//For rest all text field
{
	[scroll_view setContentOffset:CGPointMake(0, 0) animated:YES];
	return YES;
}

//////When editing in text field start
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
	if(DEBUGG)
	NSLog(@"textFieldDidBeginEditing");
	[scroll_view setContentOffset:CGPointMake(0, 140) animated:YES];
		
}
///////////////////////////////////////////////

//////When editing in text field finished
-(IBAction)userdidenteringtext:(id)sender
{
	NSLog(@"textFieldDidBeginEditing");

	[scroll_view setContentOffset:CGPointMake(0, 0) animated:YES];
	[sender resignFirstResponder];
	
}
///////////////////////////////////////////////

//////When presstoremember is pressed 
-(IBAction)pressToRemember:(id)argName
{
	
	if (button_remember.selected == 0)
		button_remember.selected  = 1;
	else
		button_remember.selected  = 0;
	
	if(button_remember.selected  == 1)
	{
		[button_remember setBackgroundImage:[UIImage imageNamed:@"checkboxchecked.png"] forState:UIControlStateNormal];
		if ([[NSUserDefaults standardUserDefaults]objectForKey:@"user"])
		{
			[[NSUserDefaults standardUserDefaults] removeObjectForKey:@"user"];
		}
		NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
		[standardUserDefaults setObject:user_text.text forKey:@"user"];
		[standardUserDefaults synchronize];		
		//NSLog(@"sdvdfs--->%@",user_text.text);

		//- (void)setInteger:(NSInteger)value forKey:(NSString *)defaultName;
	
	}
	
	else 
	{
		[button_remember setBackgroundImage:[UIImage imageNamed:@"checkbox.png"] forState:UIControlStateNormal];
		if ([[NSUserDefaults standardUserDefaults]objectForKey:@"user"])
		{
			[[NSUserDefaults standardUserDefaults] removeObjectForKey:@"user"]; 
			
		}
		
	}

}
///////////////////////////////////////////////

//////////When user press to enter in Summmary section
-(IBAction)pressToEnter:(id)argName
{
	BOOL _shouldenter = 0;
    ////To check the user name and password
	if([user_text.text isEqualToString:@"12345"])
	{
		if([password_text.text isEqualToString:@"12345"])
		{
			_shouldenter  = 1;
		}
	}
	if(_shouldenter  == 1)
	{
      if(button_remember.selected  == 0)
	  {
		  
		  if ([[NSUserDefaults standardUserDefaults]objectForKey:@"user"])
		  {
			  [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"user"]; 
			  
		  }
		  user_text.text  =  @"";
	  }
	password_text.text =  @"";
		
	////////If user name and password is correct then check whether it is ipad or iphone if iphone	
	if(_IPAD == 0)
	{
	SummaryViewController  *obj_SummaryViewController   =   [SummaryViewController  new];
	[self.navigationController  pushViewController:obj_SummaryViewController animated:YES];
	
	if(obj_SummaryViewController)
	  {
		[obj_SummaryViewController   release];
		obj_SummaryViewController   =   nil;
	  }
	}
		///////else ipad
		else {
			SummaryViewController *obj_SummaryViewController = [[SummaryViewController alloc] initWithNibName:@"TabbarController_Ipad" bundle:nil];
			[self.navigationController   pushViewController:obj_SummaryViewController animated:YES];
			if(obj_SummaryViewController)
			{
				[obj_SummaryViewController  release];
				obj_SummaryViewController  =   nil;
			}
			
		}

    }
	/////////If username or password is not correct the alert view will popup
	else
	{
		UIAlertView *alert	=	[[UIAlertView alloc]initWithTitle:@"Either wrong Username or Password " message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil,nil];
		[alert show];
		[alert release];
	}
}
///////////////////////////////////////////////



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
	if(user_text)
	{
		[user_text  release];
		user_text  =  nil;
	}
	if(password_text)
	{
		[password_text  release];
		password_text  =  nil;
	}
	if(button_remember)
	{
		[button_remember  release];
		button_remember  =  nil;
	}
	if(button_enter)
	{
		[button_enter  release];
		button_enter  =  nil;
	}
	
	
    [super dealloc];
}


@end
