//
//  AppointmentViewController.m
//  Zillow
//
//  Created by gaurav sinha on 18/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AppointmentViewController.h"
#import "Global.h"

@implementation AppointmentViewController

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
	[self.navigationItem setTitle:APPIN];
    arrayNo = [[NSMutableArray alloc] init];
    [arrayNo addObject:@"We can help you Sell a Home "];
    [arrayNo addObject:@"We can help you Buy a Home"];

    viewForPicker = [[UIView alloc] initWithFrame:self.view.bounds];
    
    picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 100, 320, 216)];
    [viewForPicker addSubview:picker];
    picker.delegate = self;
    picker.dataSource = self;
    picker.showsSelectionIndicator = YES;
    
    //viewForPicker.backgroundColor = [UIColor redColor];
    [self.view addSubview:viewForPicker];
    
    viewForPicker.hidden = YES;
    [picker selectRow:1 inComponent:0 animated:NO];
	[scrollView setContentSize:CGSizeMake(320, 520)];
    [super viewDidLoad];
}

-(IBAction)clickToHelp:(id)sender
{
    arrayNo = [[NSMutableArray alloc] init];
    [arrayNo addObject:@"We can help you Sell a Home "];
    [arrayNo addObject:@"We can help you Buy a Home"];
    [picker reloadAllComponents];
    viewForPicker.hidden = NO;
    _fromdays = 0;
}

#pragma -
#pragma textfield

- (void)textFieldDidBeginEditing:(UITextField *)textField;
{
    editingField = textField;	
}
-(IBAction)userdidenteringtext:(id)sender
{
	[editingField resignFirstResponder];
}

#pragma -
#pragma mailcompposer

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
		[mcvc setSubject:APPIN];
		[mcvc setToRecipients:arrayRec];
		NSString *messageBdy = [NSString stringWithFormat:@"%@ <br> %@ <br>",buttonHelp.titleLabel.text,buttonDaysAvail.titleLabel.text];
		[mcvc setMessageBody:messageBdy isHTML:YES];
		//[mcvc addAttachmentData:UIImageJPEGRepresentation(imageToEmail, 1.0f) mimeType:@"image/jpeg" fileName:@"pickerimage.jpg"];
		[self presentModalViewController:mcvc animated:YES];
		[self dismissHUD];
	}
	
}


-(IBAction)sendEmail:(id)sender
{
	//_stringToEmail = [NSString stringWithFormat:@"%@"];
	[self emailTheImage:nil];
}

#pragma -
#pragma pickerview Code
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    return [arrayNo count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    return [arrayNo objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(_fromdays == 0)
    {
        [buttonHelp setTitle:[NSString stringWithFormat:@"%@",[arrayNo objectAtIndex:row] ] forState:(UIControlState)UIControlStateNormal];    
    viewForPicker.hidden = YES;
    }
    else
    {
        [buttonDaysAvail setTitle:[NSString stringWithFormat:@"Days Available %@",[arrayNo objectAtIndex:row] ] forState:(UIControlState)UIControlStateNormal];    
        viewForPicker.hidden = YES;
    }
    
}


#pragma -
#pragma daysavail
-(IBAction)daysAvail:(id)sender
{
    arrayNo = [[NSMutableArray alloc] init];
    [arrayNo addObject:@" Monday "];
    [arrayNo addObject:@" Tuesday "];
    [arrayNo addObject:@" Wednesday "];
    [arrayNo addObject:@" Thursday "];
    [arrayNo addObject:@" Friday "];
    [arrayNo addObject:@" Saturday "];
    [arrayNo addObject:@" Sunday "];
    [picker reloadAllComponents];
      viewForPicker.hidden = NO;
    _fromdays = 1;
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
	[textOther release];
	[textDataAvail release];
	[textTime release];
	[swBuy release];
	[swSale release];
	[swName release];
	[swEmail release];
	[swPhone release];
	[swMet release];
	[swUpdate release];
	[scrollView release];
  
    
    [buttonHelp release];
    [picker release];
    [buttonDaysAvail release];
    [arrayNo release];
    [viewForPicker release];
    [super dealloc];
}


@end
