//
//  SplashScreenViewControler.m
//  Zillow
//
//  Created by gaurav sinha on 18/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SplashScreenViewControler.h"


@implementation SplashScreenViewControler

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

-(IBAction)theActionMethod:(id)sender
{
	ZillowViewController *ZillowController = [[ZillowViewController alloc] init];
	[self.navigationController pushViewController:ZillowController animated:YES];
	[self.navigationController setNavigationBarHidden:NO animated:NO];
	[[self navigationItem] setBackBarButtonItem: nil];
	[ZillowController release];
}
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(theActionMethod:) userInfo:nil repeats:NO];
	
	[self.navigationController setNavigationBarHidden:YES];
	
    [super viewDidLoad];
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
