    //
//  FullViewController.m
//  Photoprj
//
//  Created by gaurav sinha on 03/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "FullViewController.h"
#import "Global.h"
#import "GPSViewController.h"
#import "YouTubeController.h"
#import "FacebookViewController.h"
#import "RootViewController.h"
//#import "SessionViewController.h"
//#import "DemoAppViewController.h"

//s#import "FbookViewCntrller.h"

@implementation FullViewController

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
-(IBAction)BackButtonClick:(id)sender
{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1];
	//if(LOGFLAG==1)
	//NSLog(@"timer startedViewtoDownupdateCounter");
	_chckZoom = 0;
	//frameOfAnimation						=   CGRectMake(0, -60, 768, 45);
	//viewForPages.frame							=  frameOfAnimation;
	[image_grp removeFromSuperview];
	[image_grp1 removeFromSuperview];
	[image_grp release];
	[image_grp1 release];
	view1.userInteractionEnabled = YES;
	[scrll removeFromSuperview];
	[scrll release];

	CGRect frame;
	
	if(landmode == 0 )
		frame = CGRectMake(26,105 , 364, 480);
	else 
	{
		frame = CGRectMake(26,105 , 620, 480 );
	}
	
	view1.frame = frame;
	[UIView commitAnimations];
	[self.navigationController setNavigationBarHidden:YES];

	
}
- (void)viewDidLoad 
{
	[self.navigationController setNavigationBarHidden:YES];
	web_view.backgroundColor = [UIColor clearColor];
	_chckZoom = 0;
	_inZoom= 0;
	
	/*for(int i=0;i<[array_Global count];i++)
		NSLog(@"[array global-->]%@",[array_Global objectAtIndex:i]);*/
	label.text = @"a vida potuguesa";
	label.font = [UIFont boldSystemFontOfSize:50.0f];
	UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStylePlain target:self action:@selector(doneButtonClick:)];          
	self.navigationItem.rightBarButtonItem = anotherButton;
	
	UIBarButtonItem *anotherButtonforleft = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(BackButtonClick:)];          
	self.navigationItem.leftBarButtonItem = anotherButtonforleft;
	
	if(anotherButtonforleft)
	{
		[anotherButtonforleft release];
		anotherButtonforleft = nil;
	}
	
	if(anotherButton)
	{
		[anotherButton release];
		anotherButton  = nil;
	}
	
	
	NSString   *html	=	[NSString stringWithFormat:@"<html><head></head><body>"];
	/*[myWebfrGV setBackgroundColor:[UIColor clearColor]];
	[myWebfrUN setBackgroundColor:[UIColor clearColor]];
	[myWebfrGV setOpaque:YES];
	*/
	NSString  *strngfrGV					=	[NSString new];  
	NSString *tempStr						=	@"A Vida Portuguesa is a gorgeously styled emporium of artisanal Portuguese products, from soap to nuts. Quem o diz não somos nós, é a   Style Magazine do New York Times, que veio à descoberta de um Porto mais charmoso e mais vibrante. Escreve Andrew Ferren: Bustling with commerce, the design-savvy city of Porto, Portugal, plays a convincing Milan to Lisbon’s Rome. (Its pristine beaches, 10 minutes from downtown, give it a touch of Malibu, too.) And suddenly the city’s long-neglected downtown — with its vertiginous hills and elegant spires towering over the Douro River — is all the rage again. Sleek new galleries, restaurants and boutiques have the old cobblestone streets buzzing anew.";
	//NSString *mater							=	[NSString stringWithFormat:@"<font size=\"3\"><p>%@</font>",tempStr,nil];
	NSString*strng							=	[NSString new];
	strng									=	@"</body></html>";
	/*NSString *strImageUN					=	[NSString new];
	strImageUN								=	@"<CENTER><img src=";
	strImageUN								=	[strImageUN stringByAppendingFormat:@"ovel-top.png"];
	strImageUN								=	[strImageUN stringByAppendingFormat:@"></CENTER>"];
	*/
	
	strngfrGV								=	[html stringByAppendingString:tempStr] ;
	strngfrGV								=	[strngfrGV stringByAppendingString:strng] ;
	NSString *path							=   [[NSBundle mainBundle] bundlePath];
	NSURL *baseURL							=   [NSURL fileURLWithPath:path];
	[web_view loadHTMLString:strngfrGV baseURL:baseURL];

	if(_FromPhotoViewContrller == 1)
	{
	image_view.image = [UIImage imageNamed:[array_Global objectAtIndex:_whichButonClicked]];
		str_facbk_image =[array_Global objectAtIndex:_whichButonClicked];
	}
	else {
		image_view.image = [UIImage imageNamed:[array_Global_Different objectAtIndex:_whichButonClicked]];
		str_facbk_image =[array_Global_Different objectAtIndex:_whichButonClicked];

	}

	text_title.userInteractionEnabled = NO;
	frame_web		= [web_view frame];
	frame_image		= [image_view frame];
	frame_text		= [text_title frame];
	frame_label		= [label frame];
	frame_home		= [button_home frame];
	frame_face		= [button_faceBook frame];
	frame_you		= [button_You frame];
	frame_gps		= [button_gps frame];
    frame_eng		= [button_england frame];
	frame_port		= [button_portugal frame];
	frame_email		= [label_email frame];
	frame_email_val = [label_email_value frame];
	frame_fax		= [label_fax frame];
	frame_fax_val	= [label_fax_value frame];
	frame_tel		= [label_address frame];
	frame_tele_val	= [label_address_value frame];
	//frame_label_val = [label_value frame];
	[super viewDidLoad];
}

