//
//  TabBarViewController.m
//  MyappFinder
//
//  Created by gaurav sinha on 05/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TabBarViewController.h"


@implementation TabBarViewController

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

/*NSString *url1 = [NSString stringWithFormat: @"http://maps.google.com/maps?saddr=%f,%f&daddr=%f,%f", 36.17191,-115.14,36.17489,-115.1371];	
 NSURL *url = [NSURL URLWithString:url1];
 NSURLRequest *request = [NSURLRequest requestWithURL:url];
 UIWebView *webViw  = [[UIWebView alloc] initWithFrame:self.view.bounds];
 [webViw loadRequest:request];
 [self.view addSubview:webViw];
 */
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
	
	[self.navigationController setNavigationBarHidden:YES];
	[self.navigationController pushViewController:tabBar animated:YES];
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
