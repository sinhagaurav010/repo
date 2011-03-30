//
//  SellHomeViewController.m
//  Zillow
//
//  Created by gaurav sinha on 17/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SellHomeViewController.h"


@implementation SellHomeViewController

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
    
    [self.navigationItem setTitle:SELLHOMETITLE];
	
	arrayElement = [[NSMutableArray alloc] init];
	[arrayElement addObject:@"I am Ready to sell"];
	[arrayElement addObject:@"Make an Appointment"];
	[arrayElement addObject:@"Tips to Prepare your home"];
	[arrayElement addObject:@"Marketting your Home"];
	[arrayElement addObject:@"Setting a Price"];
    [super viewDidLoad];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [arrayElement count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;              // Default is 1 if not implemented
{
	return 1;
}
/////////
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{ 
	UITableViewCell *cell = [UITableViewCell new];
	cell.textLabel.text = [arrayElement objectAtIndex:indexPath.row];
	cell.accessoryType = 1;
	return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	void (^now)(void) = ^(void)
	{
		UIBarButtonItem *newBackButton	 = [[UIBarButtonItem alloc] initWithTitle: @"Back" style: UIBarButtonItemStyleBordered target: nil action: nil];
		[[self navigationItem] setBackBarButtonItem: newBackButton];
		[newBackButton release];
	};
	switch (indexPath.row) {
		case 0:
		{
			now();
			IAmReadyToSellViewController *IAmReadyToSellController = [[IAmReadyToSellViewController alloc] init];
			[self.navigationController pushViewController:IAmReadyToSellController animated:YES];
			[IAmReadyToSellController release];
			//WebViewContrller *webController = [[WebViewContrller alloc] init];
//			webController.stringUrl = YOUTUBE; 
//			webController.stringTitle = CHANNEL;
//			[self.navigationController pushViewController:webController animated:YES];
//			[webController release];
			break;
		}
		case 1:
		{
			now();
			AppointmentViewController *AppointmentController = [[AppointmentViewController alloc] init];
			[self.navigationController pushViewController:AppointmentController animated:YES];
			[AppointmentController release];
			//WhatICanAffrdViewController *WhatICanAffrdController = [[WhatICanAffrdViewController alloc] init];
//			[self.navigationController pushViewController:WhatICanAffrdController animated:YES];
//			[WhatICanAffrdController release];
			break;
		}
		case 2:
		{
			now();

			LoadHtmlViewController *ZillowController = [[LoadHtmlViewController alloc] init];
			ZillowController.StringTitle = @"Tips to Prepare your Home";
			ZillowController.FileName = @"TipsTo";
			[self.navigationController pushViewController:ZillowController animated:YES];
			[ZillowController release];
			break;
		}
		case 3:
		{
			now();

			LoadHtmlViewController *ZillowController = [[LoadHtmlViewController alloc] init];
			ZillowController.StringTitle = @"Marketing your Home";
			ZillowController.FileName = @"Marketting";
			[self.navigationController pushViewController:ZillowController animated:YES];
			[ZillowController release];
			break;
		}
		case 4:
		{
			now();

			LoadHtmlViewController *ZillowController = [[LoadHtmlViewController alloc] init];
			ZillowController.StringTitle = @"Setting a Price";
			ZillowController.FileName = @"setprice";
			[self.navigationController pushViewController:ZillowController animated:YES];
			[ZillowController release];
			break;
		}
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
	[_tableView release];
	[arrayElement release];
    [super dealloc];
}


@end
