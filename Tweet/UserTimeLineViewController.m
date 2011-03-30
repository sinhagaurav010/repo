//
//  UserTimeLineViewController.m
//  TwitterToTwit
//
//  Created by gaurav sinha on 29/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UserTimeLineViewController.h"
#import "ExampleCell.h"
#import "TwitterRushViewController.h"

@implementation UserTimeLineViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [_tableView release];
   // [tr release ];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"view will appear");
    
    [self funcTwitterReq];
}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    //http://api.twitter.com/1/statuses/user_timeline.xml?screen_name=sinhagaurav010
    
        [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#pragma -
#pragma functionfortwitterrequest
-(void)funcTwitterReq
{
    
    tr = [[TwitterRequest alloc] init];    
    NSURL *url = [NSURL URLWithString:@"http://api.twitter.com/1/statuses/user_timeline.xml?screen_name=sinhagaurav010"];
    [tr friends_timeline:self requestSelector:@selector(public_timeline_callback:) forUrl:url];
    

}
-(void)clickToTwit
{
	TwitterRushViewController *TwitterRushController = [[TwitterRushViewController alloc] init];
	[self.navigationController pushViewController:TwitterRushController animated:YES];
	[TwitterRushController release];
}


#pragma -
#pragma public_timeLine

-(void)public_timeline_callback:(NSData *)data
{NSLog(@"paops");
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Click To Tweet" style:UIBarButtonItemStylePlain target:self action:@selector(clickToTwit)];          
	self.navigationItem.rightBarButtonItem = anotherButton;
	[anotherButton release];
	
     NSString *string = [[NSString alloc]initWithData:data encoding:NSASCIIStringEncoding];
     NSLog(@"%@",string);
    XMLParser *parser = [XMLParser new];
    
    root = [parser parseXMLFromData:data];

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
    //	
    //	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    //	
    //	if (nil == cell) {
    //        NSLog(@"cf");
    static NSString *CellIdentifier = @"ExampleCell";
    
    ExampleCell *cell = (ExampleCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[ExampleCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
        //cell.detailTextLabel.textAlignment = UITextAlignmentCenter;
    }
    
    
    TreeNode *child = [[root children] objectAtIndex:[indexPath row]];
    
    TreeNode *childText = [[child children] objectAtIndex:2];
    if(childText.hasLeafValue)
        [cell setTitle:childText.leafvalue];
    
    
    TreeNode *childUses = [[child children] objectAtIndex:11];
    
    TreeNode *childchildImage = [[childUses children] objectAtIndex:5];
    
    [cell setFlickrPhoto:childchildImage.leafvalue];

	return cell;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
