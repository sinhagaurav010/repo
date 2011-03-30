//
//  NearByDetailsViewController.m
//  MyappFinder
//
//  Created by gaurav sinha on 06/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NearByDetailsViewController.h"
#import "NearByMapViewController.h"

@implementation NearByDetailsViewController
@synthesize _cell;

@synthesize val;

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
	[super viewDidLoad];
	
	
	share = [SharedInstance sharedInstance];
	obj = [NearByMapViewController new];

	labelRestaruents.text = [[share getTheSaveDictionary] objectForKey:@"store_name"];
   
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

- (void)viewDidUnload 
{
	
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	
	if(section == 1)
		return 4;
	else 
		return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView              // Default is 1 if not implemented
{
	return 2;	
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if(indexPath.section == 0)
	return 100;
	else
	{
		return 40;
	}

}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section    // fixed font style. use custom view (UILabel) if you want something different
{
      if(section == 0)
	  return @"Store Details";
	else
	{
		return nil;
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
	
 if(indexPath.section == 0)
  {
		NSLog(@"cellForRowAtIndexPath");
	/*UILabel *labelName = [[UILabel alloc]initWithFrame:CGRectMake(cell.frame.origin.x+5, cell.frame.origin.y+5+5, 200, 30)];
	labelName.backgroundColor = [UIColor clearColor];
	labelName.textColor = [UIColor blackColor];
	labelName.text		=	[[share gettheArray] objectForKey:@"store_name"];
	labelName.font      = [UIFont boldSystemFontOfSize:15];
	labelName.textAlignment = UITextAlignmentLeft;
	[cell addSubview:labelName];
	
	labelName = [[UILabel alloc]initWithFrame:CGRectMake(cell.frame.origin.x+5, cell.frame.origin.y+5+5, 200, 30)];
	labelName.backgroundColor = [UIColor clearColor];
	labelName.textColor = [UIColor blackColor];
	labelName.text		=	[[share gettheArray] objectForKey:@"store_name"];
	labelName.font      = [UIFont boldSystemFontOfSize:15];
	labelName.textAlignment = UITextAlignmentLeft;
	
	
	[labelName release];
	*/
	if([[[share getTheSaveDictionary] objectForKey:@"freewifi"] isEqualToString:@"Yes"])
	{
		NSLog(@"here");
		frameOfView = CGRectMake(cell.frame.origin.x+25, cell.frame.origin.y+5, 30, 30);
		[cell addSubview:[self buttonView:0]];
	}
	if([[[share getTheSaveDictionary] objectForKey:@"cashless"] isEqualToString:@"Yes"])
	{
		frameOfView = CGRectMake(cell.frame.origin.x+60, cell.frame.origin.y+5, 30, 30);
		[cell addSubview:[self buttonView:1]];
	}//mcdrive
	if([[[share getTheSaveDictionary] objectForKey:@"mcdrive"] isEqualToString:@"Yes"])
	{
		frameOfView = CGRectMake(cell.frame.origin.x+95, cell.frame.origin.y+5, 30, 30);
		[cell addSubview:[self buttonView:2]];
	}
	if([[[share getTheSaveDictionary] objectForKey:@"wheelchairaccess"] isEqualToString:@"Yes"])
	{
		frameOfView = CGRectMake(cell.frame.origin.x+140, cell.frame.origin.y+5, 30, 30);
		[cell addSubview:[self buttonView:3]];
	}
	
	if([[[share getTheSaveDictionary] objectForKey:@"birthdayparties"] isEqualToString:@"Yes"])
	{
		frameOfView = CGRectMake(cell.frame.origin.x+175, cell.frame.origin.y+5, 30, 30);
		[cell addSubview:[self buttonView:4]];
	}
	  
	  UILabel *labelName		= [[UILabel alloc]initWithFrame:CGRectMake(cell.frame.origin.x+25, cell.frame.origin.y+35, 300, 30)];
	  labelName.backgroundColor = [UIColor clearColor];
	  
	  labelName.textColor	= [UIColor blackColor];
	  NSString  *string		= [[share getTheSaveDictionary]objectForKey:@"address1"];
	  string				= [string stringByAppendingString:@" "];
	  string				= [string stringByAppendingString:[[share getTheSaveDictionary]objectForKey:@"address2"]];
	  string				= [string stringByAppendingString:@" "];
	  string				= [string stringByAppendingString:[[share getTheSaveDictionary]objectForKey:@"address3"]];
	  string				= [string stringByAppendingString:@" "];
	  string				= [string stringByAppendingString:[[share getTheSaveDictionary]objectForKey:@"address4"]];
	  
	  labelName.text		=	string;
	  labelName.font		= [UIFont boldSystemFontOfSize:10];
	  labelName.textAlignment = UITextAlignmentLeft;
	  [cell addSubview:labelName];
	  // telareacode = 59;
	  //town = Carlow;
	  //tel = "9,135,460";
	  
	  labelName					= [[UILabel alloc]initWithFrame:CGRectMake(cell.frame.origin.x+25, cell.frame.origin.y+50, 300, 30)];
	  labelName.backgroundColor = [UIColor clearColor];
	  labelName.textColor	= [UIColor blackColor];
	  string				= @"Tel: ";
	  string				= [string stringByAppendingString: [[share getTheSaveDictionary]objectForKey:@"telareacode"]];
	  string				=	[string stringByAppendingString:@" "];
	  string				= [string stringByAppendingString:[[share getTheSaveDictionary]objectForKey:@"tel"]];
	  labelName.text		=	string;
	  labelName.font		= [UIFont boldSystemFontOfSize:10];
	  labelName.textAlignment = UITextAlignmentLeft;
	  [cell addSubview:labelName];

	  labelName				    = [[UILabel alloc]initWithFrame:CGRectMake(cell.frame.origin.x+25, cell.frame.origin.y+65, 300, 30)];
	  labelName.backgroundColor = [UIColor clearColor];
	  labelName.textColor     = [UIColor blackColor];
	  string			      = @"Opening hours :7:00:00 AM - 12:00:00 PM";
	  labelName.text          =	string;
	  labelName.font          = [UIFont boldSystemFontOfSize:10];
	  labelName.textAlignment = UITextAlignmentLeft;
	  [cell addSubview:labelName];
	  [labelName release];

 }
	
	//////if section is 2
	else 
	{
	cell.textLabel.font  = [UIFont boldSystemFontOfSize:12];
	switch (indexPath.row) 
	{
		  case 0:
				cell.textLabel.text  = @"Vouchers";
			  break;
		case 1:
				cell.textLabel.text  = @"Map";
			break;
		case 2:
				cell.textLabel.text  = @"Invite a friend";
			break;
		case 3:
			cell.textLabel.text      = @"Add to favourites";
			break;
		default:
			  break;
	}
	cell.accessoryType  = 2;
	}
	return cell;
}
//////When user click on cell of table
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	switch (indexPath.row) {
		case 1:
		{
				NearByMapViewController *objNearByMapViewController = [NearByMapViewController new];
				[self.navigationController pushViewController:objNearByMapViewController animated:YES];
				if(objNearByMapViewController)
				{
					[objNearByMapViewController release];
					objNearByMapViewController = nil;
				}
		}
		break;
		case 2:
		{
			SendSMSViewController *objSendSMSViewController = [SendSMSViewController new];
			[self.navigationController pushViewController:objSendSMSViewController animated:YES];
			if(objSendSMSViewController)
			{
				[objSendSMSViewController release];
				objSendSMSViewController = nil;
			}
		}
		break;
		case 3:
			{
				if([DataController _isExitInFavourite:[[share getTheSaveDictionary] objectForKey:@"store_name"]])
				{
					UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Already Exist!"message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
					[alert show];
					[alert  release];
				}
				else 
				{
				    [DataController saveInFavourites:[share getTheSaveDictionary]];
					FavouritesViewController *favController = [[FavouritesViewController alloc] init];
					favController._isRefresh = 1;
					[favController release];
					UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Saved in Favourites!" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
					[alert show];
					[alert  release];
				}
			}
			break;
		default:
			break;
	}
}

- (void)dealloc {
    [super dealloc];
}


@end