-(IBAction)doneButtonClick:(id)sender
{
	[self.navigationController popToRootViewControllerAnimated:YES];

}
-(void)viewWillAppear:(BOOL)animated
{
	[self.navigationController setNavigationBarHidden:YES];
	[self.navigationController  setToolbarHidden:YES];
}

-(IBAction)clickForFacebokk:(id)sender
{
	RootViewController *obj = [RootViewController new];
	[self.navigationController setNavigationBarHidden:NO];
	[self.navigationController setToolbarHidden:NO];
	[self.navigationController pushViewController:obj animated:YES];
	if(obj)
	{
		[obj  release];
		obj = nil;
	}
}
/////////////////////////////////////////////////////
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event 
{
	UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(panViewWithGestureRecognizer:)];
	[view1 addGestureRecognizer:recognizer];
    recognizer.delegate = self;
	[recognizer release];	
}

-(IBAction)updateCounter
{
	//for(int i=0;i<[array_Global])
}
- (void)panViewWithGestureRecognizer:(UITapGestureRecognizer *)gestureRecognizer
{   
	//if(_inZoom == 0)
	//{
		[self.navigationController setNavigationBarHidden:NO];
		view1.userInteractionEnabled = NO;
		_chckZoom = 1;
		_inZoom = 1;
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:1];
		
		CGRect frame;
		if(landmode == 0)
		{
		    
			frame = CGRectMake(0,0 , 768, 874);
			//view1.frame = frame;
			//image_view.frame = CGRectMake(0, 0, 768, 874);
			
			scrll = [[UIScrollView alloc]initWithFrame:CGRectMake(40, 0, 688, 1004)];
			scrll.contentSize = CGSizeMake([array_Global count]*688, 100);
			scrll.backgroundColor = [UIColor  blackColor];
		    
			//NSLog(@"2222");
			
			image_grp = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 1004)];
			[image_grp setBackgroundImage:[UIImage imageNamed:@"bachward_button.png"] forState:(UIControlState)UIControlStateNormal];
			[image_grp addTarget:self action:@selector(homeButtonClicktoenter:) forControlEvents:UIControlEventTouchUpInside ];
			[self.view addSubview:image_grp ];
			
			image_grp1 = [[UIButton alloc]initWithFrame:CGRectMake(728, 0, 40, 1004)];
			[image_grp1 setBackgroundImage:[UIImage imageNamed:@"forward_button.png"] forState:(UIControlState)UIControlStateNormal];
			[image_grp1 addTarget:self action:@selector(homeButtonClicktoenter:) forControlEvents:UIControlEventTouchUpInside ];
			[self.view addSubview:image_grp1 ];
            
			int incX = 0;
			for(int i = 0;i<[array_Global count];i++)
			{
				/*UIButton *image_grp_ph = [[UIButton alloc]initWithFrame:CGRectMake(incX, 5, 728, 1004)];
				[image_grp_ph setBackgroundImage:[UIImage imageNamed:[array_Global objectAtIndex:i]] forState:(UIControlState)UIControlStateNormal];
				[image_grp_ph setTag:i];
				[image_grp_ph addTarget:self action:@selector(homeButtonClicktoenter:) forControlEvents:UIControlEventTouchUpInside ];
				
				incX += 710;
				[scrll addSubview:image_grp_ph];
				*/
				UIImageView *image_grp_ph   =  [[UIImageView  alloc]initWithFrame:CGRectMake(incX, 10, 678, 924)];
				image_grp_ph.image  =     [UIImage imageNamed:[array_Global objectAtIndex:i]];
				incX += 688;
				[scrll addSubview:image_grp_ph];
				if(image_grp_ph)
				{
					[image_grp_ph release];
					image_grp_ph = nil;
				}
			}
			scrll.backgroundColor = [UIColor blackColor];
			[self.view addSubview:scrll];
		}
		else 
		{
			frame = CGRectMake(0,0 , 1024, 638);
			view1.frame = frame;
			image_view.frame = CGRectMake(0, 0, 1024, 618);
			scrll = [[UIScrollView alloc]initWithFrame:CGRectMake(20, 618, 984, 100)];
			scrll.contentSize = CGSizeMake([array_Global count]*100, 100);

			int incX = 0;
		
			image_grp = [[UIButton alloc]initWithFrame:CGRectMake(0, 618, 20, 100)];
			[image_grp setBackgroundImage:[UIImage imageNamed:@"bachward_button.png"] forState:(UIControlState)UIControlStateNormal];
			[image_grp addTarget:self action:@selector(homeButtonClicktoenter:) forControlEvents:UIControlEventTouchUpInside ];
			[self.view addSubview:image_grp ];
			
			
			image_grp1 = [[UIButton alloc]initWithFrame:CGRectMake(1004, 618, 20, 100)];
			[image_grp1 setBackgroundImage:[UIImage imageNamed:@"forward_button.png"] forState:(UIControlState)UIControlStateNormal];
			[image_grp1 addTarget:self action:@selector(homeButtonClicktoenter:) forControlEvents:UIControlEventTouchUpInside ];
			[self.view addSubview:image_grp1 ];
			for(int i = 0;i<[array_Global count];i++)
			{
				UIButton *image_grp_ph = [[UIButton alloc]initWithFrame:CGRectMake(incX, 5, 90, 90)];
				[image_grp_ph setBackgroundImage:[UIImage imageNamed:[array_Global objectAtIndex:i]] forState:(UIControlState)UIControlStateNormal];
				[image_grp_ph setTag:i];
				[image_grp_ph addTarget:self action:@selector(homeButtonClicktoenter:) forControlEvents:UIControlEventTouchUpInside ];
				//image_grp.image = [UIImage imageNamed:[array_Global objectAtIndex:i]];
				incX += 100;
				[scrll addSubview:image_grp_ph];
				if(image_grp_ph)
				{
					[image_grp_ph release];
					image_grp_ph = nil;
				}
			}
			scrll.backgroundColor = [UIColor blackColor];
			[self.view addSubview:scrll];

		}

		view1.frame = frame;
		
		[UIView commitAnimations];
		//[NSTimer scheduledTimerWithTimeInterval:1.0f/20.0f target:self selector:@selector(updateCounter:) userInfo:nil repeats:YES];

	
         //	}
         //	else {

         //		_inZoom = 0;
	    //	_chckZoom = 0;
		/*[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:1];
		//if(LOGFLAG==1)
		//NSLog(@"timer startedViewtoDownupdateCounter");
		
		//frameOfAnimation						=   CGRectMake(0, -60, 768, 45);
		//viewForPages.frame							=  frameOfAnimation;
		[image_grp removeFromSuperview];
		[image_grp1 removeFromSuperview];
		[image_grp release];
		[image_grp1 release];
		[scrll removeFromSuperview];
		[scrll release];
		CGRect frame;
		if(landmode == 0 )
		 frame = CGRectMake(26,105 , 364, 480);
		else 
		{
			frame = CGRectMake(26,105 , 620, 480 );
		}

		view1.frame = frame;
		[UIView commitAnimations];
			*/	
	//}
}
///////////////////////////////////
-(IBAction)homeButtonClicktoenter:(id)sender
{
	image_view.image  = [UIImage imageNamed:[array_Global objectAtIndex:[sender tag]]];
}
////////////////////////////////////
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event 
{
	[self touchesBegan:touches withEvent:event];
}
////////////////////////////////////////////////////
-(IBAction)clicktogohome:(id)sender
{
	[self.navigationController setNavigationBarHidden:NO];
	[self.navigationController popViewControllerAnimated:YES];
}
-(IBAction)clicktoyoutube:(id)sender
{
	YouTubeController *obj = [YouTubeController new];
	[self.navigationController pushViewController:obj animated:YES];
	if(obj)
	{
		[obj release];
		obj = nil;
	}

}
-(IBAction)clickForGps:(id)sender
{
	GPSViewController  *obj = [GPSViewController new];
	[self.navigationController pushViewController:obj animated:YES];
	if(obj)
	{
		[obj  release];
		obj = nil;
	}
}
-(void)ViewinLandscape
{
	//NSLog(@"dscd");
	CGRect frame = CGRectMake(664, 140, 349, 370);
	web_view.frame = frame;
	
	frame = CGRectMake(950, 8, 40, 45);
	button_england.frame = frame;
	
	frame = CGRectMake(909, 12, 39, 38);
	button_portugal.frame = frame;
	
	//frame = CGRectMake(20,20 ,620 ,714);
	//frame.size.height = 500;
	//frame.size.width = 500;
	//image_view.frame = frame;
	frame = CGRectMake(20,20 , 620, 700);
	view1.frame = frame;
	
	frame = CGRectMake(664, 70, 200, 80);
	label.frame = frame;
	
	frame = CGRectMake(858, 697, 34, 37);
	button_home.frame = frame;
	 
	frame.origin.x = 895;
	button_gps.frame = frame;
	
	frame.origin.x = 937;
	button_You.frame = frame;
	
	frame.origin.x = 979;
	button_faceBook.frame = frame;
	
	frame = CGRectMake(663,629,123,37);// <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
	label_email.frame = frame;
	
	frame = CGRectMake(737,629,344,37);// <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
	label_email_value.frame = frame;
	
	frame = CGRectMake(663,574,128,37);// <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    label_address.frame = frame;
	
	frame = CGRectMake(794,574,344,37);// <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)

	label_address_value.frame = frame;
	
	frame = CGRectMake(663,602,123,37);// <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    label_fax.frame = frame;
	
	frame = CGRectMake(727,602,344,37);// <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
	label_fax_value.frame = frame;
	
	/*frame = CGRectMake(758,70,246,37);// <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
	label_value.frame = frame;*/
	
	label_Morada.frame = CGRectMake(663,545 , 128, 37);
	label_Morada_value.frame =  CGRectMake(754,545 , 246, 37);
	
	if(_chckZoom == 0)
	{
		CGRect  frame = CGRectMake(26,105 , 620, 480);
		view1.frame = frame;
		
	}
	else 
	{

		CGRect  frame = CGRectMake(0,0 , 1024, 638);
		view1.frame = frame;
		//scrll.frame = CGRectMake(20, 638, 984, 100);

		scrll.frame  =  CGRectMake(40, 0, 944, 768);

		image_grp.frame = CGRectMake(0, 0, 40, 748);
		image_grp1.frame = CGRectMake(984, 0, 40, 748);
	}
	//label
}

