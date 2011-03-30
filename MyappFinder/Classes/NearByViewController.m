//
//  NearByViewController.m
//  MyappFinder
//
//  Created by gaurav sinha on 06/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NearByViewController.h"
#import "XmlParser.h"
#import "SharedInstance.h"
#import "DataController.h"
#import "MapForViewController.h"
@implementation NearByViewController

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

	NSMutableArray  *array_element  =  [NSMutableArray new];
	[array_element  addObject:@"meadinkent"];
	[array_element  addObject:@"record"];
	[array_element  addObject:@"store_name"];
	[array_element  addObject:@"address1"];
	[array_element  addObject:@"address2"];
	[array_element  addObject:@"address3"];
	[array_element  addObject:@"address4"];
	[array_element  addObject:@"post_code"];
	[array_element  addObject:@"county"];
	[array_element  addObject:@"town"];
	[array_element  addObject:@"telareacode"];
	[array_element  addObject:@"tel"];
	[array_element  addObject:@"faxareacode"];
	[array_element  addObject:@"fax"];
	[array_element  addObject:@"freewifi"];
	[array_element  addObject:@"cashless"];
	[array_element  addObject:@"mcdrive"];
	[array_element  addObject:@"mccafe"];
	[array_element  addObject:@"wheelchairaccess"];
	[array_element  addObject:@"birthdayparties"];
	[array_element  addObject:@"playplace"];
	[array_element  addObject:@"latitude"];
	[array_element  addObject:@"longitude"];
	[array_element  addObject:@"drivethru"];
	[array_element  addObject:@"instore"];
	[array_element  addObject:@"voucheravail"];
	NSString *thexml = [DataController fileFromBundle:@"xl_xml_data"] ;
	
	/*NSDateFormatter *formatter;
	NSString        *dateString;
	
	formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"dd-MM-yyyy HH:mm"];
	
	dateString = [formatter stringFromDate:[NSDate date]];
	
	[formatter release];
	
	//NSComparisonResult result = [dateString compare:@"2011-02-15 16:00"];
	
	NSLog(@"%d",result);*/
	
	UIBarButtonItem *MapButton				= [[UIBarButtonItem alloc] initWithTitle: @"Map" style: UIBarButtonItemStyleBordered target:self action:@selector(doneButtonClick:)];
	self.navigationItem.rightBarButtonItem = MapButton;
	[MapButton release];
	

	arrayNearByDetails = [NSMutableArray new];
	arrayNearByDetails=[XmlParser  sharedparseeee:thexml:array_element];
	
	share  = [SharedInstance sharedInstance]; 
	[share settheMutablearray:arrayNearByDetails];
	
	[super viewDidLoad];
}
/////When map button is clicked
-(IBAction)doneButtonClick:(id)sender
{
	[share setlocationLat:[DataController latitudeArray:arrayNearByDetails]];
	[share setlocationLog:[DataController longArray:arrayNearByDetails]];
	[share setNameArray:[DataController nameArray:arrayNearByDetails]];

	
	MapForViewController *objMapForViewController = [MapForViewController new];
	[self.navigationController pushViewController:objMapForViewController animated:YES];
	if(objMapForViewController)
	{
		[objMapForViewController  release];
		objMapForViewController  =  nil;
	}
}
////////code for the table view
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [[share gettheArray] count];
	
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
		button.image      = [UIImage imageNamed:@"ballon.png"];
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
	UITableViewCell *cell= [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:nil] autorelease];
	UILabel *labelName	 = [[UILabel alloc]initWithFrame:CGRectMake(cell.frame.origin.x+5, cell.frame.origin.y+5, 200, 30)];
	labelName.backgroundColor = [UIColor clearColor];
	labelName.textColor  = [UIColor blackColor];
	labelName.text		 =	[[arrayNearByDetails objectAtIndex:indexPath.row] objectForKey:@"store_name"];
	labelName.font       = [UIFont boldSystemFontOfSize:15];
	labelName.textAlignment = UITextAlignmentLeft;
	[cell addSubview:labelName];
	
		
	//[labelName release];
	
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
	
	//////label if vouchers is available
	labelName	 = [[UILabel alloc]initWithFrame:CGRectMake(cell.frame.origin.x+5, cell.frame.origin.y+55, 200, 30)];
	labelName.backgroundColor = [UIColor clearColor];
	labelName.textColor  = [UIColor grayColor];
	if([[[arrayNearByDetails objectAtIndex:indexPath.row] objectForKey:@"voucheravail"] length]>0)
		labelName.text		 =	@"Voucher available";
	else
	{
		labelName.text		 =	@"";
	}

	labelName.font       = [UIFont boldSystemFontOfSize:10];
	labelName.textAlignment = UITextAlignmentLeft;
	[cell addSubview:labelName];
	
	
	
	labelName = [[UILabel alloc]initWithFrame:CGRectMake(cell.frame.origin.x+200, cell.frame.origin.y+55, 200, 30)];
	labelName.backgroundColor = [UIColor clearColor];
	labelName.textColor = [UIColor grayColor];
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
	
	cell.accessoryType  = 1;
	return cell;
}
////////////
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

	//NSLog(@"asdcasdcasdc");
	[share setFieldValueAtPos:0 ToValue:indexPath.row];
	[share saveDictionary:[arrayNearByDetails objectAtIndex:indexPath.row]];

	NearByDetailsViewController *objNearByViewController = [NearByDetailsViewController new];
	[self.navigationController pushViewController:objNearByViewController animated:YES];
	
	//objNearByViewController._cell = indexPath.row;
	//[objNearByViewController setVal:indexPath.row];
	
	if(objNearByViewController)
	{
		[objNearByViewController release];
		objNearByViewController = nil;
	}
}


- (void)viewWillAppear:(BOOL)animated    // Called when the view is about to made visible. Default does nothing
{
	NSLog(@"viewWill appear");
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
    [super dealloc];
}


@end
