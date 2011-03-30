//
//  TwitterViewController.m
//  TwitterToTwit
//
//  Created by gaurav sinha on 17/03/11.
//  Company VINSOL
// Email:gaurav.sinha@vinsol.com


#import "TwitterViewController.h"
#import "TwitterRequest.h"
//#import <libxml/xmlmemory.h>
#import "XMLParser.h"
#import "ExampleCell.h"

@implementation TwitterViewController
@synthesize _fromTweet;
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

#pragma -
#pragma viewwillappear
- (void)viewWillAppear:(BOOL)animated
{
    [self timeLineFunction]; 
//}
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
    [self.navigationItem setTitle:@"Twitter"];
    [super viewDidLoad];
}

-(void)timeLineFunction
{
    tr = [[TwitterRequest alloc] init];    
    NSURL *url = [NSURL URLWithString:@"http://twitter.com/statuses/public_timeline.xml"];
    [tr friends_timeline:self requestSelector:@selector(public_timeline_callback:) forUrl:url];

}
-(void)public_timeline_callback:(NSData *)data
{
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Click To Tweet" style:UIBarButtonItemStylePlain target:self action:@selector(clickToTwit)];          
	self.navigationItem.rightBarButtonItem = anotherButton;
	[anotherButton release];
	
   // NSString *string = [[NSString alloc]initWithData:data encoding:NSASCIIStringEncoding];
   // NSLog(@"%@",string);
    XMLParser *obj = [XMLParser new];
    
    root = [obj parseXMLFromData:data];

    if(_tableView)
    {
        [_tableView removeFromSuperview];
        [_tableView release];
    }
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    [self.view addSubview:_tableView];
    
    _tableView.delegate = self;
    
    _tableView.dataSource = self;
   
}   

#pragma -
#pragma table

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [root.children count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ExampleCell";
    
    ExampleCell *cell = (ExampleCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[ExampleCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    //cell.detailTextLabel.textAlignment = UITextAlignmentCenter;
    }
    
    TreeNode *child = [[root children] objectAtIndex:[indexPath row]];
    
    TreeNode *childTime = [[child children] objectAtIndex:0];
    
    if(childTime.leafvalue)
    [cell setdelay:childTime.leafvalue];
    
    TreeNode *childUses = [[child children] objectAtIndex:11];

    TreeNode *childchildImage = [[childUses children] objectAtIndex:5];
    	
    [cell setFlickrPhoto:childchildImage.leafvalue];
       
    TreeNode *childchildchild = [[childUses children] objectAtIndex:2];
        
    TreeNode *childDiscrp = [[childUses children] objectAtIndex:4];
	// Set text
        
	if (childchildchild.hasLeafValue)
    {
        [cell setTitle:childchildchild.leafvalue];
        [cell setSubTitle:childDiscrp.leafvalue];
    }
        else
		cell.detailTextLabel.text = @"";
	    
    
	return cell;
}

-(void)clickToTwit
{
	TwitterRushViewController *obj = [[TwitterRushViewController alloc] init];
	[self.navigationController pushViewController:obj animated:YES];
	[obj release];
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
    [tr release];
    [_tableView release];
    [root release];
    [buttonToTwit release];
    [super dealloc];
}


@end
