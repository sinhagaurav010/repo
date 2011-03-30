//
//  RegistrationViewController.m
//  MyappFinder
//
//  Created by gaurav sinha on 02/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RegistrationViewController.h"
#import "TabBarViewController.h"

@implementation RegistrationViewController

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

-(IBAction)Cancel:(id)sender
{
	TabBarViewController *obj = [TabBarViewController  new];
	[self.navigationController pushViewController:obj animated:YES];
	if(obj)
	{
		[obj  release];
		obj = nil; 
	}
}

-(IBAction)doneButtonClick:(id)sender
{
	TabBarViewController *obj = [TabBarViewController  new];
	[self.navigationController pushViewController:obj animated:YES];
	if(obj)
	{
		[obj  release];
		obj = nil; 
	}
}

/////View will appear
- (void)viewWillAppear:(BOOL)animated    // Called when the view is about to made visible. Default does nothing
{
	NSLog(@"viewWill appear");
}
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
	[self.navigationItem setTitle:@"Register"];
	
	UIBarButtonItem *doneButton				= [[UIBarButtonItem alloc] initWithTitle: @"Done" style: UIBarButtonItemStyleBordered target:self action:@selector(doneButtonClick:)];
	self.navigationItem.rightBarButtonItem = doneButton;
	[doneButton release];
	
	UIBarButtonItem *cancelButton				= [[UIBarButtonItem alloc] initWithTitle: @"Cancel" style: UIBarButtonItemStyleBordered target:self action:@selector(Cancel:)];
	self.navigationItem.leftBarButtonItem = cancelButton;
	[cancelButton release];
	
	[self.navigationController setNavigationBarHidden:NO];
    [super viewDidLoad];
}

//////////////////////////////////
/////Code for the table view
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if(section == 0)
	return 4;
	else 
	{
		return 1;
	}

}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section    // fixed font style. use custom view (UILabel) if you want something different
{
	if(section == 0)
	{
     return @"Details";
	}
	else 
	{
		return @"Subscriptions";
	}

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView              // Default is 1 if not implemented
{
	return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 80;
}
///////Code for the lable in cell
-(NSString*)stringForLabel:(NSInteger)index
{
	NSString *string;
switch (index) 
	{
	case 0:
		string = @"Name";
		break;
	case 1:
		string = @"Email";
		break;
	case 2:
		string = @"Age-Range";
		break;
	case 3:
		string = @"Gender";
		break;
	default:
		break;
	}
	return string;
}


/////////////code for label
-(NSString*)stringForLabeldes:(NSInteger)index
{
	NSString *string;
	switch (index) 
	{
		case 0:
			string = @"John Smith";
			break;
		case 1:
			string = @"jsmith@abc.com";
			break;
		case 2:
			string = @"25-30";
			break;
		case 3:
			string = @"Male";
			break;
		default:
			break;
	}
	return string;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	
	UITableViewCell *cell				= [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:nil] autorelease];
	if(indexPath.section==0)
	{
	UILabel *labelName = [[UILabel alloc]initWithFrame:CGRectMake(cell.frame.origin.x+20, cell.frame.origin.y+15, 100, 30)];
	labelName.backgroundColor = [UIColor clearColor];
	labelName.textColor = [UIColor blueColor];
	labelName.text		=	[self stringForLabel:indexPath.row];
		labelName.font      = [UIFont boldSystemFontOfSize:15];
	labelName.textAlignment = UITextAlignmentRight;
	[cell addSubview:labelName];
	
	labelName  = [[UILabel alloc]initWithFrame:CGRectMake(cell.frame.origin.x+125, cell.frame.origin.y+15, 200, 30)];
	labelName.backgroundColor = [UIColor clearColor];
		labelName.font      = [UIFont boldSystemFontOfSize:15];
	labelName.textColor = [UIColor blackColor];
	labelName.text		= [self stringForLabeldes:indexPath.row];
	labelName.textAlignment = UITextAlignmentLeft;
	[cell addSubview:labelName];
		
	[labelName release];
	}
	else 
	{
		UILabel *labelName = [[UILabel alloc]initWithFrame:CGRectMake(cell.frame.origin.x+20, cell.frame.origin.y+15, 100, 30)];
		labelName.backgroundColor = [UIColor clearColor];
		labelName.textColor = [UIColor blackColor];
		labelName.font      = [UIFont boldSystemFontOfSize:15];
		labelName.text		=	@"Newsletter";
		labelName.textAlignment = UITextAlignmentRight;
		[cell addSubview:labelName];
		
		UISwitch *switchCell = [[UISwitch alloc]initWithFrame:CGRectMake(cell.frame.origin.x+180, cell.frame.origin.y+15, 100, 30)];
		//switchCell.state = TRUE;
		[cell addSubview:switchCell];
	}

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
    [super dealloc];
}


@end
