    //
//  WebbrowserViewController.m
//  Tabwebbrowser
//
//  Created by Vinsol on 24/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "WebbrowserViewController.h"
#import "DetectNetworkConnection.h"

@implementation WebbrowserViewController

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
-(void)viewDidLoad 
{
	dict_web = [NSMutableDictionary new];
	self.navigationItem.title  =  @"Web Browser";
	 frameOfScroll			=	CGRectMake(0,91,2000, 47);
	scroll_view.contentSize	=	frameOfScroll.size;
	scroll_view.scrollEnabled = NO;
	
	BOOL isNetwrkAvl         =   [DetectNetworkConnection  isNetworkConnectionActive];
	if(isNetwrkAvl == 0)
	{
		UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Info" message:@"Net connection not avail" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	    [alert show];
	    [alert release];
	}
	button_left.enabled = NO;
	button_Right.enabled = NO;
	
	scroll_view.backgroundColor = [UIColor grayColor];
	array_webView    = [NSMutableArray new];
  	array_butncls    = [NSMutableArray new];
	array_butnshow   = [NSMutableArray  new];
	array_imageView  = [NSMutableArray new];
	array_searchBar = [NSMutableArray new];
	array_backButton  = [NSMutableArray new];
	array_forwardbutton = [NSMutableArray new];
	array_refreshbutton = [NSMutableArray new];
	
	_numOfWeb  = 0;
	
	imageView1   = [[UIImageView  alloc]initWithFrame:CGRectMake(0, 2, 215, frameOfScroll.size.height)];
	imageView1.image	=  [UIImage imageNamed:@"cat_image.png"];
	[array_imageView addObject:imageView1];
	[scroll_view addSubview:imageView1];
    
	UIButton   *button_web  = [[UIButton alloc]initWithFrame:CGRectMake(30, 5, 135, frameOfScroll.size.height-5)];    
	//	NSString    *imageName						=	[[arrayOfDictionaryforvideo objectAtIndex:i]objectForKey:@"thumbnail"];
    //	[buttonForVideo setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
	//button_web.titleLabel.text  = @"www.google.com";
	[button_web setTitle:@"www.google.com"  forState:(UIControlState)UIControlStateNormal];
    [button_web setTitleColor:[UIColor blackColor] forState:(UIControlState)UIControlStateNormal ];
	button_web.tag  =  _numOfWeb;
    [button_web addTarget:self action:@selector(webviewshow:) forControlEvents:UIControlEventTouchUpInside];
	[array_butnshow addObject:button_web];
	[scroll_view addSubview:button_web];
	
	UIButton   *button_webclose  = [[UIButton alloc]initWithFrame:CGRectMake(12, 17, 15, 15)];
	button_webclose.backgroundColor  = [UIColor blackColor];
	button_webclose.tag = _numOfWeb;
	[button_webclose setBackgroundImage:[UIImage imageNamed: @"close_button.gif"] forState:UIControlStateNormal];
	[array_butncls addObject:button_webclose];
	[button_webclose addTarget:self action:@selector(webviewclosed:) forControlEvents:UIControlEventTouchUpInside];
	[scroll_view addSubview:button_webclose];
	
	_whichOneClicked  = 0;
	
	incX = 0;
	NSString *url = @"http://www.google.com";
	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
	[array_webView  addObject:webView];
	incinRbhtScrl = 0;
	incinLftscrl = 0;
	_numOfWeb++;
	webView.delegate = self;
	[array_backButton addObject:button_Back];
	[array_forwardbutton addObject:button_forward];
	[array_refreshbutton addObject:button_refresh];
	[array_searchBar addObject:search_Bar];
	[webView loadRequest:request];
    [super viewDidLoad];
}
-(IBAction)gotoscrollleft:(id)sender
{
	if(incinRbhtScrl>0)
	{
		 incinRbhtScrl -=175;
		[scroll_view setContentOffset:CGPointMake(incinRbhtScrl, 0) animated:YES];
	}
}
-(IBAction)gotoscrollright:(id)sender
{
	//NSLog(@"_numOfWeb_numOfWeb%d",incX);
	//NSLog(@"incinRbhtScrlincinRbhtScrl%d",incinRbhtScrl);
	if(incinRbhtScrl<incX-625)
	{
	incinRbhtScrl += 175;
	[scroll_view setContentOffset:CGPointMake(incinRbhtScrl , 0) animated:YES];
	}
}
-(IBAction)webviewclosed:(id)sender
{
	if([array_webView count]!=1)
	{
	NSLog(@"sender------%i",[sender tag]);
	incX = incX-175;
	NSLog(@"_whichOneClicked _whichOneClicked----->>>>>>>>>>>>>>>>>>>>>>>>>%i",_whichOneClicked);
	NSLog(@"_numofweb------>>>>>>>>>>>%i",_numOfWeb);
	
	UIImageView  *imgvw  = [array_imageView objectAtIndex:[sender tag]];
		BOOL _whichisAlpa = 0;
		if(imgvw.alpha == 1)
		{
			_whichisAlpa = 1;
		}
	[array_imageView removeObjectAtIndex:[sender tag]];
	
	[imgvw removeFromSuperview];
	int k;
	
	UIWebView *web_viw = 	[array_webView objectAtIndex:[sender tag]];
	[array_webView removeObjectAtIndex:[sender tag]];
	[web_viw removeFromSuperview];
	
	UIButton  *bckbtn  = [array_backButton objectAtIndex:[sender tag]];
	[bckbtn removeFromSuperview];
	[array_backButton removeObjectAtIndex:[sender tag]];

	if([sender tag] == [array_backButton count])
		k = [sender tag]-1;
	else
		k = [sender tag];
	bckbtn = [array_backButton objectAtIndex:k];
	if(_whichisAlpa == 1)
		bckbtn.hidden = NO;

	UIButton  *frdbtn  = [array_forwardbutton objectAtIndex:[sender tag]];
	[frdbtn removeFromSuperview];
	[array_forwardbutton removeObjectAtIndex:[sender tag]];

	if([sender tag] == [array_forwardbutton count])
		k = [sender tag]-1;
	else
		k = [sender tag];
	frdbtn  = [array_forwardbutton objectAtIndex:k];
	if(_whichisAlpa == 1)
		frdbtn.hidden = NO;
	
	
	UIButton  *refr  = [array_refreshbutton objectAtIndex:[sender tag]];
	[refr removeFromSuperview];
	[array_refreshbutton removeObjectAtIndex:[sender tag]];
	
	if([sender tag] == [array_refreshbutton count])
		k = [sender tag]-1;
	else
		k = [sender tag];
	frdbtn  = [array_refreshbutton objectAtIndex:k];
	if(_whichisAlpa == 1)
		frdbtn.hidden = NO;
	
	UISearchBar  *srchbar  = [array_searchBar objectAtIndex:[sender tag]];
	[srchbar removeFromSuperview];
	[array_searchBar removeObjectAtIndex:[sender tag]];
	
	if([sender tag] == [array_searchBar count])
		k = [sender tag]-1;
	else
		k = [sender tag];
	srchbar  = [array_searchBar objectAtIndex:k];
    if(_whichisAlpa == 1)
		srchbar.hidden = NO;
	
    if([sender tag] == [array_webView count])
		k = [sender tag]-1;
	else
		k = [sender tag];
	UIWebView *web_viw1 = 	[array_webView objectAtIndex:k];
	if(_whichisAlpa == 1)
		web_viw1.hidden = NO;
	
		
	NSLog(@"_numofweb%i",_numOfWeb);
		if([sender tag] == [array_imageView count])
		{
			NSLog(@"ififiififi");
			k = [sender tag]-1;
			_whichOneClicked = [sender tag]-1;
		}
		else
		{
			k = [sender tag];
			_whichOneClicked = [sender tag];
		}
		UIImageView *imagvw = 	[array_imageView objectAtIndex:k];
		if(_whichisAlpa == 1)
			imagvw.alpha = 1;
		
	for(int i = [sender tag];i<[array_imageView count];i++)
	{
		
		UIImageView  *imgvw  = [array_imageView objectAtIndex:i];
			if(i == [sender tag])
			{
			if(_whichisAlpa == 1)
					imgvw.alpha = 1;
			}
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:.2];
		CGRect frme = [imgvw frame];
		frme.origin.x -= 175; 
		imgvw.frame = frme;
		[UIView commitAnimations];
	}
				
	UIButton *bttncls  = [array_butncls objectAtIndex:[sender tag]];
	[bttncls removeFromSuperview];
	[array_butncls removeObjectAtIndex:[sender tag]];
	for(int i = [sender tag];i<[array_butncls count];i++)
	{
		UIButton  *bttncls  = [array_butncls objectAtIndex:i];
		//NSLog(@"tagtagatgatag----%i",bttncls.tag);
		bttncls.tag--;
		//NSLog(@"tagtagatgatag----%i",bttncls.tag);
		if(i == [sender tag])
			if(_whichisAlpa == 1)
				bttncls.hidden = NO;
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:.2];
		CGRect frme = [bttncls frame];
		frme.origin.x -= 175; 
		bttncls.frame = frme;
		[UIView commitAnimations];
	}
	
	UIButton  *bttnshw  = [array_butnshow objectAtIndex:[sender tag]];
	[bttnshw removeFromSuperview];
	[array_butnshow removeObjectAtIndex:[sender tag]];
	for(int i = [sender tag];i<[array_butnshow count];i++)
	{
		
		UIButton  *bttncls  = [array_butnshow objectAtIndex:i];
		//bttncls.tag -= 1;
		bttncls.tag--;
		if(i == [sender tag])
			if(_whichisAlpa == 1)
				bttncls.hidden = NO;
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:.2];
		CGRect frme = [bttncls frame];
		
		
		frme.origin.x -= 175; 
		bttncls.frame = frme;
		[UIView commitAnimations];
	}
	_numOfWeb--;
	}
	
}
-(void)ViewinLandscape
{
	CGRect fram = CGRectMake(987, 43, 12, 47);
	button_Right.frame = fram;
	
	fram = CGRectMake(15, 43, 971, 47);
	scroll_view.frame = fram;
	
	fram = [button_Add frame];
	fram.origin.x = 998;
	fram.origin.y = 53;
	button_Add.frame = fram;
	
	fram.size.width = 924;
	for(int i = 0;i<[array_searchBar count];i++)
	{
		UISearchBar *srch_Bar = [array_searchBar objectAtIndex:i] ;
		fram = [srch_Bar frame];
		fram.size.width = 924;
	    srch_Bar.frame = fram; 
	}
	for(int i = 0;i<[array_webView count];i++)
	{
		UIWebView *webview = [array_webView objectAtIndex:i] ;
		fram = [webview frame];
		fram.size.width = 1024;
		fram.size.height = 612;
	    webview.frame = fram; 
	}
}

