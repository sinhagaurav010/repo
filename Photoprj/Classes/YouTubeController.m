    //
//  YouTubeController.m
//  Photoprj
//
//  Created by gaurav sinha on 06/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "YouTubeController.h"


@implementation YouTubeController

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
	NSString *htmlString = @"<html><head><meta name = \"viewport\" content = \"initial-scale = 1.0, user-scalable = no, width = 212\"/></head><body style=\"background:#F00;margin-top:0px;margin-left:0px\"><div><object width=\"212\" height=\"172\"><param name=\"movie\" value=\"http://www.youtube.com/v/oHg5SJYRHA0&f=gdata_videos&c=ytapi-my-clientID&d=nGF83uyVrg8eD4rfEkk22mDOl3qUImVMV6ramM\"></param><param name=\"wmode\" value=\"transparent\"></param><embed src=\"http://www.youtube.com/v/oHg5SJYRHA0&f=gdata_videos&c=ytapi-my-clientID&d=nGF83uyVrg8eD4rfEkk22mDOl3qUImVMV6ramM\"type=\"application/x-shockwave-flash\" wmode=\"transparent\" width=\"212\" height=\"172\"></embed></object></div></body></html>";
	[web_view loadHTMLString:htmlString baseURL:[NSURL URLWithString:@"http://www.youtube.com/watch?v=WkbDuFpxlCk"]];
   /* NSString *url = @"http://www.youtube.com/watch?v=WkbDuFpxlCk";
	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
	[web_view loadRequest:request];*/
	[self.navigationController setNavigationBarHidden:NO];
	self.navigationItem.title  =  @"You tube";
	anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStylePlain target:self action:@selector(doneButtonClick:)];          
	self.navigationItem.rightBarButtonItem = anotherButton;
	
    [super viewDidLoad];
}
-(IBAction)homeButtonClick:(id)sender
{
	[self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}

-(IBAction)doneButtonClick:(id)sender
{
	[self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
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
	if(web_view)
	{
	[web_view release];
		web_view = nil;
	}
	if(anotherButton)
	{
		[anotherButton release];
		anotherButton = nil;
	}
    [super dealloc];
}


@end
