//
//  FavouritesViewController.m
//  MyappFinder
//
//  Created by gaurav sinha on 06/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FavouritesViewController.h"
#import "DataController.h"
#import "SharedInstance.h"
#import "MapForViewController.h"
@implementation FavouritesViewController
@synthesize _isRefresh;
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

///////To refresh the table view 
-(IBAction)doneButtonClick:(id)sender
{
	[table_View reloadData];
}

//////To go to the map view
-(IBAction)ClickForMap:(id)sender
{
	[share setlocationLat:[DataController latitudeArray:[DataController arraFromFav]]];
	[share setlocationLog:[DataController longArray:[DataController arraFromFav]]];
	[share setNameArray:[DataController nameArray:[DataController arraFromFav]]];
	MapForViewController *objMapForViewController = [MapForViewController new];
	[self.navigationController pushViewController:objMapForViewController animated:YES];
	if(objMapForViewController)
	{
		[objMapForViewController  release];
		objMapForViewController  =  nil;
	}
}
///////View will appear
- (void)viewDidAppear:(BOOL)animated   // Called when the view is about to made visible. Default does nothing
{
if(_isRefresh == 1)
	[table_View reloadData];
}
/////////
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
	if(LOG)
	{
	NSLog(@"gaurav sinha");
	NSLog(@"-------%@",[DataController arraFromFav]);
	}
	
	share = [SharedInstance sharedInstance];
	
	
	
	UIBarButtonItem *MapButton				= [[UIBarButtonItem alloc] initWithTitle: @"Map" style: UIBarButtonItemStyleBordered target:self action:@selector(ClickForMap:)];
	self.navigationItem.leftBarButtonItem = MapButton;
	[MapButton release];
	
    [super viewDidLoad];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [[DataController arraFromFav] count];
	
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView              // Default is 1 if not implemented
{
	return 1;	
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 80;
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
	labelName.text		=	[[[DataController arraFromFav] objectAtIndex:indexPath.row] objectForKey:@"store_name"];
	labelName.font      = [UIFont boldSystemFontOfSize:15];
	labelName.textAlignment = UITextAlignmentLeft;
	[cell addSubview:labelName];
	[labelName release];
	
	if([[[[DataController arraFromFav] objectAtIndex:indexPath.row] objectForKey:@"freewifi"] isEqualToString:@"Yes"])
	{
		frameOfView = CGRectMake(cell.frame.origin.x+5, cell.frame.origin.y+35, 30, 30);
		[cell addSubview:[self buttonView:0]];
	}
	if([[[[DataController arraFromFav] objectAtIndex:indexPath.row] objectForKey:@"cashless"] isEqualToString:@"Yes"])
	{
		frameOfView = CGRectMake(cell.frame.origin.x+40, cell.frame.origin.y+35, 30, 30);
		[cell addSubview:[self buttonView:1]];
	}//mcdrive
	if([[[[DataController arraFromFav] objectAtIndex:indexPath.row] objectForKey:@"mcdrive"] isEqualToString:@"Yes"])
	{
		frameOfView = CGRectMake(cell.frame.origin.x+75, cell.frame.origin.y+35, 30, 30);
		[cell addSubview:[self buttonView:2]];
	}
	if([[[[DataController arraFromFav] objectAtIndex:indexPath.row] objectForKey:@"wheelchairaccess"] isEqualToString:@"Yes"])
	{
		frameOfView = CGRectMake(cell.frame.origin.x+110, cell.frame.origin.y+35, 30, 30);
		[cell addSubview:[self buttonView:3]];
	}
	
	if([[[[DataController arraFromFav] objectAtIndex:indexPath.row] objectForKey:@"birthdayparties"] isEqualToString:@"Yes"])
	{
		frameOfView = CGRectMake(cell.frame.origin.x+145, cell.frame.origin.y+35, 30, 30);
		[cell addSubview:[self buttonView:4]];
	}
	if([[[[DataController arraFromFav] objectAtIndex:indexPath.row] objectForKey:@"birthdayparties"] isEqualToString:@"Yes"])
	{
		frameOfView = CGRectMake(cell.frame.origin.x+145, cell.frame.origin.y+35, 30, 30);
		[cell addSubview:[self buttonView:4]];
	}
	
	//Label either restaurent is opened or not
	labelName = [[UILabel alloc]initWithFrame:CGRectMake(cell.frame.origin.x+200, cell.frame.origin.y+55, 200, 30)];
	labelName.backgroundColor = [UIColor clearColor];
	labelName.textColor = [UIColor blackColor];
	if([DataController closeOrOpen] == 1)
		labelName.text		=	@"Restaurant Open";
	else 
	{
		labelName.textColor = [UIColor redColor];
		labelName.text		=	@"Restaurant Closed";
	}
	
	labelName.font      = [UIFont boldSystemFontOfSize:12];
	labelName.textAlignment = UITextAlignmentLeft;
	[cell addSubview:labelName];
	[labelName release];
	//cell.accessoryType  = 1;
	return cell;
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
	[table_View release];
    [super dealloc];
}


@end
