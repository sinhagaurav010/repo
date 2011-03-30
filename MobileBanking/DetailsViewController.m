//
//  DetailsViewController.m
//  MobileBanking
//
//  Created by CHROME INFOTECH  on 10/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DetailsViewController.h"
#import  "Constant.h"
 
@implementation DetailsViewController

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
	/*array_surcharge
	array_deposit*/
	self.navigationItem.title  =  DETAILSTITLE;
	label_atmstreet.text   =  [array_ATMstreet   objectAtIndex:_indexOfAnnotaion];
	label_atmState.text    =  [array_ATMstate  objectAtIndex:_indexOfAnnotaion];
	label_atmZip.text      =  [array_ATMzip    objectAtIndex:_indexOfAnnotaion];
	label_atmcity.text     =   [array_ATMcity    objectAtIndex:_indexOfAnnotaion];
	if([[array_surcharge objectAtIndex:_indexOfAnnotaion] isEqualToString:@"Surcharge Free"])
		label_atmSurcharge.text   =  @"Surcharge Free";
	else
		label_atmSurcharge.text    =  @"";
	
	if([[array_deposit  objectAtIndex:_indexOfAnnotaion]isEqualToString:@"Deposit Taking"])
		label_atmDeposit.text  =   @"Deposit Taking";
	else {
		label_atmDeposit.text  =   @"";
	}

    [super viewDidLoad];
}



// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
	return   NO;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	
	[label_atmName        release];
	[label_atmstreet      release];
	[label_atmcity        release];
	[label_atmZip         release];
	[label_atmState       release];
	[label_atmSurcharge   release];
	[label_atmDeposit     release];
	[array_surcharge      release];
	[array_deposit        release];
	
	
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
