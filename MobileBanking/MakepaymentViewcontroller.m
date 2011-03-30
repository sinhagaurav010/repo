//
//  MakepaymentViewcontroller.m
//  MobileBanking
//
//  Created by CHROME INFOTECH  on 28/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MakepaymentViewcontroller.h"
#import "Constant.h"
#import  "JSON.h"

@implementation MakepaymentViewcontroller


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}

-(IBAction)userdidenteringtext:(id)sender
{
	[sender resignFirstResponder];
	
}
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.

- (void)viewDidLoad {
	
	text_sendon.userInteractionEnabled  =  NO;

	/////This will check sendon is filled or not
	_issendOnfill = 0;
	datePicker.hidden  =  YES;
	
	
	//////////To extract the data from the JSON file
	NSString *filePath = [[NSBundle mainBundle] pathForResource:@"billpayer-addpayment-reply" ofType:@"txt"];  
	NSData *myData = [NSData dataWithContentsOfFile:filePath];  
	NSString *responseString = [[NSString alloc] initWithData:myData encoding: NSUTF8StringEncoding];
	[datePicker addTarget:self action:@selector(toselectDate:) forControlEvents:UIControlEventValueChanged];

	NSMutableDictionary	*Strg_dic   =  [NSMutableDictionary  new];/////DICTIONARY  to add value from JSON
	Strg_dic  = [[responseString JSONValue] copy]; 
	
	if(DEBUGG)
	  NSLog(@"Strg_dicStrg_dic----%@",Strg_dic);
	
	
	string_amount			    =   [[[[Strg_dic objectForKey:@"Reply"] objectForKey:@"BillPayerServices"]objectForKey:@"BillPayerPaymentDetails"] objectForKey:@"Amount"];
    text_amount.text		    =    string_amount;
	
	
	string_confirmation			=   [[[[Strg_dic objectForKey:@"Reply"] objectForKey:@"BillPayerServices"]objectForKey:@"BillPayerPaymentDetails"] objectForKey:@"ConfirmationNumber"];
	string_DeliverBy			=   [[[[Strg_dic objectForKey:@"Reply"] objectForKey:@"BillPayerServices"]objectForKey:@"BillPayerPaymentDetails"] objectForKey:@"DeliverBy"];


	string_sentOn			    =   [[[[Strg_dic objectForKey:@"Reply"] objectForKey:@"BillPayerServices"]objectForKey:@"BillPayerPaymentDetails"] objectForKey:@"SentOn"];
   // text_sendon.text		=  string_sentOn;   
	
	if(DEBUGG)
		NSLog(@"Strg_dicStrg_dic----%@",Strg_dic);
	/*
	string_messsage   =   [@"Success Payment\nConfirmationNumber: " stringByAppendingString:string_confirmation];
	string_messsage   =   [string_messsage stringByAppendingString:@"SentOn: " ];
	string_messsage   =   [string_messsage stringByAppendingString:string_sentOn];
	string_messsage   =   [string_messsage stringByAppendingString:@"DeliverBy:"];
	string_messsage   =   [string_messsage stringByAppendingString:string_DeliverBy];

	NSLog(@"string_messsage   %@",string_messsage);*/


	self.navigationItem.title   =  BILLPAYEETITLE;
    lable_payee.text			=  billPayee;
/*	if(Strg_dic)
	{
		[Strg_dic  release];
		Strg_dic  =  nil;
	}
*/	
	////////To make the logout button
	UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(doneButtonClick:)];          
	self.navigationItem.rightBarButtonItem = anotherButton;
	if(anotherButton)
	{
		[anotherButton   release];
		anotherButton  =  nil;
	}
	
    [super viewDidLoad];
	
}