-(void)ViewinPortrait
{
	CGRect fram = CGRectMake(736, 44, 12, 47);
	button_Right.frame = fram;
	
	fram = CGRectMake(15, 43, 721, 47);
	
	scroll_view.frame = fram;
	
	fram = [button_Add frame];
	fram.origin.x = 744;
	fram.origin.y = 53;
	button_Add.frame = fram;
	
	//fram.size.width = 924;
	for(int i = 0;i<[array_searchBar count];i++)
	{
		UISearchBar *srch_Bar = [array_searchBar objectAtIndex:i] ;
		fram = [srch_Bar frame];
		fram.size.width = 668;
	    srch_Bar.frame = fram; 
	}
	NSLog(@"dcdc");
	for(int i = 0;i<[array_webView count];i++)
	{
		NSLog(@"dcdc");

		UIWebView *webview = [array_webView objectAtIndex:i] ;
		fram = [webview frame];
		fram.size.width = 768;
		fram.size.height = 868;
	    webview.frame = fram; 
	}
	
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
	if ((interfaceOrientation == UIInterfaceOrientationLandscapeLeft) || (interfaceOrientation == UIInterfaceOrientationLandscapeRight))
	{
		landmode=1;
		portrMode=0;
		[self ViewinLandscape];
		
	}
	else 
	{
		landmode=0;
		portrMode=1;
		[self ViewinPortrait];
		
	}
	
    return YES;
	
	//  return YES;
}
/*
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType
{
	NSLog(@"request----->>%@",[[request URL] absoluteString] );
	[dict_web setObject:[[request URL] absoluteString] forKey:webView];
	//UIButton *button_web = [array_butnshow objectAtIndex:_whichOneClicked];
	//	NSString *string     = [@"www." stringByAppendingString:searchBar.text];
	//[button_web setTitle:[[request URL] absoluteString]  forState:(UIControlState)UIControlStateNormal];
}
*/
-(IBAction)webviewshow:(id)sender
{
	_whichOneClicked = [sender tag];
	NSLog(@"sender-----%i",[sender tag]);
	for(int i=0;i<[array_imageView count];i++)
	{
		UIImageView  *imgvw  = [array_imageView objectAtIndex:i];

		if(i!=[sender tag])
		{
		imgvw.alpha  = 0.5;
		}
		else 
		{
			imgvw.alpha = 1;
		}

	}
	for(int i=0;i<[array_webView count];i++)
	{
		UIWebView  *imgvw  = [array_webView objectAtIndex:i];
		if(i!=[sender tag])
		{
			imgvw.hidden = YES;
		}
		else
		{
			imgvw.hidden = NO;
		}
	}
	for(int i=0;i<[array_backButton count];i++)
	{
		UIButton  *back  = [array_backButton objectAtIndex:i];
		UIButton  *frwd  = [array_forwardbutton objectAtIndex:i];
        UIButton  *refrsh = [array_refreshbutton objectAtIndex:i];
		UISearchBar *serhbar = [array_searchBar objectAtIndex:i];
		
		if(i!=[sender tag])
		{
			back.hidden = YES;
			frwd.hidden = YES;
			refrsh.hidden = YES;
			serhbar.hidden = YES;
		}
		else
		{
			back.hidden = NO;
			frwd.hidden = NO;
			refrsh.hidden = NO;
			serhbar.hidden = NO;

		}
	}	
}

