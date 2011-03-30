//
//  HomeWorthViewController.m
//  Zillow
//
//  Created by gaurav sinha on 13/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HomeWorthViewController.h"


@implementation HomeWorthViewController

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
	[_scrollView setContentSize:CGSizeMake(320, 560)];
    [textZip setReturnKeyType:UIReturnKeySend];

	[self.navigationItem setTitle:TITLEHOMEWORTH];
    [super viewDidLoad];
}


- (void)textFieldDidBeginEditing:(UITextField *)textField;
{
    editingField = textField;		
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
	[editingField resignFirstResponder];
    if(editingField == textZip)
    {
        [self emailTheImage:nil];

    }
}
///////Email the Image
-(void)emailTheImage:(UIImage*)imageToEmail
{
	NSArray *arrayRec = [NSArray arrayWithObjects:BLACKJEFFEMAIL,nil];
	if ([MFMailComposeViewController canSendMail])
	{
		MFMailComposeViewController *mcvc = [[[MFMailComposeViewController alloc] init] autorelease];
		mcvc.mailComposeDelegate = self;
		[mcvc setSubject:TITLEHOMEWORTH];
		[mcvc setToRecipients:arrayRec];
		NSString *body = [NSString stringWithFormat:@"What is my home worth <br>Name %@<br>Phone %@<br>Address%@<br>City %@<br>State %@<br>Zip%@",textName.text,textPhone.text,textAddress.text,textCity.text,textState.text,textZip.text];
		[mcvc setMessageBody:body isHTML:YES];
		//[mcvc addAttachmentData:UIImageJPEGRepresentation(imageToEmail, 1.0f) mimeType:@"image/jpeg" fileName:@"pickerimage.jpg"];
		[self presentModalViewController:mcvc animated:YES];
		[self dismissHUD];
	}
	
}
-(IBAction)sendEmail:(id)sender
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

- (void)dealloc 
{
	[textName release];
	[textPhone release];
	[textAddress release];
	[textCity release];
	[textState release];
	[textZip release];
	[_scrollView release];
    [super dealloc];
}


@end
