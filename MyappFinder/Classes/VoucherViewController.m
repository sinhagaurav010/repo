//
//  VoucherViewController.m
//  MyappFinder
//
//  Created by gaurav sinha on 06/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "VoucherViewController.h"
#import "VouchersDetailViewController.h"

@implementation VoucherViewController

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
	[array_element  addObject:@"Voucher_ID"];
	[array_element  addObject:@"VoucherName"];
	[array_element  addObject:@"Voucher_Code"];
	[array_element  addObject:@"Voucher_Type"];
	[array_element  addObject:@"StartDate"];
	[array_element  addObject:@"ExpiryDate"];
	[array_element  addObject:@"Status"];
	[array_element  addObject:@"mon"];
	[array_element  addObject:@"tues"];
	[array_element  addObject:@"wed"];
	[array_element  addObject:@"thurs"];
	[array_element  addObject:@"fri"];
	[array_element  addObject:@"sat"];
	[array_element  addObject:@"sun"];
	[array_element  addObject:@"Start"];
	[array_element  addObject:@"end"];
	
	NSString *thexml = [DataController fileFromBundle:@"favouritesData"] ;
	
	arrayVoucher = [NSMutableArray new];
	arrayVoucher=[XmlParser  sharedparseeee:thexml:array_element];
	NSLog(@"arrayfavourites--%@",arrayVoucher);
	share = [SharedInstance sharedInstance];
	[share setTheArrayForVoucher:arrayVoucher];
	
    [super viewDidLoad];
}



////////code for the table view
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [[share getTheArrayForVoucher] count];
	
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView              // Default is 1 if not implemented
{
	return 1;	
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 80;
}

////////
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	
	UITableViewCell *cell	= [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:nil] autorelease];
	UILabel *labelName		= [[UILabel alloc]initWithFrame:CGRectMake(cell.frame.origin.x+5, cell.frame.origin.y+25, 300, 30)];
	labelName.backgroundColor = [UIColor clearColor];
	labelName.textColor		= [UIColor darkTextColor];
	labelName.text			=	[[arrayVoucher objectAtIndex:indexPath.row] objectForKey:@"VoucherName"];
	labelName.font			= [UIFont boldSystemFontOfSize:12];
	labelName.textAlignment = UITextAlignmentLeft;
	[cell addSubview:labelName];
	
	
	//[labelName release];
	
		
	//////label if vouchers is available
	labelName				  = [[UILabel alloc]initWithFrame:CGRectMake(cell.frame.origin.x+200, cell.frame.origin.y+55, 200, 30)];
	labelName.backgroundColor = [UIColor clearColor];
	labelName.textColor		  = [UIColor grayColor];
	labelName.text			  = [NSString stringWithFormat:@"ExpiryDate:%@",[[arrayVoucher objectAtIndex:indexPath.row] objectForKey:@"ExpiryDate"]];;
	labelName.font			  = [UIFont boldSystemFontOfSize:10];
	labelName.textAlignment   = UITextAlignmentLeft;
	[cell addSubview:labelName];

	[labelName release];
	
	cell.accessoryType        = 1;
	return cell;
}
////////////
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[share setFieldValueAtPos:3 ToValue:indexPath.row];
	[share saveDictionary:[[share getTheArrayForVoucher] objectAtIndex:indexPath.row]];
	VouchersDetailViewController *objVouchersDetailViewController = [VouchersDetailViewController new];
	[self.navigationController pushViewController:objVouchersDetailViewController animated:YES];
	[objVouchersDetailViewController release];		
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
