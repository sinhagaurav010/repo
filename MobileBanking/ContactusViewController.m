//
//  ContactusViewController.m
//  MobileBanking
//
//  Created by CHROME INFOTECH  on 26/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ContactusViewController.h"


@implementation ContactusViewController

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
- (void)viewDidLoad {
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(doneButtonClick:)];          
	self.navigationItem.rightBarButtonItem = anotherButton;
	if(anotherButton)
	{
		[anotherButton   release];
		anotherButton  =  nil;
	}
	
    [super viewDidLoad];
	
}
-(IBAction)doneButtonClick:(id)sender
{
	
	if(_IPAD == 0)
	{
		UserViewController    *objUserViewController      =    [UserViewController  new];
		objUserViewController.hidesBottomBarWhenPushed = YES;
		[self.navigationController  pushViewController:objUserViewController animated:YES];
		if(objUserViewController)
		{
			[objUserViewController  release];
			objUserViewController    =   nil;	
		}
	}
	else
	{
		UserViewController    *objUserViewController      =    [[UserViewController alloc] initWithNibName:@"UserViewController_Ipad" bundle:nil];
		objUserViewController.hidesBottomBarWhenPushed = YES;
		[self.navigationController  pushViewController:objUserViewController animated:YES];
		if(objUserViewController)
		  {
	    	 [objUserViewController  release];
		      objUserViewController    =   nil;	
		 }
    }
	
}



// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
  //  return (interfaceOrientation == UIInterfaceOrientationPortrait);
	return  NO;
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
    [super dealloc];
}


@end
