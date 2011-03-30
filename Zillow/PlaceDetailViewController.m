//
//  PlaceDetailViewController.m
//  Zillow
//
//  Created by gaurav sinha on 11/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PlaceDetailViewController.h"


@implementation PlaceDetailViewController
@synthesize DictDetail,arrayImages;
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
	
	
	UIBarButtonItem *newBackButton				= [[UIBarButtonItem alloc] initWithTitle: @"Email" style: UIBarButtonItemStyleBordered target:self action:@selector(sendEmail)];
	self.navigationItem.rightBarButtonItem = newBackButton;
	[newBackButton release];
	
	[self.navigationItem setTitle:DETAIL];
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ForColor.png"]];
	
	
	
//	labelZip.adjustsFontSizeToFitWidth = YES;
//	labelCity.adjustsFontSizeToFitWidth = YES;
//	labelStreet.adjustsFontSizeToFitWidth = YES;
//	labelZip.text = [DictDetail objectForKey:@"Zip"];
//	labelCity.text = [DictDetail objectForKey:@"City"];
//	labelStreet.text = [DictDetail objectForKey:@"Street"];
//	labelSizeSqrFt.text = [DictDetail objectForKey:@"lotSizeSqFt"];
//	labelFinishedSqFt.text = [DictDetail objectForKey:@"finishedSqFt"];
//	labelBedRooms.text = [DictDetail objectForKey:@"bedrooms"];
//	labelBathrooms.text = [DictDetail objectForKey:@"bathrooms"];
	
	if(arrayImages!=nil)
	if([arrayImages count]>0)
	{
	_imageView.image = (UIImage*)[arrayImages objectAtIndex:0];
	
	UIGestureRecognizer *recognizer;
	UITapGestureRecognizer *tapRecognizer;
	recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapFrom:)];
	[viewForImage addGestureRecognizer:recognizer];
	//tapRecognizer.numberOfTapsRequired = 1;
	tapRecognizer = (UITapGestureRecognizer *)recognizer;
	recognizer.delegate = self;
	[recognizer release];
	}
	[self viewForCell];
    [super viewDidLoad];
}

#pragma mark -
#pragma mark handleTapFrom

- (void)handleTapFrom:(UITapGestureRecognizer *)recognizer 
{
	PropertyImaeViewController *PropertyImaeController = [[PropertyImaeViewController alloc] init];
	PropertyImaeController.arrayImage = [[NSMutableArray alloc] init];
	PropertyImaeController.arrayImage = arrayImages;
	UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:PropertyImaeController];
	//[PropertyImaeController release];
    [self.navigationController presentModalViewController:navController animated:YES];

}
#pragma mark -
#pragma mark labelForViewCell

-(UILabel*)labelForViewCell:(NSString*)stringName withFrame:(CGRect)frame 
{
	UILabel *label = [[UILabel alloc] initWithFrame:frame];
	label.text = stringName;
	label.backgroundColor = [UIColor clearColor];
	return label;
}

-(void)viewForCell
{
	arrayViewCell = [[NSMutableArray alloc] init];
	viewCell = [[UIView alloc] init];
	labelEle = [[UILabel alloc] init];
	if([DictDetail objectForKey:@"Street"]!=nil)
	{
		labelEle = [self labelForViewCell:[DictDetail objectForKey:@"Street"] withFrame:CGRectMake(0, 0, 250, 30)];
		labelEle.font = [UIFont boldSystemFontOfSize:18];
		[viewCell addSubview:labelEle];
	}
	//[labelEle release];
	//[viewCell release];
	
	//viewCell = [[UIView alloc] init];
	labelEle = [[UILabel alloc] init];
	if([DictDetail objectForKey:@"City"]!=nil)
	{
		
		labelEle = [self labelForViewCell:[NSString stringWithFormat:@"%@ %@ %@",[DictDetail objectForKey:@"City"],[DictDetail objectForKey:@"state"],[DictDetail objectForKey:@"Zip"]] withFrame:CGRectMake(0, 30, 200, 20)];
		labelEle.font = [UIFont systemFontOfSize:12];
		[viewCell addSubview:labelEle];
		
	}
	[arrayViewCell addObject:viewCell];
	//[viewCell release];
	//[labelEle release];
	//[viewCell addSubview:[labelForViewCell:]]
	
	
	viewCell = [[UIView alloc] init];
	labelEle = [[UILabel alloc] init];
	if([DictDetail objectForKey:@"price"]!=nil)
	{
		labelEle = [self labelForViewCell:[NSString stringWithFormat:@"For Sale %@",[DictDetail objectForKey:@"price"]] withFrame:CGRectMake(0, 20, 250, 30)];
		labelEle.font = [UIFont boldSystemFontOfSize:18];
		[viewCell addSubview:labelEle];
	}
	[arrayViewCell addObject:viewCell];
	//[labelEle release];
	//[viewCell release];
	
	viewCell = [[UIView alloc] init];
	labelEle = [[UILabel alloc] init];
	if([DictDetail objectForKey:@"bedrooms"]!=nil)
	{
		labelEle = [self labelForViewCell:[NSString stringWithFormat:@"%@bd %@ba",[DictDetail objectForKey:@"bedrooms"],[DictDetail objectForKey:@"bathrooms"]] withFrame:CGRectMake(0, 0, 120, 20)];
		labelEle.font = [UIFont systemFontOfSize:12];
		[viewCell addSubview:labelEle];
	}
	//[labelEle release];
	
	labelEle = [[UILabel alloc] init];
	if([DictDetail objectForKey:@"yearBuilt"]!=nil)
	{
		labelEle = [self labelForViewCell:[NSString stringWithFormat:@"Built in %@",[DictDetail objectForKey:@"yearBuilt"]] withFrame:CGRectMake(120, 0, 120, 20)];
		labelEle.font = [UIFont systemFontOfSize:12];
		[viewCell addSubview:labelEle];
	}
	//[labelEle release];
	
	labelEle = [[UILabel alloc] init];
	if([DictDetail objectForKey:@"lotSizeSqFt"]!=nil)
	{
		labelEle = [self labelForViewCell:[NSString stringWithFormat:@"%@ sqtft lot",[DictDetail objectForKey:@"lotSizeSqFt"]] withFrame:CGRectMake(0, 30, 120, 20)];
		labelEle.font = [UIFont systemFontOfSize:12];
		[viewCell addSubview:labelEle];
	}
	//[labelEle release];
	
	if([DictDetail objectForKey:@"finishedSqFt"]!=nil)
	{
		labelEle = [self labelForViewCell:[NSString stringWithFormat:@"%@ sqtft",[DictDetail objectForKey:@"finishedSqFt"]] withFrame:CGRectMake(120, 30, 120, 20)];
		labelEle.font = [UIFont systemFontOfSize:12];
		[viewCell addSubview:labelEle];
	}
	[arrayViewCell addObject:viewCell];
	NSLog(@"%d",[arrayViewCell count]);
	//[labelEle release];
	
	//[viewCell release];
	

}

