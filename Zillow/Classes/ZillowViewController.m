//
//  ZillowViewController.m
//  Zillow
//
//  Created by gaurav sinha on 10/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ZillowViewController.h"
#import "SellHomeViewController.h"


@implementation ZillowViewController

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
	
	self.navigationItem.hidesBackButton = YES;
	arrayHome  = [[NSMutableArray alloc] init];
	[arrayHome addObject:@"Contact Me"];
	[arrayHome addObject:@"Search Homes"];
    [arrayHome addObject:@"What's my Home Worth"];
	[arrayHome addObject:@"Mortgage Calculator"];
    [arrayHome addObject:@"Buy Home"];
	[arrayHome addObject:@"Sell Home"];
	[arrayHome addObject:@"About Me"];
	

    [self.navigationItem setTitle:@"HOME"];
	[super viewDidLoad];
}

#pragma mark -
#pragma mark tableViewCode

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [arrayHome count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;              // Default is 1 if not implemented
{
	return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	if(section == 0)
		return 60;
	else 
	{
		return 0;
	}
	
}



- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section   // fixed font style. use custom view (UILabel) if you want something different
{
   return @"JEFF BLACK";
}
/////////
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{ 
	UITableViewCell *cell = [UITableViewCell new];
	cell.textLabel.text = [arrayHome objectAtIndex:indexPath.row];
	cell.accessoryType = 1;
	return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	switch (indexPath.row) {
		case 6:
		{
			LoadHtmlViewController *ZillowController = [[LoadHtmlViewController alloc] init];
			ZillowController.StringTitle = @"About Me";
			ZillowController.FileName = @"AboutMe";
			[self.navigationController pushViewController:ZillowController animated:YES];
			[ZillowController release];
			break;
		}
		case 2:
		{
			HomeWorthViewController *objHomeWorthViewController = [[HomeWorthViewController alloc] init];
			[self.navigationController pushViewController:objHomeWorthViewController animated:YES];
			[objHomeWorthViewController release];
			break;
		}
		case 1:
		{
			SearchViewController *SearchController = [[SearchViewController alloc] init];
			[self.navigationController pushViewController:SearchController animated:YES];
			[SearchController release];
			break;
		}
			case 3:
		{
			MortaggeCalculatorViewController *MortaggeCalculatorController = [[MortaggeCalculatorViewController alloc] init];
			[self.navigationController pushViewController:MortaggeCalculatorController animated:YES];
			[MortaggeCalculatorController release];
			break;
		}
		case 0:
		{
			ContactMeViewController *SearchController = [[ContactMeViewController alloc] init];
			[self.navigationController pushViewController:SearchController animated:YES];
			[SearchController release];
			break;
		}
		case 4:
		{
			BuyHomeViewController *BuyHomeController = [[BuyHomeViewController alloc] init];
			[self.navigationController pushViewController:BuyHomeController animated:YES];
			[BuyHomeController release];
			break;
		}
		case 5:
		{
			SellHomeViewController *SellHomeController = [[SellHomeViewController alloc] init];
			[self.navigationController pushViewController:SellHomeController animated:YES];
			[SellHomeController release];
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
	[arrayHome release];
	[_tableView release];
    [super dealloc];
}


@end
