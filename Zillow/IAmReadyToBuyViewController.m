//
//  IAmReadyToBuyViewController.m
//  Zillow
//
//  Created by gaurav sinha on 20/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "IAmReadyToBuyViewController.h"


@implementation IAmReadyToBuyViewController

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
	
    arrayNo = [[NSMutableArray alloc] init];
    [arrayNo addObject:@" 1 "];
    [arrayNo addObject:@" 2 "];
    [arrayNo addObject:@" 3 "];
    [arrayNo addObject:@" 4 "];
    [arrayNo addObject:@" 5 "];
    [arrayNo addObject:@" 6+ "];
    
    
    
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
    
	[self.navigationItem setTitle:READYTOBUY];
	
//	UIGestureRecognizer *recognizer;
//	UITapGestureRecognizer *tapRecognizer;
//	recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapFrom:)];
//	[scrollView addGestureRecognizer:recognizer];
//	//tapRecognizer.numberOfTapsRequired = 1;
//	tapRecognizer = (UITapGestureRecognizer *)recognizer;
//	recognizer.delegate = self;
//	[recognizer release];
//	
	[scrollView setContentSize:CGSizeMake(320, 560)];
    [super viewDidLoad];
}


- (void)textFieldDidBeginEditing:(UITextField *)textField;
{	
    editingField = textField;
}

//- (IBAction)dismissKeyboard:(id)sender;
//{
//    [editingField resignFirstResponder];
//}

- (void)handleTapFrom:(UITapGestureRecognizer *)recognizer 
{
	[editingField resignFirstResponder];	
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
-(void)emailTheImage:(UIImage*)imageToEmail
{
	NSArray *arrayRec = [NSArray arrayWithObjects:BLACKJEFFEMAIL,nil];
	if ([MFMailComposeViewController canSendMail])
	{
		MFMailComposeViewController *mcvc = [[[MFMailComposeViewController alloc] init] autorelease];
		mcvc.mailComposeDelegate = self;
		[mcvc setSubject:@"I am Ready to Buy"];
		[mcvc setToRecipients:arrayRec];
		NSString *messageBdy = [NSString stringWithFormat:@"Name %@<br>Phone %@ <br>%@<br>city i want to move to%@<br>Pool %@ <br> %@<br> %@<br>special features%@",textname.text,textphone.text,buttonTime.titleLabel.text,textMove.text,textPool.text,buttonBed.titleLabel.text,buttonBath.titleLabel.text,textfea.text];
		[mcvc setMessageBody:messageBdy isHTML:YES];
		//[mcvc addAttachmentData:UIImageJPEGRepresentation(imageToEmail, 1.0f) mimeType:@"image/jpeg" fileName:@"pickerimage.jpg"];
		[self presentModalViewController:mcvc animated:YES];
		[self dismissHUD];
	}
	
}

#pragma -
#pragma forthtimeframe

-(IBAction)Fortimeframe:(id)sender
{
    arrayNo = [[NSMutableArray alloc] init];
    [arrayNo addObject:@"1 to 3 Months"];
    [arrayNo addObject:@"3 to 6 Months"];
    [picker reloadAllComponents];
    _fromBed = 2;
    viewForPicker.hidden = NO;
}
-(IBAction)sendEmail:(id)sender
{
	[self emailTheImage:nil];
}


-(IBAction)userdidenteringtext:(id)sender
{
	[editingField resignFirstResponder];
}
////////

#pragma -
#pragma buttonaction
-(IBAction)tapToNumBd:(id)sender
{
    arrayNo = [[NSMutableArray alloc] init];
    [arrayNo addObject:@" 1 "];
    [arrayNo addObject:@" 2 "];
    [arrayNo addObject:@" 3 "];
    [arrayNo addObject:@" 4 "];
    [arrayNo addObject:@" 5 "];
    [arrayNo addObject:@" 6+ "];
    [picker reloadAllComponents];
    
    _fromBed = 1;
    viewForPicker.hidden = NO;
}
-(IBAction)tapToNumBath:(id)sender
{

    arrayNo = [[NSMutableArray alloc] init];
    [arrayNo addObject:@" 1 "];
    [arrayNo addObject:@" 2 "];
    [arrayNo addObject:@" 3 "];
    [arrayNo addObject:@" 4 "];
    [arrayNo addObject:@" 5 "];
    [arrayNo addObject:@" 6+ "];
    [picker reloadAllComponents];
    
    _fromBed= 0;
    viewForPicker.hidden = NO;
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
    
    if(_fromBed == 1)
        [buttonBed setTitle:[NSString stringWithFormat:@"Number of Bedrooms :%@",[arrayNo objectAtIndex:row] ] forState:(UIControlState)UIControlStateNormal];  
    else if(_fromBed == 0)
        [buttonBath setTitle:[NSString stringWithFormat:@"Number of Bathrooms :%@",[arrayNo objectAtIndex:row] ] forState:(UIControlState)UIControlStateNormal];    
    else if(_fromBed  == 2)
        [buttonTime setTitle:[NSString stringWithFormat:@"Time Frame :%@",[arrayNo objectAtIndex:row] ] forState:(UIControlState)UIControlStateNormal];  
    
    viewForPicker.hidden = YES;
   
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
	[textname release];
	[textphone release];
	[textMove release];
	[textPool release];
	[textBedRooms release];
	[textBath release];
	[textfea release];
	[scrollView release];
    [arrayNo release];
    [buttonBed release];
    [buttonBath release];
    [picker release];
    [viewForPicker release];
    [editingField release];
    [super dealloc];
}


@end
