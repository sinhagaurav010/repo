//
//  MortaggeCalculatorViewController.m
//  Zillow
//
//  Created by gaurav sinha on 16/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MortaggeCalculatorViewController.h"
#import "Global.h"

@implementation MortaggeCalculatorViewController

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
	_check = 0;
	
	[self.navigationItem setTitle:MORTGAGE];
	
	UIGestureRecognizer *recognizer;
	UITapGestureRecognizer *tapRecognizer;
	recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapFrom:)];
	[_scrollView addGestureRecognizer:recognizer];
	//tapRecognizer.numberOfTapsRequired = 1;
	tapRecognizer = (UITapGestureRecognizer *)recognizer;
	recognizer.delegate = self;
	[recognizer release];
	
	textMP.userInteractionEnabled = NO;
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"ForColor.png"]];
	[_scrollView setContentSize:CGSizeMake(320,420)];
    [super viewDidLoad];
}

#pragma mark -
#pragma mark textFieldDidEndEditing

- (void)textFieldDidEndEditing:(UITextField *)textField             
{
	if(textField == textIR)
	{
		NSString *stringText = textIR.text;
		textIR.text = [NSString stringWithFormat:@"%@",stringText];
	}
	
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
-(BOOL)checkForNillInTextField:(UITextField*)textFld
{
if([textFld.text length]>0)
	return 1;
else 
{
	return 0;
}

}

#pragma mark -
#pragma mark returnKeyPad

-(IBAction)userdidenteringtext:(id)sender
{
	if(editingField == textMT)
	{
		if([self checkForNillInTextField:textLA]==1)
            _check = 1;
        else 
        {
            [self alertForTextField:@"Loan Amount Text Field"];
        }
        
        if(_check == 1)
        {
            if([self checkForNillInTextField:textIR]==1)
                _check = 1;
            else 
            {
                _check = 0;
                [self alertForTextField:@"Interest Rate Text Field"];
            }
        }
        if(_check == 1)
        {
            if([self checkForNillInTextField:textMT]==1)
                _check = 1;
            else {
                _check = 0;
                [self alertForTextField:@"Mortgage Term Text Field"];
            }
        }
        
        if(_check == 1)
        {
            [self calculateValue];
        }

	}
	if(editingField == textIR)
	{
		textIR.text = [NSString stringWithFormat:@"%@ %",textIR.text];
	}
	[editingField resignFirstResponder];
}
-(void)alertForTextField:(NSString*)stringValue
{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:[NSString stringWithFormat:@"%@ can't Empty",stringValue] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert show];
	[alert release];
}
#pragma mark -
#pragma mark shouldChangeCharactersInRange

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string 
{
	NSString *resultingString = [textField.text stringByReplacingCharactersInRange: range withString: string];
	
	// The user deleting all input is perfectly acceptable.
	if ([resultingString length] == 0) {
		return true;
	}
	
	NSInteger holder;
	
	NSScanner *scan = [NSScanner scannerWithString: resultingString];
	
	return [scan scanInteger: &holder] && [scan isAtEnd];
}

#pragma mark -
#pragma mark calculateValue

-(void)calculateValue
{
	float p = [textLA.text floatValue];
	float i = [textIR.text floatValue];
	float l = [textMT.text floatValue];
	float j = i/(12*100);
	float n = l*12;
	
	float m = p*(j/(1-pow((1+j), -n)));
	textMP.text = [NSString stringWithFormat:@"$%1.2f",m];
}

-(IBAction)calculate:(id)sender
{
	if([self checkForNillInTextField:textLA]==1)
        _check = 1;
	else 
	{
		[self alertForTextField:@"Loan Amount Text Field"];
	}
	
	if(_check == 1)
	{
        if([self checkForNillInTextField:textIR]==1)
            _check = 1;
        else 
        {
            _check = 0;
            [self alertForTextField:@"Interest Rate Text Field"];
        }
	}
	if(_check == 1)
	{
        if([self checkForNillInTextField:textMT]==1)
            _check = 1;
        else {
            _check = 0;
            [self alertForTextField:@"Mortgage Term Text Field"];
        }
	}
	
	if(_check == 1)
	{
		[self calculateValue];
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
	[textLA release];
	[textIR release];
	[textMT release];
	[textMP release];
	[_scrollView release];
	[editingField release];
    [super dealloc];
}


@end
