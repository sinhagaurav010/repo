//
//  SplashViewController.m
//  MyappFinder
//
//  Created by gaurav sinha on 02/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SplashViewController.h"
#import "RegistrationViewController.h"
 #import "TabBarViewController.h"

@implementation SplashViewController

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

-(IBAction)forregistration:(id)sender
{
	UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Register" message:@"Free registration unlocks extra features such as vouchers and SMS services" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Not Now",@"Register",nil];
	[alert  show];
	[alert release];
}
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
	[self.navigationController setNavigationBarHidden:YES];
	[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(forregistration:) userInfo:nil repeats:NO];
    [super viewDidLoad];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
switch (buttonIndex) {
	case 0:
	{
		TabBarViewController *obj = [TabBarViewController new];
		[self.navigationController pushViewController:obj animated:YES];
		if(obj)
		{
			[obj release];
			obj   = nil;
		}
	}	
		break;
	case 1:
	{
		RegistrationViewController *obj_RegistrationViewController = [RegistrationViewController new];
		[self.navigationController pushViewController:obj_RegistrationViewController animated:YES];
		if(obj_RegistrationViewController)
		{
			[obj_RegistrationViewController  release];
			obj_RegistrationViewController = nil;
		}
	}
	break;
	default:
		break;
}
}
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