-(void)ViewinPortrait
{
	web_view.frame   =	frame_web    ;
	//image_view.frame = frame_image  ;
	text_title.frame =frame_text ;
	label.frame      = frame_label;
	button_home.frame = frame_home;
	button_faceBook.frame = frame_face ;
	button_You.frame = frame_you ;
	button_gps.frame = frame_gps;
	button_england.frame =  frame_eng;
 	button_portugal.frame = frame_port  ;
	label_email.frame =    frame_email;
	label_email_value.frame =  frame_email_val;
	label_fax.frame = frame_fax;
	label_fax_value.frame=frame_fax_val;
	label_address.frame=frame_tel;
	label_address_value.frame=frame_tele_val;
	label_Morada.frame = CGRectMake(404, 700, 128, 37);
	label_Morada_value.frame = CGRectMake(495, 700, 246, 37);
	// label_value.frame=frame_label_val;
	if(_chckZoom == 0)
	{
	CGRect  frame = CGRectMake(26,105 , 364, 480);
	view1.frame = frame;
		
	}
	else 
	{
		CGRect  frame = CGRectMake(0,0 , 768, 874);
		view1.frame = frame;
		scrll.frame  =  CGRectMake(40, 0, 688, 1004);

		image_grp.frame = CGRectMake(0, 0, 40, 1004);
		image_grp1.frame = CGRectMake(728, 0, 40, 1004);
		//scrll.frame = CGRectMake(20, 874, 728, 100);
		//image_grp.frame = CGRectMake(0, 874, 20, 100);
		//image_grp1.frame = CGRectMake(748, 874, 20, 100);
		
	}

	
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	if ((interfaceOrientation == UIInterfaceOrientationLandscapeLeft) || (interfaceOrientation == UIInterfaceOrientationLandscapeRight))
	{
		landmode_ph = 1;
		portrMode_ph = 0;
		landmode=1;
	
		NSLog(@"landscape");
		portrMode=0;
		[self ViewinLandscape];
		
	}
	else 
	{
		landmode=0;
		portrMode=1;
		landmode_ph = 0;
		portrMode_ph = 1;
		[self ViewinPortrait];
		
	}
    return YES;
}


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
