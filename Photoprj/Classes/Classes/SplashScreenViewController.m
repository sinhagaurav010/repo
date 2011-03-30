    //
//  SplashScreenViewController.m
//  Photoprj
//
//  Created by gaurav sinha on 11/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SplashScreenViewController.h"
#import "PhotoViewController.h"

@implementation SplashScreenViewController

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
-(IBAction)myCodeToCallTheView:(id)sender
{
	PhotoViewController *obj	=	[PhotoViewController new];
	[self.navigationController pushViewController:obj animated:YES];
	if(obj)
	{
		[obj release];
		obj = nil;
	}
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{	
	[activeindicator startAnimating];
	[self performSelector:@selector(myCodeToCallTheView:) withObject:nil afterDelay:2];
	[self.navigationController setNavigationBarHidden:YES];
	//self.navigationItem.backBarButtonItem.hidden = YES;
	[[self navigationItem] setBackBarButtonItem:nil ];
    [super viewDidLoad];
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
    [super dealloc];
}


@end
