//
//  PropertyImaeViewController.m
//  Zillow
//
//  Created by gaurav sinha on 14/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PropertyImaeViewController.h"


@implementation PropertyImaeViewController
@synthesize arrayImage;
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
	_counter = 1;
	
	_leftButton.enabled = NO;
	
	self.view.backgroundColor = [UIColor  blackColor];
	[self.navigationItem setTitle:[NSString stringWithFormat:@"1 of %d photos",[arrayImage count]]];
	
	UIBarButtonItem *newBackButton				= [[UIBarButtonItem alloc] initWithTitle: @"Back" style: UIBarButtonItemStyleBordered target:self action:@selector(Close)];
	self.navigationItem.rightBarButtonItem = newBackButton;
	[newBackButton release];
	
	_scrollView.backgroundColor = [UIColor blackColor];
	[_scrollView setContentSize:CGSizeMake(320*[arrayImage count], 460-44)];
	int incX = 0;
	
	_scrollView.scrollEnabled = NO;
	//_scrollView.pagingEnabled = YES;
	for(int i=0;i<[arrayImage count];i++)
	{
		UIImageView *_imageView = [[UIImageView alloc] initWithFrame:CGRectMake(incX, 5,310 , 450-44)];
		_imageView.image = [arrayImage objectAtIndex:i];
		incX += 320;
		[_scrollView addSubview:_imageView];
		[_imageView release];
	}
	[_scrollView setContentOffset:CGPointMake(0, 0)];
    [super viewDidLoad];
}
-(void)Close
{
	[self dismissModalViewControllerAnimated:YES];
}


#pragma mark -
#pragma mark ToMove

-(IBAction)ToMoveRight:(id)sender
{
	if(_counter<[arrayImage count])
	{
		_counter++;
		if(_leftButton.enabled == NO)
			_leftButton.enabled = YES;
		[self.navigationItem setTitle:[NSString stringWithFormat:@"%d of %d photos",_counter,[arrayImage count]]];
		[_scrollView setContentOffset:CGPointMake(320*(_counter-1), 0) animated:YES];
	}
	else 
	{
		_rightButton.enabled = NO;	
	}

}
-(IBAction)ToMoveLeft:(id)sender
{
	if(_counter >1)
	{
		_counter--;
		if(_rightButton.enabled == NO)
			_rightButton.enabled = YES;
		[self.navigationItem setTitle:[NSString stringWithFormat:@"%d of %d photos",_counter,[arrayImage count]]];
		[_scrollView setContentOffset:CGPointMake(320*(_counter-1), 0) animated:YES];
	}
	else 
	{
		_leftButton.enabled = NO;	
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
	[arrayImage release];
	[_scrollView release];
	[_leftButton release];
	[_rightButton release];
    [super dealloc];
}


@end
