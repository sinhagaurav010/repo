//
//  ContactMeViewController.m
//  Zillow
//
//  Created by gaurav sinha on 13/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ContactMeViewController.h"
#import "Global.h"
#import "GetDirectionViewController.h"


@implementation ContactMeViewController

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
	[self.navigationItem setTitle:CONTACTTITLE];
	arrayContact  = [[NSMutableArray alloc] init];
	
	[arrayContact addObject:@"Call Me"];
	[arrayContact addObject:@"Text Me"];
	[arrayContact addObject:@"Email Me"];
	[arrayContact addObject:@"Facebook"];
	[arrayContact addObject:@"Twitter"];
	[arrayContact addObject:@"Website"];
	[arrayContact addObject:@"Directions"];

    [super viewDidLoad];
}


#pragma mark -
#pragma mark Email
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
	[self dismissModalViewControllerAnimated:YES];
}

- (void) dismissHUD
{
	if (![ModalHUD dismiss])
		[self performSelector:@selector(dismissHUD) withObject:nil afterDelay:0.2f];
}
-(void)emailTheImage:(UIImage*)imageToEmail
{
	NSArray *arrayRec = [NSArray arrayWithObjects:BLACKJEFFEMAIL,nil];
	if ([MFMailComposeViewController canSendMail])
	{
		MFMailComposeViewController *mcvc = [[[MFMailComposeViewController alloc] init] autorelease];
		mcvc.mailComposeDelegate = self;
		//[mcvc setSubject:@"I am here"];
		[mcvc setToRecipients:arrayRec];
		//NSString *messageBdy = [NSString stringWithFormat:@"%@<br>%@ %@ %@ <br>For Sale %@<br>%@ bedrooms %@ bathrooms<br>Built in %@<br>%@ sqtft lot<br>%@ sqtft",[DictDetail objectForKey:@"Street"],[DictDetail objectForKey:@"City"],[DictDetail objectForKey:@"state"],[DictDetail objectForKey:@"Zip"],[DictDetail objectForKey:@"price"],[DictDetail objectForKey:@"bedrooms"],[DictDetail objectForKey:@"bathrooms"],[DictDetail objectForKey:@"yearBuilt"],[DictDetail objectForKey:@"lotSizeSqFt"],[DictDetail objectForKey:@"finishedSqFt"]];
		//[mcvc setMessageBody:messageBdy isHTML:YES];
		//[mcvc addAttachmentData:UIImageJPEGRepresentation(imageToEmail, 1.0f) mimeType:@"image/jpeg" fileName:@"pickerimage.jpg"];
		[self presentModalViewController:mcvc animated:YES];
		[self dismissHUD];
	}
	
}

#pragma mark -
#pragma mark tableViewCode

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [arrayContact count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;              // Default is 1 if not implemented
{
	return 1;
}

/////////
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{ 
	UITableViewCell *cell = [UITableViewCell new];
	cell.textLabel.text = [arrayContact objectAtIndex:indexPath.row];
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
			NSString *phoneStr = [[NSString alloc] initWithFormat:@"tel:%@",phone_number];
			NSURL *phoneURL = [[NSURL alloc] initWithString:phoneStr];
			[[UIApplication sharedApplication] openURL:phoneURL];
			[phoneURL release];
			[phoneStr release];
			break;
		}
		case 1:
		{
			now();
			NSString *sms = [[NSString alloc] initWithFormat:@"sms:%@",cellNum];
			[[UIApplication sharedApplication] openURL:[NSURL URLWithString:sms]];
			[sms release];
			break;
		}
		case 2:
		{
			[self emailTheImage:nil];
			break;
		}
		case 3:
		{
			now();
			WebViewContrller *webController = [[WebViewContrller alloc] init];
			webController.stringUrl = FACEBOOK; 
			webController.stringTitle = FACEBOOKTITLE;
			[self.navigationController pushViewController:webController animated:YES];
			[webController release];
			break;
		}
		case 4:
		{
			now();
			WebViewContrller *webController = [[WebViewContrller alloc] init];
			webController.stringUrl = TWITTER; 
			webController.stringTitle = TWITTERTITLE;
			[self.navigationController pushViewController:webController animated:YES];
			[webController release];			
			break;
		}
			case 5:
		{
			now();
			WebViewContrller *webController = [[WebViewContrller alloc] init];
			webController.stringUrl = WEBSITE; 
			webController.stringTitle = WEBSITETIT;
			[self.navigationController pushViewController:webController animated:YES];
			[webController release];
			break;
		}
        case 6:
        {
            now();
            GetDirectionViewController *GetDirectionController= [[GetDirectionViewController alloc] init];
            [self.navigationController pushViewController:GetDirectionController animated:YES];
           // [GetDirectionController release];
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
    [arrayContact release];
    [_tableView release];
    [super dealloc];
}


@end