#pragma mark -
#pragma mark label
//-(void)ShowImages
//{
//	
//	PropertyImaeViewController *PropertyImaeController = [[PropertyImaeViewController alloc] init];
//	PropertyImaeController.arrayImage = [[NSMutableArray alloc] init];
//	PropertyImaeController.arrayImage = arrayImages;
//	UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:PropertyImaeController];
//	[PropertyImaeController release];
//    [self.navigationController presentModalViewController:navController animated:YES];
//
//}

#pragma mark -
#pragma mark tableViewCode

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [arrayViewCell count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;              // Default is 1 if not implemented
{
	return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

//if(indexPath.row == 2)
//		return 120;
//	else
//	{
		return 70;
//}
}


/////////
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{ 
	UITableViewCell *cell = [UITableViewCell new];
	if(indexPath.row<[arrayViewCell count])
	{
	viewCell = (UIView*)[arrayViewCell objectAtIndex:indexPath.row];
	CGRect fram = [cell frame];
	
	viewCell.frame = CGRectMake(fram.origin.x+15, fram.origin.y, fram.size.width, fram.size.width);
	[cell addSubview:viewCell];
	}
	//cell.textLabel.text = [arrayHome objectAtIndex:indexPath.row];
	//cell.accessoryType = 2;
	return cell;
}


#pragma mark -
#pragma mark mailComposeController

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
	[self dismissModalViewControllerAnimated:YES];
}

- (void) dismissHUD
{
	if (![ModalHUD dismiss])
		[self performSelector:@selector(dismissHUD) withObject:nil afterDelay:0.2f];
}

//////////////For the returning the keypad
-(IBAction)returnKeypad:(id)sender
{
	[sender resignFirstResponder];
}
///////Email the Image
-(void)emailTheImage:(UIImage*)imageToEmail
{
	NSArray *arrayRec = [NSArray arrayWithObjects:BLACKJEFFEMAIL,nil];
	if ([MFMailComposeViewController canSendMail])
	{
		MFMailComposeViewController *mcvc = [[[MFMailComposeViewController alloc] init] autorelease];
		mcvc.mailComposeDelegate = self;
		[mcvc setSubject:@"Description Of Property"];
		[mcvc setToRecipients:arrayRec];
		NSString *messageBdy = [NSString stringWithFormat:@"%@<br>%@ %@ %@ <br>For Sale %@<br>%@ bedrooms %@ bathrooms<br>Built in %@<br>%@ sqtft lot<br>%@ sqtft",[DictDetail objectForKey:@"Street"],[DictDetail objectForKey:@"City"],[DictDetail objectForKey:@"state"],[DictDetail objectForKey:@"Zip"],[DictDetail objectForKey:@"price"],[DictDetail objectForKey:@"bedrooms"],[DictDetail objectForKey:@"bathrooms"],[DictDetail objectForKey:@"yearBuilt"],[DictDetail objectForKey:@"lotSizeSqFt"],[DictDetail objectForKey:@"finishedSqFt"]];
		[mcvc setMessageBody:messageBdy isHTML:YES];
		//[mcvc addAttachmentData:UIImageJPEGRepresentation(imageToEmail, 1.0f) mimeType:@"image/jpeg" fileName:@"pickerimage.jpg"];
		[self presentModalViewController:mcvc animated:YES];
		[self dismissHUD];
	}
	
}
-(void)sendEmail
{
	[self emailTheImage:nil];
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
	[viewCell release];
	[labelEle release];
	[DictDetail release];
    [viewForImage release];
    [_imageView release];
    [_tableView release];
    [arrayImages release];
    [arrayViewCell release];
	//[labelCity release];
//	[labelStreet release];
//	[labelZip release];
    [super dealloc];
}


@end
