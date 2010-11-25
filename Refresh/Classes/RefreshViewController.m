//
//  RefreshViewController.m
//  Refresh
//
//  Created by Vinsol on 23/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "RefreshViewController.h"


@implementation RefreshViewController

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
	
	//NSLog(@"REloooooooooooooo");
	array_button   =   [NSMutableArray new];
	NSInteger incX   =  0;
	NSInteger  k   =0;
	NSInteger   incY   =  40;
	for(int i = 0;i<3;i++)
	{
		incX   =   10;
		for(int j = 0;j<3;j++)
		{
			NSLog(@"dcds");
			UIButton  *button_icon   =  [[UIButton alloc]initWithFrame:CGRectMake(incX, incY, 70, 80)];
			 //[button_icon  ]
			[button_icon addTarget:self action:@selector(clickToDisappear:) forControlEvents:UIControlEventTouchUpInside];
			[button_icon setTitle:[NSString stringWithFormat:@"%d",k]  forState:(UIControlState)UIControlStateNormal];
			//button_icon.font							= [UIFont boldSystemFontOfSize:25];
			button_icon.tag  =  k++;
			button_icon.backgroundColor   =  [UIColor   blackColor];
			[array_button    addObject:button_icon];
			[view_buttn  addSubview:button_icon ];
			/*if(button_icon)
			{
				[button_icon  release];
				button_icon   =   nil;
			}*/
			incX   +=80;  
		}
		incY   +=   90;
	}
	
    [super viewDidLoad];
}

- (IBAction) delete:(UIButton *) sender {
	
	//NSInteger index = [sender tag];
	
	NSInteger index = [array_button indexOfObject:sender];
	[array_button removeObject:sender];
	
	NSMutableDictionary *new_data = [[NSMutableDictionary alloc] init];
	
	[new_data setValue:[NSNumber numberWithInt:index] forKey:@"index"];
	[new_data setValue:[NSNumber numberWithFloat:[sender center].x] forKey:@"x"];
	[new_data setValue:[NSNumber numberWithFloat:[sender center].y] forKey:@"y"];
	
	[sender removeFromSuperview];
	
	[self performSelector:@selector(animateButtonAtIndex:) withObject:new_data];
}

- (void) animateButtonAtIndex:(NSDictionary *) data {
	
	SEL call;
	
	NSInteger index = [[data valueForKey:@"index"] intValue];
	CGPoint toMove = CGPointMake([[data valueForKey:@"x"] floatValue], [[data valueForKey:@"y"] floatValue]);
	
	CGPoint originalPoint = [[array_button objectAtIndex:index] center];
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.1f];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	{
		[[array_button objectAtIndex:index] setCenter:toMove];
	}
	[UIView commitAnimations];
	
	id obj;
	
	if (index < [array_button count]-1) {
		call = @selector(animateButtonAtIndex:);
		NSMutableDictionary *new_data = [[NSMutableDictionary alloc] init];
		[new_data setValue:[NSNumber numberWithInt:index+1] forKey:@"index"];
		[new_data setValue:[NSNumber numberWithFloat:originalPoint.x] forKey:@"x"];
		[new_data setValue:[NSNumber numberWithFloat:originalPoint.y] forKey:@"y"];
		
		obj = new_data;
	}
	else {
		call = @selector(animationDidFinish);
		obj = nil;
	}
	
	[self performSelector:call withObject:obj afterDelay:0.5];
}

- (void) animationDidFinish {
	NSLog(@"animation is done");
}

-(IBAction)clickToDisappear:(id)sender
{
    //  [self delete:sender];
	//return;
	
	UIButton  *buttonremove;
	buttonremove   =  [array_button objectAtIndex:[sender tag]];
	CGRect fram    =  [buttonremove frame];
	
	NSMutableArray  *arry_newbuttton    =  [NSMutableArray new];
	[buttonremove removeFromSuperview];
	
	for(int i=0;i<[sender tag];i++)
	{
		UIButton  *buttonremove1;
		buttonremove1   =  [array_button objectAtIndex:i];
		[arry_newbuttton   addObject:buttonremove1];
	}

	for(int i=[sender tag]+1; i<[array_button count]; i++)
	{
		UIButton *buttonremove1;
		buttonremove1 = [array_button objectAtIndex:i];
		//CGRect fram1;
		 [self callanim:fram:buttonremove1];
		
		buttonremove1.tag--;
		//CGRect fram    =  [buttonremove  frame];
		fram     =  fram1;
		[arry_newbuttton addObject:buttonremove1];
	}
	 array_button   =  [NSMutableArray new];
	 for(int i=0;i<[arry_newbuttton  count];i++)
		[array_button  addObject:[arry_newbuttton objectAtIndex:i]];
}
-(void)callanim:(CGRect) fram:(UIButton*)buttonremove1
{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:.2];
	//if(LOGFLAG==1)
	NSLog(@"timer startedViewtoDownupdateCounter");
	
	//frameOfAnimation						=   CGRectMake(0, -60, 768, 45);
	//viewForPages.frame							=  frameOfAnimation;	
	
	 fram1    =  [buttonremove1  frame];
	buttonremove1.frame   =  fram;
	[UIView commitAnimations];
//	return  fram1;

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
	[array_button   release];
    [super dealloc];
}


@end
