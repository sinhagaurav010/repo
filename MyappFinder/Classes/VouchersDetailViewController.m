//
//  VouchersDetailViewController.m
//  MyappFinder
//
//  Created by gaurav sinha on 17/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "VouchersDetailViewController.h"
#import "SharedInstance.h"

@implementation VouchersDetailViewController

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
	NSLog(@"viewdid load");
	arrayWeekDay = [[NSMutableArray  alloc]init];
	//[arrayWeekDay arrayByAddingObject:@"mon",@"tues",@"wed",@"thurs",@"fri",@"sat",@"sun",nil];
	[arrayWeekDay addObject:@"mon"];
	[arrayWeekDay addObject:@"tues"];
	[arrayWeekDay addObject:@"wed"];
	[arrayWeekDay addObject:@"thurs"];
	[arrayWeekDay addObject:@"fri"];
	[arrayWeekDay addObject:@"sat"];
	[arrayWeekDay addObject:@"sun"];
	
    share = [SharedInstance sharedInstance];
	NSLog(@"viewdid load");

	[super viewDidLoad];
}

///////////code for the tableviews
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 1;
	
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section// fixed font style. use custom view (UILabel) if you want something different
{
	return [[[share getTheArrayForVoucher]objectAtIndex:[share getFieldValueAtPos:3]] objectForKey:@"VoucherName"];
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
     return  @"Present the voucher code shown at the till when placing your order.This voucher may only used in 'Store Name Here'.Terms and Conditions apply";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView              // Default is 1 if not implemented
{
	return 1;	
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 100;
}
///Code for the checking whether this day is open or not
-(BOOL)checkOpenOrNot:(NSString*)stringDay
{
	NSLog(@"checkOpenOrNot");

	BOOL _isAvail;
if([[[[share getTheArrayForVoucher]objectAtIndex:[share getFieldValueAtPos:3]] objectForKey:stringDay] isEqualToString:@"Yes"])
	_isAvail = 1;
	else {
		_isAvail = 0;
	}
	NSLog(@"cellForRowAtIndexPath");
	return _isAvail;
}
////////
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	NSLog(@"cellForRowAtIndexPath");

    UITableViewCell *cell	= [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:nil] autorelease];	
	UILabel *labelName		= [[UILabel alloc]initWithFrame:CGRectMake(cell.frame.origin.x+15, cell.frame.origin.y+15, 300, 30)];
	labelName.backgroundColor = [UIColor clearColor];
	labelName.textColor		= [UIColor darkTextColor];
	labelName.text			=	@"Availability";//[[arrayVoucher objectAtIndex:indexPath.row] objectForKey:@"VoucherName"];
	labelName.font			= [UIFont boldSystemFontOfSize:15];
	labelName.textAlignment = UITextAlignmentLeft;
	[cell addSubview:labelName];
	
	
	//[labelName release];
	
	
	//////label if vouchers is available
	labelName				  = [[UILabel alloc]initWithFrame:CGRectMake(cell.frame.origin.x+15, cell.frame.origin.y+40, 200, 30)];
	labelName.backgroundColor = [UIColor clearColor];
	labelName.textColor		  = [UIColor grayColor];
	//Start
	//end
	labelName.text			  = [NSString stringWithFormat:@"Hours:%@-%@",[[[share getTheArrayForVoucher]objectAtIndex:[share getFieldValueAtPos:3]] objectForKey:@"Start"],[[[share getTheArrayForVoucher]objectAtIndex:[share getFieldValueAtPos:3]]objectForKey:@"end"]];
	labelName.font			  = [UIFont systemFontOfSize:12];
	labelName.textAlignment   = UITextAlignmentLeft;
	[cell addSubview:labelName];
	[labelName release];
	
	
	NSString *stringWeekDays =@"";
	for(int i = 0;i<7;i++)
	{
		if([self checkOpenOrNot:[arrayWeekDay objectAtIndex:i]])
		{
			stringWeekDays  = [stringWeekDays stringByAppendingString:[arrayWeekDay objectAtIndex:i]];
			if(i!=6)
			stringWeekDays = [stringWeekDays stringByAppendingString:@"day,"];
			else {
				stringWeekDays = [stringWeekDays stringByAppendingString:@"day"];
			}

		}
	}
	labelName				  = [[UILabel alloc]initWithFrame:CGRectMake(cell.frame.origin.x+15, cell.frame.origin.y+65, 300, 30)];
	labelName.backgroundColor = [UIColor clearColor];
	labelName.textColor		  = [UIColor colorWithPatternImage:[UIImage imageNamed:@"maroon.png"]];
	//Start
	//end
	labelName.text			  = stringWeekDays;//[NSString stringWithFormat:@"Hours:%@-%@",[[arrayVoucher objectAtIndex:indexPath.row] objectForKey:@"Start"],[[arrayVoucher objectAtIndex:indexPath.row]objectForKey:@"end"]];
	labelName.font			  = [UIFont systemFontOfSize:12];
	labelName.textAlignment   = UITextAlignmentLeft;
	[cell addSubview:labelName];
	
	[labelName release];
	NSLog(@"cellForRowAtIndexPath");
	
	//cell.textLabel.text = @"xcvzxc";
	return cell;
}
////////////
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	//[share setFieldValueAtPos:0 ToValue:indexPath.row];
	/*[share saveDictionary:[arrayNearByDetails objectAtIndex:indexPath.row]];
	 NearByDetailsViewController *objNearByViewController = [NearByDetailsViewController new];
	 [self.navigationController pushViewController:objNearByViewController animated:YES];
	 if(objNearByViewController)
	 {
	 [objNearByViewController release];
	 objNearByViewController = nil;
	 }*/
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
