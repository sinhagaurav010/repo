//
//  SearchViewController.m
//  MyappFinder
//
//  Created by gaurav sinha on 06/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SearchViewController.h"
#import "SharedInstance.h" 
#import "NearByDetailsViewController.h"
#import "SearchSortController.h"

@implementation SearchViewController

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
	share		= [SharedInstance sharedInstance];
	arraySearch = [NSMutableArray  new];
	
	
	/////TO sort the store according to country
	NSMutableArray *arraySearchFilter = [NSMutableArray new];
	for(int i = 0;i<[[share gettheArray] count];i++)
	{
		[arraySearchFilter addObject:[[[share gettheArray]objectAtIndex:i]objectForKey:@"county"]];
	}
	
	arraySearch = [DataController filterTheCountry:arraySearchFilter];
	[share settheMutablearrayWithSort:arraySearch];
	if(arraySearchFilter)
	{
		[arraySearchFilter release];
		arraySearchFilter = nil;
	}
	
   /* UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:nil cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
	
	[actionSheet setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
	
	CGRect pickerFrame = CGRectMake(40, 200, 100, 100);
	
	UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:pickerFrame];
	pickerView.showsSelectionIndicator = YES;
	pickerView.dataSource = self;
	pickerView.delegate = self;
	
	[actionSheet addSubview:pickerView];
	[pickerView release];
	
	UISegmentedControl *closeButton = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObject:@"Close"]];
	closeButton.momentary = YES; 
	closeButton.frame = CGRectMake(260, 70.0f, 50.0f, 30.0f);
	closeButton.segmentedControlStyle = UISegmentedControlStyleBar;
	closeButton.tintColor = [UIColor blackColor];
	[closeButton addTarget:self action:@selector(dismissActionSheet:) forControlEvents:UIControlEventValueChanged];
	[actionSheet addSubview:closeButton];
	[closeButton release];
	
	//[actionSheet showInView:[UIApplication mainWindow]];
	
	[self.view addSubview:actionSheet];
	
	[actionSheet setBounds:CGRectMake(0, 0, 320, 485)];
	*/
	[super viewDidLoad];
}

/////////////For the picker view
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}

// returns the picker view of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{	
	return  [arraySearch count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
	
	return [arraySearch objectAtIndex:row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	[share setFieldValueAtPos:2 ToValue:row];
	SearchSortController *obj = [SearchSortController new];
	[self.navigationController pushViewController:obj animated:YES];
	if(obj)
	{
		[obj  release];
		obj = nil;
 	}
}
////////////////////////////

////////////

////////////////////////////
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
    [super dealloc];
}


@end
