//
//  WhatICanAffrdViewController.m
//  Zillow
//
//  Created by gaurav sinha on 17/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WhatICanAffrdViewController.h"
#define ENTERHERE @"Enter Here..."
#import "ModalHUD.h"
@implementation WhatICanAffrdViewController

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
	[self.navigationItem setTitle:TITLEWHATICAN];
	textFldName.placeholder = ENTERHERE;
	textPhone.placeholder = ENTERHERE;
	textCredit.placeholder = ENTERHERE;
	textHome.placeholder = ENTERHERE;
	textRLCC.placeholder = ENTERHERE;
	[_scrollView setContentSize:CGSizeMake(320, 500)];
    [super viewDidLoad];
}
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
//////////////For the returning the keypad
- (void)textFieldDidBeginEditing:(UITextField *)textField;
{	
    editingField = textField;
}
-(IBAction)userdidenteringtext:(id)sender
{
	[editingField resignFirstResponder];
}

///////Email the Image
-(void)emailTheImage:(UIImage*)imageToEmail
{
	NSArray *arrayRec = [NSArray arrayWithObjects:BLACKJEFFEMAIL,nil];
	if ([MFMailComposeViewController canSendMail])
	{
		MFMailComposeViewController *mcvc = [[[MFMailComposeViewController alloc] init] autorelease];
		mcvc.mailComposeDelegate = self;
		[mcvc setSubject:@"What I can Afford"];
		[mcvc setToRecipients:arrayRec];
		NSString *messageBdy = [NSString stringWithFormat:@"Name %@<br>Phone %@ <br>Credit %@<br>Home %@ <br>Revolving line of credit %@",textFldName.text,textPhone.text,textCredit.text,textHome.text,textRLCC.text];
		[mcvc setMessageBody:messageBdy isHTML:YES];
		//[mcvc addAttachmentData:UIImageJPEGRepresentation(imageToEmail, 1.0f) mimeType:@"image/jpeg" fileName:@"pickerimage.jpg"];
		[self presentModalViewController:mcvc animated:YES];
		[self dismissHUD];
	}
	
}


-(IBAction)sentEmail:(id)sender
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
	[textCredit release];
	[textHome release];
	[textRLCC release];
	[_scrollView release];
	[textFldName release];
	[textPhone release];
    [super dealloc];
}


@end
