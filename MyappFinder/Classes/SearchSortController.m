//
//  SearchSortController.m
//  MyappFinder
//
//  Created by gaurav sinha on 12/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SearchSortController.h"
#import "DataController.h"
#import "NearByDetailsViewController.h"
#import "MapForViewController.h"
@implementation SearchSortController

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
	
	//[self.navigationItem setTitle:@"Favourites"];
	
	UIBarButtonItem *DirectionButton	   = [[UIBarButtonItem alloc] initWithTitle: @"Map" style: UIBarButtonItemStyleBordered target:self action:@selector(ClickForMap:)];
	self.navigationItem.rightBarButtonItem = DirectionButton;
	[DirectionButton release];
	
	share = [SharedInstance sharedInstance];
	arrayNearByDetails	= [NSMutableArray new];
	arrayNearByDetails	= [DataController sortByCountry:[[share gettheMutablearrayWithSort] objectAtIndex:[share getFieldValueAtPos:2]]];
	
	UITableView	 *table = [[UITableView  alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
	table.delegate		= self;
	table.dataSource	= self;
	[self.view addSubview:table];
	
    [super viewDidLoad];
}

-(IBAction)ClickForMap:(id)sender
{
	[share setlocationLat:[DataController latitudeArray:arrayNearByDetails]];
	[share setlocationLog:[DataController longArray:arrayNearByDetails]];
	[share setNameArray:[DataController nameArray:arrayNearByDetails]];
	MapForViewController *objMapForViewController = [MapForViewController  new];
	[self.navigationController pushViewController:objMapForViewController animated:YES];
	if(objMapForViewController)
	{
		[objMapForViewController  release];
		objMapForViewController  =  nil;
	}
}
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

///////Code for the table View
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [arrayNearByDetails  count];
	
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView              // Default is 1 if not implemented
{
	return 1;	
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 80;
}
/////////////////////
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[share saveDictionary:[arrayNearByDetails objectAtIndex:indexPath.row]];
	NearByDetailsViewController *objNearByViewController = [NearByDetailsViewController new];
	[self.navigationController pushViewController:objNearByViewController animated:YES];
	if(objNearByViewController)
	{
		[objNearByViewController release];
		objNearByViewController = nil;
	}
}

//////////Uibutton view
-(UIImageView*)buttonView:(NSInteger)index
{
	
	UIImageView  *button  = [[UIImageView alloc]initWithFrame:frameOfView];
	switch (index) {
		case 0:
		{
			button.image  = [UIImage imageNamed:@"wifi.png"];
			break;
		}
		case 1:
		{
			button.image  = [UIImage imageNamed:@"cashless.png"];
			break;
		}
		case 2:
		{
			button.image  = [UIImage imageNamed:@"car.png"];
			break;
		}
		case 3:
		{
			button.image  = [UIImage imageNamed:@"wheelchair.png"];
			break;
		}
		case 4:
			button.image  = [UIImage imageNamed:@"ballon.png"];
			break;
			
		default:
			break;
	}
	//button.image  = [UIImage imageNamed:@"wifi.png"];
	return  button; 
}
////////
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	UITableViewCell *cell				= [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:nil] autorelease];
	UILabel *labelName = [[UILabel alloc]initWithFrame:CGRectMake(cell.frame.origin.x+5, cell.frame.origin.y+5, 200, 30)];
	labelName.backgroundColor = [UIColor clearColor];
	labelName.textColor = [UIColor blackColor];
	labelName.text		=	[[arrayNearByDetails objectAtIndex:indexPath.row] objectForKey:@"store_name"];
	labelName.font      = [UIFont boldSystemFontOfSize:15];
	labelName.textAlignment = UITextAlignmentLeft;
	[cell addSubview:labelName];
	[labelName release];
	
	if([[[arrayNearByDetails objectAtIndex:indexPath.row] objectForKey:@"freewifi"] isEqualToString:@"Yes"])
	{
		frameOfView = CGRectMake(cell.frame.origin.x+5, cell.frame.origin.y+35, 30, 30);
		[cell addSubview:[self buttonView:0]];
	}
	if([[[arrayNearByDetails objectAtIndex:indexPath.row] objectForKey:@"cashless"] isEqualToString:@"Yes"])
	{
		frameOfView = CGRectMake(cell.frame.origin.x+40, cell.frame.origin.y+35, 30, 30);
		[cell addSubview:[self buttonView:1]];
	}//mcdrive
	if([[[arrayNearByDetails objectAtIndex:indexPath.row] objectForKey:@"mcdrive"] isEqualToString:@"Yes"])
	{
		frameOfView = CGRectMake(cell.frame.origin.x+75, cell.frame.origin.y+35, 30, 30);
		[cell addSubview:[self buttonView:2]];
	}
	if([[[arrayNearByDetails objectAtIndex:indexPath.row] objectForKey:@"wheelchairaccess"] isEqualToString:@"Yes"])
	{
		frameOfView = CGRectMake(cell.frame.origin.x+110, cell.frame.origin.y+35, 30, 30);
		[cell addSubview:[self buttonView:3]];
	}
	
	if([[[arrayNearByDetails objectAtIndex:indexPath.row] objectForKey:@"birthdayparties"] isEqualToString:@"Yes"])
	{
		frameOfView = CGRectMake(cell.frame.origin.x+145, cell.frame.origin.y+35, 30, 30);
		[cell addSubview:[self buttonView:4]];
	}
	if([[[arrayNearByDetails objectAtIndex:indexPath.row] objectForKey:@"birthdayparties"] isEqualToString:@"Yes"])
	{
		frameOfView = CGRectMake(cell.frame.origin.x+145, cell.frame.origin.y+35, 30, 30);
		[cell addSubview:[self buttonView:4]];
	}
	cell.accessoryType  = 2;
	return cell;
}
//////////////////////////////

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
