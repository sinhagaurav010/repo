//
//  SummaryTableViewController.m
//  MobileBanking
//
//  Created by CHROME INFOTECH  on 28/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SummaryTableViewController.h"
#import  "Constant.h"

@implementation SummaryTableViewController

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	/*self.navigationItem.title  =				HISTORYTITLE;
	//if(indexPath.row == 0)
	NSString   *html						=	[NSString stringWithFormat:@"<html><head></head><body>"];
	[webview_detail setBackgroundColor:[UIColor clearColor]];
	[webview_detail setOpaque:NO];
	NSString  *strngfrGV					=	[NSString new];  
	NSString *mater_transfer				=	[NSString stringWithFormat:@"<BR><font size=\"3\"><p><b>Transfer:</b>%@</font>",[array_transfer objectAtIndex:_whichValuePassed],nil];
	NSString *mater_balance					=   [NSString stringWithFormat:@"<BR><font size=\"3\"><p><b>Balance:</b>%@</font>",[array_balance objectAtIndex:_whichValuePassed],nil];
	NSString *mater_effdate					=	[NSString stringWithFormat:@"<BR><font size=\"3\"><p><b>EffectiveDate:</b>%@</font>",[array_dateeffective objectAtIndex:_whichValuePassed],nil];
							
	NSString *strng							=	@"</body></html>";
	
	strngfrGV								=	[html stringByAppendingString:mater_transfer] ;
	strngfrGV								=	[strngfrGV stringByAppendingString:mater_balance] ;
	strngfrGV								=	[strngfrGV stringByAppendingString:mater_effdate] ;

	strngfrGV								=	[strngfrGV stringByAppendingString:strng] ;
	NSString *path							= [[NSBundle mainBundle] bundlePath];
	NSURL *baseURL							= [NSURL fileURLWithPath:path];
	[webview_detail loadHTMLString:strngfrGV baseURL:baseURL];
	UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(doneButtonClick:)];          
	self.navigationItem.rightBarButtonItem = anotherButton;
    [super viewDidLoad];*/
	
}
-(IBAction)doneButtonClick:(id)sender
{
	
	/*UserViewController    *objUserViewController      =    [UserViewController  new];
	objUserViewController.hidesBottomBarWhenPushed = YES;
	[self.navigationController  pushViewController:objUserViewController animated:YES];
	if(objUserViewController)
	{
		[objUserViewController  release];
		objUserViewController    =   nil;	
	}*/
	
}
/*
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    return 1;
	
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{	
    return (3);//+_numOfclicked*3);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	UITableViewCell *cell;// = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	cell	   = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:nil] autorelease];
	
	//BOOL _toAdd;
	///CGRect labelFrame		= CGRectMake(cell.frame.origin.x+10,cell.frame.origin.y+12, 300, 24);
	//UILabel  *lblSummary		= [[UILabel alloc] initWithFrame:labelFrame];
	cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
	cell.textLabel.numberOfLines = 0;
	cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:17.0];
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	if(indexPath.row == 0)
	cell.textLabel.text			=	[@"Transfer:  " stringByAppendingString: [array_transfer objectAtIndex:_whichValuePassed]];	
	
	if(indexPath.row == 1)
		cell.textLabel.text			=	[@"Balance:  " stringByAppendingString:[array_balance objectAtIndex:_whichValuePassed]];	

	if(indexPath.row == 2)
		cell.textLabel.text			=	[@"Effective Date:  " stringByAppendingString:[array_dateeffective objectAtIndex:_whichValuePassed]];	

	/*[cell addSubview:lblSummary];
	if(lblSummary)
	{
		[lblSummary   release];
		lblSummary   =  nil;
	}
	return cell;
	
}*/


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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
