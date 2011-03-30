//
//  LoadHtmlViewController.m
//  Zillow
//
//  Created by gaurav sinha on 13/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LoadHtmlViewController.h"


@implementation LoadHtmlViewController
@synthesize FileName,StringTitle;
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
- (void)viewDidLoad 
{
	[self.navigationItem setTitle:StringTitle];
	NSString *filePath;
	filePath				  = [[NSBundle mainBundle]pathForResource:FileName ofType:@"txt"];
	//webview.backgroundColor    =    [UIColor  yellowColor];
	NSString *fileContents    = [NSString stringWithContentsOfFile:filePath encoding:NSASCIIStringEncoding error:nil];
	
	NSString *str_Html		  = [NSString stringWithFormat:@"<HTML><HEAD><TITLE>Welcome</TITLE><HEAD><BODY><div id='div_id'>%@</div></BODY></HTML>", fileContents];
    _webView.delegate   =   self;
	
	[_webView loadHTMLString:str_Html baseURL:nil];
	
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


- (void)dealloc
{
	[_webView release];
    [super dealloc];
}


@end
