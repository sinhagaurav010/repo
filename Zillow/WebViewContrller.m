//
//  WebViewContrller.m
//  Zillow
//
//  Created by gaurav sinha on 16/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WebViewContrller.h"
#import "Global.h"

@implementation WebViewContrller
@synthesize stringUrl,stringTitle;
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
	[self.navigationItem setTitle:stringTitle];
	if([DetectNetworkConnection isNetworkConnectionActive] == 1)
	{
	spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	[spinner setCenter:CGPointMake(kScreenWidth/2.0, kScreenHeight/2.0)]; // I do this because I'm in landscape mode
	[self.view addSubview:spinner]; // spinner is not visible until started
	[spinner startAnimating];
	
	_webView.delegate = self;
	[_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:stringUrl]]];
	}
	else 
	{
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"No connection found" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
		[alert show];
		[alert release];
	}

    [super viewDidLoad];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
	[spinner stopAnimating];
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
	if([_webView isLoading])
		[_webView stopLoading];
	[_webView release];
    [spinner release];
    [super dealloc];
}


@end