////////////Search button of search bar is clicked 
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar                    // called when keyboard search button pressed
{
	searchBar = [array_searchBar objectAtIndex:_whichOneClicked];
	if(searchBar.text)
	{
	    NSString *url = [@"http://" stringByAppendingString: searchBar.text];
		NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
	    UIWebView  *imgvw  = [array_webView objectAtIndex:_whichOneClicked];
		//clicked_One = _whichOneClicked;
		
		UIButton *button_web = [array_butnshow objectAtIndex:_whichOneClicked];
	    //	NSString *string     = [@"www." stringByAppendingString:searchBar.text];
		[button_web setTitle:searchBar.text  forState:(UIControlState)UIControlStateNormal];
	    [imgvw loadRequest:request];
	}
	else {}
}
////////////////////////////////////////////////////////
/*
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
	NSLog(@"dcdsc)");
	//NSLog(@"	[dict_web setObject:[[request URL] absoluteString] forKey:webView];",	[dict_web objectForKey:webView4]);
	if(search_Bar.text){
		
	UIButton *button_web = [array_butnshow objectAtIndex:_whichOneClicked];
	NSString *string     = [@"www." stringByAppendingString:search_Bar.text];
	[button_web setTitle:string  forState:(UIControlState)UIControlStateNormal];
	}
}*/
///////////////////////////////////
///////To add new tab 
-(IBAction)Addnew:(id)sender
{
	if (_numOfWeb == 10) 
	{
		UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Info" message:@"Maximum 10 windows" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	    [alert show];
		[alert release];
	}
	
	else 
	{
		//[scroll_view setContentOffset:CGPointMake(incX , 0) animated:YES];

		for(int i=0;i<[array_searchBar count];i++)
		{
			UISearchBar *serchbar = [array_searchBar objectAtIndex:i];
			serchbar.hidden = YES;
		}
		UISearchBar *search_bar;
        if(portrMode == 1)
		search_bar  =  [[UISearchBar alloc]initWithFrame:CGRectMake(104, 0,668 , 44)];
		else 
		{
			search_bar  =  [[UISearchBar alloc]initWithFrame:CGRectMake(104, 0,924 , 44)];
		}

		search_bar.delegate = self;
		[array_searchBar addObject:search_bar];
		[self.view addSubview:search_bar];
		
		for(int i=0;i<[array_backButton count];i++)
		{
			UIButton *backbtn = [array_backButton objectAtIndex:i];
			backbtn.hidden = YES;
		}
		
		UIButton *backbtn1  =  [[UIButton alloc]initWithFrame:CGRectMake(0,0,37 ,45)];
		//search_bar.delegate = self;
		backbtn1.tag = _numOfWeb;
		[backbtn1 setBackgroundImage:[UIImage imageNamed: @"backbutton.gif"] forState:UIControlStateNormal];
		[array_backButton addObject:backbtn1];
		[self.view addSubview:backbtn1];
		
		for(int i=0;i<[array_forwardbutton count];i++)
		{
			UIButton *backbtn = [array_forwardbutton objectAtIndex:i];
			backbtn.hidden = YES;
		}
		UIButton *frwd_button  =  [[UIButton alloc]initWithFrame:CGRectMake(36,0,37 ,45)];
		//search_bar.delegate = self;
		frwd_button.tag = _numOfWeb;
		[frwd_button setBackgroundImage:[UIImage imageNamed: @"frbtn.gif"] forState:UIControlStateNormal];
		[array_forwardbutton addObject:frwd_button];
		[self.view addSubview:frwd_button];
		
		for(int i=0;i<[array_refreshbutton count];i++)
		{
			UIButton *backbtn = [array_refreshbutton objectAtIndex:i];
			backbtn.hidden = YES;
		}
		UIButton *refreshbutton  =  [[UIButton alloc]initWithFrame:CGRectMake(72,0,33 ,44)];
		//search_bar.delegate = self;
		refreshbutton.tag = _numOfWeb;
		[refreshbutton setBackgroundImage:[UIImage imageNamed: @"refresh.gif"] forState:UIControlStateNormal];
		[array_refreshbutton addObject:refreshbutton];
		[self.view addSubview:refreshbutton];
	
		if(landmode == 0)
	    webView1   = [[UIWebView  alloc] initWithFrame:CGRectMake(0, 92, 768,868 )];
		else {
			webView1   = [[UIWebView  alloc] initWithFrame:CGRectMake(0, 92, 1024,612 )];

		}

	    [backbtn1 addTarget:webView1
					 action:@selector(goBack)
		   forControlEvents:UIControlEventTouchDown];
	
	    [frwd_button addTarget:webView1
					action:@selector(goForward)
		  forControlEvents:UIControlEventTouchDown];
	
	   [refreshbutton addTarget:webView1
					action:@selector(reload)
		  forControlEvents:UIControlEventTouchDown];
	
	if(incX>350)
	{
		button_left.enabled = YES;
		button_Right.enabled = YES;
		//[scroll_view setContentOffset:CGPointMake(incX-345, 0)];
    }
	_whichOneClicked = _numOfWeb;
		webView1.delegate = self;
	NSString *url = @"http://www.google.com";
	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
	[webView1 loadRequest:request];
	//webView.hidden  = YES;
	//	[[NSUserDefaults alloc]ob]
	
	for(int i=0;i<[array_webView count];i++)
	{
		UIWebView  *imgvw  = [array_webView objectAtIndex:i];
		imgvw.hidden = YES;
	}
	[array_webView  addObject:webView1];
	
	[self.view addSubview:webView1];
	for(int i=0;i<[array_imageView count];i++)
	{
		UIImageView  *imgvw  = [array_imageView objectAtIndex:i];
		imgvw.alpha  = 0.5;
	}
	
	UIImageView  *imageView   = [[UIImageView  alloc]initWithFrame:CGRectMake(175+incX, 2, 215, frameOfScroll.size.height)];
	imageView.image	=  [UIImage imageNamed:@"cat_image.png"];
	[array_imageView addObject:imageView];
	[scroll_view addSubview:imageView];
		
	UIButton   *button_web  = [[UIButton alloc]initWithFrame:CGRectMake(205+incX, 5, 135, frameOfScroll.size.height-5)];    
	[button_web setTitle:@"www.google.com"  forState:(UIControlState)UIControlStateNormal];
    [button_web setTitleColor:[UIColor blackColor] forState:(UIControlState)UIControlStateNormal ];
	 button_web.tag = _numOfWeb;
    [button_web addTarget:self action:@selector(webviewshow:) forControlEvents:UIControlEventTouchUpInside];
	[array_butnshow addObject:button_web];
	[scroll_view addSubview:button_web];
	
	UIButton   *button_webclose  = [[UIButton alloc]initWithFrame:CGRectMake(187+incX, 17, 15, 15)];
	button_webclose.backgroundColor  = [UIColor blackColor];
	button_webclose.tag = _numOfWeb  ;
	[button_webclose setBackgroundImage:[UIImage imageNamed: @"close_button.gif"] forState:UIControlStateNormal];
	[array_butncls addObject:button_webclose];
	[button_webclose addTarget:self action:@selector(webviewclosed:) forControlEvents:UIControlEventTouchUpInside];
	[scroll_view addSubview:button_webclose];
	/////////////To dealloc the all the allocated objects
		if(search_bar)
		{
			NSLog(@"search_barsearch_bar");
		    [search_bar release];
			search_bar = nil;
		}if(backbtn1)
		{
			NSLog(@"backbtn1backbtn1");

		    [backbtn1 release];
			backbtn1 = nil;
		}if(frwd_button)
		{
			NSLog(@"frwd_buttonfrwd_button");

		    [frwd_button release];
			frwd_button = nil;
		}if(refreshbutton)
		{
			NSLog(@"refreshbutton");

		    [refreshbutton release];
			refreshbutton = nil;
		}if(imageView)
		{
			NSLog(@"imageView");

		    [imageView release];
			imageView = nil;
		}
		if(button_web)
		{
		    [button_web release];
			button_web = nil;
		}
		if(button_webclose)
		{
		    [button_webclose release];
			button_webclose = nil;
		}
		_numOfWeb++;
	incX  += 175;
	}
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
	if(search_Bar)
	{
	[search_Bar  release];
		search_Bar = nil;
	}
	if(webView)
	{
		[webView  release];
		webView = nil;
	}
	if(imageView1)
	{
		[imageView1  release];
		imageView1 = nil;
	}
	if(button_left)
	{
		[button_left  release];
		button_left = nil;
	}
	if(button_Right)
	{
		[button_Right  release];
		button_Right = nil;
	}
	if(button_Go)
	{
		[button_Go  release];
		button_Go = nil;
	}
	
	if(button_Back)
	{
		[button_Back  release];
		button_Back = nil;
	}
	if(button_forward)
	{
		[button_forward  release];
		button_forward = nil;
	}
	if(button_refresh)
	{
		[button_refresh  release];
		button_refresh = nil;
	}
	if(button_Add)
	{
		[button_Add  release];
		button_Add = nil;
	}
	if(scroll_view)
	{
		[scroll_view  release];
		scroll_view = nil;
	}
	if(webView1)
	{
		[webView1  release];
		webView1 = nil;
	}
	if(array_webView)
	{
		[array_webView  release];
		array_webView = nil;
	}
	if(array_butncls)
	{
		[array_butncls  release];
		array_butncls = nil;
	}
	
	if(array_butnshow)
	{
		[array_butnshow  release];
		array_butnshow = nil;
	}
	
	if(array_imageView)
	{
		[array_imageView  release];
		array_imageView = nil;
	}
	if(array_searchBar)
	{
		[array_searchBar  release];
		array_searchBar = nil;
	}
	if(array_backButton)
	{
		[array_backButton  release];
		array_backButton = nil;
	}
	if(array_forwardbutton)
	{
		[array_forwardbutton  release];
		array_forwardbutton = nil;
	}
	
	if(array_refreshbutton)
	{
		[array_refreshbutton  release];
		array_refreshbutton = nil;
	}
	
	
    [super dealloc];
}


@end