////////////When logout button is clicked
-(IBAction)doneButtonClick:(id)sender
{
	
	if(_IPAD == 0)
	{
		UserViewController    *objUserViewController      =    [UserViewController  new];
		objUserViewController.hidesBottomBarWhenPushed = YES;
		[self.navigationController  pushViewController:objUserViewController animated:YES];
		if(objUserViewController)
		{
			[objUserViewController  release];
			objUserViewController    =   nil;	
		}
	}
	else
	{
		UserViewController    *objUserViewController      =    [[UserViewController alloc] initWithNibName:@"UserViewController_Ipad" bundle:nil];
		objUserViewController.hidesBottomBarWhenPushed = YES;
		[self.navigationController  pushViewController:objUserViewController animated:YES];
		if(objUserViewController)
		{
		  [objUserViewController  release];
		   objUserViewController    =   nil;	
		}
	}
	
}
//////////////////////////////////////////////


/////////When user want to set the date from datepicker 
-(IBAction)togetcalender:(id)sender
{
//	[sender resignFirstResponder];
	if(datePicker.hidden == YES)
	{
		text_sendon.userInteractionEnabled  =  NO;
		datePicker.hidden  =  NO;
	}
	else
	{
		datePicker.hidden = YES;
		text_sendon.userInteractionEnabled  =  NO;
	}
}
//////////////////////////////////////////////

////When make payment is clicked
-(IBAction)clickonmakepayement:(id)sender
{
	NSLog(@"string_confirmationstring_confirmation%@",string_confirmation);
	if(_issendOnfill == 1)
	{
	UIAlertView *alert	=	[[UIAlertView alloc]initWithTitle:@"Success Payment" message:[NSString stringWithFormat:@"ConfirmationNumber: %@\nSentOn: %@\nDeliverBy:%@",string_confirmation, string_sentOn,string_DeliverBy] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert show];
	[alert release];
	}
	else {
		UIAlertView *alert	=	[[UIAlertView alloc]initWithTitle:@"Field incomplete" message:nil delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
		//UITextView *myTextField = [[UITextView alloc] initWithFrame:CGRectMake(12.0, 45.0, 260.0, 100)];
		//myTextField.text   =  string_messsage;
		//[alert addSubview:myTextField];
		//	[alert addTextFieldWithValue:@"" label:@""]
		[alert show];
		[alert release];
	}

}
//////////////////////////////////////////////

///Cancel button is clicked
-(IBAction)clickoncancel:(id)sender
{
	
	UIAlertView *alert	=	[[UIAlertView alloc]initWithTitle:@"Are you sure" message:nil delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES",nil];
	//UITextView *myTextField = [[UITextView alloc] initWithFrame:CGRectMake(12.0, 45.0, 260.0, 100)];
	//myTextField.text   =  string_messsage;
	//[alert addSubview:myTextField];
	//	[alert addTextFieldWithValue:@"" label:@""]
	[alert show];
	[alert release];
}
//////////////////////////////////////////////


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex { 
	switch(buttonIndex) {
		case 0:
			//cancel
			
			break;
		case 1:
						[self.navigationController  popViewControllerAnimated:YES];
			break;
		default:
			break;
	}
}

///////To select date from picker view
- (void)toselectDate:(id)sender
{
	NSDateFormatter *   dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"yyyy-MM-dd"];
	_issendOnfill  =  1;
    text_sendon.text						  = [dateFormatter stringFromDate:[datePicker date]];
	
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return NO;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];   // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	if(lable_payee)
	{
		[lable_payee  release];
		lable_payee  =  nil;
	}
	if(text_amount)
	{
		[text_amount  release];
		text_amount  =  nil;
	}
	if(text_sendon)
	{
		[text_sendon  release];
		text_sendon  =  nil;
	}
	if(buttonMakepayment)
	{
		[buttonMakepayment  release];
		buttonMakepayment  =  nil;
	}
	if(button_cancel)
	{
		[button_cancel  release];
		button_cancel  =  nil;
	}
	if(button_calender)
	{
		[button_calender  release];
		button_calender  =  nil;
	}
	if(datePicker)
	{
		[datePicker  release];
		datePicker  =  nil;
	}
	if(array_MakePayment)
	{
		[array_MakePayment  release];
		array_MakePayment  =  nil;
	}
	
	
    [super dealloc];
}


@end
