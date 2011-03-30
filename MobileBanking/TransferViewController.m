//
//  TransferViewController.m
//  MobileBanking
//
//  Created by CHROME INFOTECH  on 29/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
#import "SummryViewController.h"
#import "TransferViewController.h"
#import "Constant.h"
#import "JSON.h"
#import "UserViewController.h"

@implementation TransferViewController

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

-(IBAction)userdidenteringtext:(id)sender
{
    //if(	pickerView.hidden  ==  NO)
	[sender resignFirstResponder];
	
}

////When user is clicked to transfer the money
-(IBAction)clickontarnsfer:(id)sender
{
	//for(int i=0;i<[])
	//if()
	 if([text_amonut.text length]==0)
	{
		UIAlertView *alert	=	[[UIAlertView alloc]initWithTitle:nil message:@"Amount field can not be empty" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:nil];
		[alert show];
		[alert release];
	}
	else if(!([text_from.text isEqualToString:@"Savings"]))
	{
		UIAlertView *alert	=	[[UIAlertView alloc]initWithTitle:nil message:[NSString stringWithFormat:@"Unsufficient Amount to transfer \nYou have $0 in %@",text_from.text] delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:nil];
		[alert show];
		[alert release];
	}
	
	else if( [text_from.text isEqualToString: text_to.text])
	{
		UIAlertView *alert	=	[[UIAlertView alloc]initWithTitle:nil message:@"You have selected same account" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:nil];
		[alert show];
		[alert release];
	}
    else if( [text_amonut.text integerValue]>[string_toavail  integerValue])
    {
	UIAlertView *alert	=	[[UIAlertView alloc]initWithTitle:nil message:[NSString stringWithFormat:@"Unsufficient Amount to transfer \nYou have %@ in savings",string_toavail] delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:nil];
	[alert show];
	[alert release];
    }
	
	else 
	{
		UIAlertView *alert	=	[[UIAlertView alloc]initWithTitle:@"Mobile Banking - transfer" message:[NSString stringWithFormat:@"Amount: %@\nEffectiveDate: %@\nAccount:%@\nSLType: %@\nSuffix: %@\nFromBalance: %@\nFromAvailable: %@\nToAccount: %@\nToSLType: %@\nToSuffix: %@\nToAvailable: %@\n\n",string_ammount,string_effectiveDate,string_account,string_SLtype,string_suffix,string_frombalance,string_fromavail,string_toaccount,string_toSLtype,string_tosuffix,string_toavail] delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
		//UITextView *myTextField = [[UITextView alloc] initWithFrame:CGRectMake(12.0, 45.0, 260.0, 100)];
		//myTextField.text   =  string_messsage;
		//[alert addSubview:myTextField];
		//	[alert addTextFieldWithValue:@"" label:@""]
		//UIAlertView *alert	=	[[UIAlertView alloc]initWithTitle:@"Mobile Banking - transfer" message:[NSString stringWithFormat:@"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"] delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:nil];
		[alert show];
		UITextField* text = [[UITextField alloc] initWithFrame:CGRectMake(30, 45.0, 240, 25.0)];
		text.text         =  [NSString stringWithFormat:    @"Amount:            %@",string_ammount];
		text.borderStyle = UITextBorderStyleRoundedRect;
		UITextField* text_eff = [[UITextField alloc] initWithFrame:CGRectMake(30.0, 70.0, 240, 25.0)];
		text_eff.text         =  [NSString stringWithFormat:@"EffectiveDate:    %@",string_effectiveDate];
		text_eff.borderStyle = UITextBorderStyleRoundedRect;
		[alert addSubview:text_eff];
		[alert addSubview:text];
		
		UITextField* text_am = [[UITextField alloc] initWithFrame:CGRectMake(30.0, 95, 240, 25.0)];
		text_am.text         =  [NSString stringWithFormat: @"Account:          %@",string_account];
		text_am.borderStyle = UITextBorderStyleRoundedRect;
		[alert addSubview:text_am];
		
		UITextField* text_sl = [[UITextField alloc] initWithFrame:CGRectMake(30.0, 120, 240, 25.0)];
		text_sl.text         =  [NSString stringWithFormat: @"SLType:           %@",string_SLtype];
		text_sl.borderStyle = UITextBorderStyleRoundedRect;
		[alert addSubview:text_sl];
		
		UITextField* text_su = [[UITextField alloc] initWithFrame:CGRectMake(30.0, 120, 240, 25.0)];
		text_su.text         =  [NSString stringWithFormat: @"Suffix:               %@",string_suffix];
		text_su.borderStyle = UITextBorderStyleRoundedRect;
		[alert addSubview:text_su];
		
		UITextField* text_bal = [[UITextField alloc] initWithFrame:CGRectMake(30.0, 145, 240, 25.0)];
		text_bal.text         =  [NSString stringWithFormat:@"FromBalance:    %@",string_frombalance];
		text_bal.borderStyle = UITextBorderStyleRoundedRect;
		[alert addSubview:text_bal];
		
		UITextField* text_fromavail = [[UITextField alloc] initWithFrame:CGRectMake(30.0, 170, 240, 25.0)];
		text_fromavail.text   =  [NSString stringWithFormat:@"FromAvailable:  %@",string_fromavail];
		text_fromavail.borderStyle = UITextBorderStyleRoundedRect;
		[alert addSubview:text_fromavail];
		
		UITextField* text_toaccount = [[UITextField alloc] initWithFrame:CGRectMake(30.0, 195, 240, 25.0)];
		text_toaccount.text  =  [NSString stringWithFormat: @"ToAccount:       %@",string_toaccount];
		text_toaccount.borderStyle = UITextBorderStyleRoundedRect;
		[alert addSubview:text_toaccount];
		
		UITextField* text_toSLtype = [[UITextField alloc] initWithFrame:CGRectMake(30.0, 220, 240, 25.0)];
		text_toSLtype.text    =  [NSString stringWithFormat:@"ToSLType:        %@",string_toSLtype];
		text_toSLtype.borderStyle = UITextBorderStyleRoundedRect;
		[alert addSubview:text_toSLtype];
		
		UITextField* text_ToSuffix = [[UITextField alloc] initWithFrame:CGRectMake(30.0, 245, 240, 25.0)];
		text_ToSuffix.text    =  [NSString stringWithFormat:@"ToSuffix:           %@",string_tosuffix];
		text_ToSuffix.borderStyle = UITextBorderStyleRoundedRect; 
		[alert addSubview:text_ToSuffix];
		
		UITextField* text_ToAvailable = [[UITextField alloc] initWithFrame:CGRectMake(30.0, 270, 240, 25.0)];
		text_ToAvailable.text = [NSString stringWithFormat:@"ToAvailable:      %@",string_toavail];
		text_ToAvailable.borderStyle = UITextBorderStyleRoundedRect;
		[alert addSubview:text_ToAvailable];
		//[alert addLabelWithTitle:@"Cancel"];*/

		[alert release];
		
	}
}

/////When cancel button is clicked
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
/////////////////////////////

////////When field of To is to be selected
-(IBAction)clickondropforto:(id)sender
{
	[sender resignFirstResponder];

	if(	pickerView.hidden  ==  YES)
	{
		pickerView.hidden  =  NO;
		_isToClicked  = 1;
		_isFromClicked = 0;
	}
	else 
	{
		pickerView.hidden  =  YES;
		_isToClicked  = 0;
	}
}
/////////////////////////////

////////When field of From is to be selected
-(IBAction)clickondropforfrom:(id)sender
{
	[sender resignFirstResponder];

	if(	pickerView.hidden  ==  YES)
	{
		pickerView.hidden  =  NO;
		_isToClicked  = 0;
		_isFromClicked = 1;

	}
	else 
	{
		pickerView.hidden  =  YES;
		_isFromClicked = 0;
	}
}
/////////////////////////////

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	_isToClicked  = 0;
	_isFromClicked = 0;

	pickerView.hidden  =  YES;
	text_from.userInteractionEnabled  = NO;
	text_to.userInteractionEnabled    = NO;
	self.navigationItem.title  =  TRANSFERTITLE;
	
	NSString *filePath = [[NSBundle mainBundle] pathForResource:@"transfer-reply" ofType:@"txt"];  
	NSData *myData = [NSData dataWithContentsOfFile:filePath];  
	
	NSString *responseString = [[NSString alloc] initWithData:myData encoding: NSUTF8StringEncoding];
	
	NSMutableDictionary	*Strg_dic   =  [NSMutableDictionary  new];/////DICTIONARY  to add value from JSON
	Strg_dic  = [[responseString JSONValue] copy]; 
	
	if(DEBUGG)
		NSLog(@"Strg_dicStrg_dic----%@",Strg_dic);
	string_ammount        =  [[[Strg_dic objectForKey:@"Reply"] objectForKey:@"transfer"]objectForKey:@"Amount"];
	string_effectiveDate  =  [[[Strg_dic objectForKey:@"Reply"] objectForKey:@"transfer"]objectForKey:@"EffectiveDate"];
	string_account		  =  [[[Strg_dic objectForKey:@"Reply"] objectForKey:@"transfer"]objectForKey:@"Account"];
	string_SLtype		  =  [[[Strg_dic objectForKey:@"Reply"] objectForKey:@"transfer"]objectForKey:@"SLType"];
	string_suffix         =  [[[Strg_dic objectForKey:@"Reply"] objectForKey:@"transfer"]objectForKey:@"Suffix"];
	string_frombalance    =  [[[Strg_dic objectForKey:@"Reply"] objectForKey:@"transfer"]objectForKey:@"FromBalance"];
	string_fromavail      =  [[[Strg_dic objectForKey:@"Reply"] objectForKey:@"transfer"]objectForKey:@"FromAvailable"];
	string_toaccount      =  [[[Strg_dic objectForKey:@"Reply"] objectForKey:@"transfer"]objectForKey:@"ToAccount"];
	string_toSLtype       =  [[[Strg_dic objectForKey:@"Reply"] objectForKey:@"transfer"]objectForKey:@"ToSLType"];
	string_tosuffix       =  [[[Strg_dic objectForKey:@"Reply"] objectForKey:@"transfer"]objectForKey:@"ToSuffix"];
	string_toavail        =  [[[Strg_dic objectForKey:@"Reply"] objectForKey:@"transfer"]objectForKey:@"ToAvailable"];
	
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(doneButtonClick:)];          
	self.navigationItem.rightBarButtonItem = anotherButton;
	if(anotherButton)
	{
		[anotherButton   release];
		anotherButton     =  nil;
	}
	
	/*if(Strg_dic)
	{
		[Strg_dic  release];
		Strg_dic  =  nil;
	}*/
    [super viewDidLoad];
	
}
-(IBAction)doneButtonClick:(id)sender
{
	if(_IPAD == 0)
	{
		UserViewController    *objUserViewController      =    [UserViewController  new];
		objUserViewController.hidesBottomBarWhenPushed    = YES;
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
		objUserViewController.hidesBottomBarWhenPushed    = YES;
		[self.navigationController  pushViewController:objUserViewController animated:YES];
		if(objUserViewController)
		{
			[objUserViewController  release];
			objUserViewController    =   nil;	
		}
	}
}
																
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	
	return 1;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
	
	return  [array_savedData count];
	
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
	return [array_savedData objectAtIndex:row];
	
	//return @"cell";
}
/*
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
	UIView *componentView = [[UIView alloc]init];
	componentView.frame = CGRectMake(0,0,200,30);
	UILabel *lbl_Compont = [[UILabel alloc]initWithFrame:CGRectMake(0,10,150,30)];
	lbl_Compont.text= @"Gauarav";
	[componentView addSubview:lbl_Compont];
	return componentView;

}*/

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	if(_isFromClicked == 1)
	text_from.text  = [array_savedData objectAtIndex:row];
	else
		text_to.text  = [array_savedData objectAtIndex:row];
}



// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
   // return (interfaceOrientation == UIInterfaceOrientationPortrait);
	return  NO;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	if(text_from)
	{
	    [text_from  release];
		text_from  =  nil;
	}
	if(text_to)
	{
	    [text_to  release];
		text_to  =  nil;
	}
	if(text_amonut)
	{
	    [text_amonut  release];
		text_amonut  =  nil;
	}	
	if(button_transfer)
	{
	    [button_transfer  release];
		button_transfer  =  nil;
	}
	if(button_cancel)
	{
	    [button_cancel  release];
		button_cancel  =  nil;
	}
	if(button_dropFrom)
	{
	    [button_dropFrom  release];
		button_dropFrom  =  nil;
	}
	if(button_dropTo)
	{
	    [button_dropTo  release];
		button_dropTo  =  nil;
	}
	if(pickerView)
	{
	    [pickerView  release];
		pickerView  =  nil;
	}
	
	
    [super dealloc];
}


@end
