//
//  TwitterRushViewController.m
//  TwitterRush
//  Company VINSOL
// Email:gaurav.sinha@vinsol.com

#import "TwitterRushViewController.h"
#import "SA_OAuthTwitterEngine.h"
#define kScreenWidth 320
#define kScreenHeight 460

/* Define the constants below with the Twitter 
   Key and Secret for your application. Create
   Twitter OAuth credentials by registering your
   application as an OAuth Client here: http://twitter.com/apps/new
 */

#define kOAuthConsumerKey				@"CSJN8GrCXJZMse5PP1bfpw"							//REPLACE With Twitter App OAuth Key  
#define kOAuthConsumerSecret			@"MVwwULmejhHmugf4mKii52mRORT3UJ6sILUllT5zeKY"		//REPLACE With Twitter App OAuth Secret

@implementation TwitterRushViewController

@synthesize tweetTextField,msgString; 

#pragma mark Custom Methods

-(void)sendTweet
{
	spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	[spinner setCenter:CGPointMake(kScreenWidth/2.0, kScreenHeight/2.0)]; // I do this because I'm in landscape mode
	[self.view addSubview:spinner]; // spinner is not visible until started
	[spinner startAnimating];
		//Dismiss Keyboard
	[tweetTextField resignFirstResponder];
	//Twitter Integration Code Goes Here
	[_engine sendUpdate:tweetTextField.text];
	[self.navigationController dismissModalViewControllerAnimated:YES];
}

#pragma mark ViewController Lifecycle

-(void)viewDidLoad{
	
	if(!_engine){
		_engine = [[SA_OAuthTwitterEngine alloc] initOAuthWithDelegate:self];
		_engine.consumerKey    = kOAuthConsumerKey;
		_engine.consumerSecret = kOAuthConsumerSecret;	
	}
	UIViewController *controller = [SA_OAuthTwitterController controllerToEnterCredentialsWithTwitterEngine:_engine delegate:self];
	
	self.navigationItem.title = @"Share";
	tweetTextField.text = msgString;
	[tweetTextField becomeFirstResponder];
		
	if ([[NSUserDefaults standardUserDefaults] objectForKey: @"authData2"]) 
    {
        NSLog(@"----->>>>%@ %@",[_engine username],[NSDate date]);
        NSLog(@"---->>>>>%@",[_engine getUserTimelineFor:[_engine username] since:[NSDate date] count:20]);
        UIBarButtonItem *sendButton = [[UIBarButtonItem alloc]initWithTitle:@"Send" style:UIBarButtonItemStyleBordered target:self action:@selector(sendTweet)];
		self.navigationItem.rightBarButtonItem = sendButton;
	}
	else {
		UIBarButtonItem *loginButton = [[UIBarButtonItem alloc]initWithTitle:@"Login to Twitter" style:UIBarButtonItemStyleBordered target:self action:@selector(login)];
		self.navigationItem.rightBarButtonItem = loginButton;
	}

	//UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc]initWithTitle:@"cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelButton)];
	//	self.navigationItem.rightBarButtonItem = cancelButton;

	textLengthLabel.text = [NSString stringWithFormat:@"%i",msgString.length];
	[super viewDidLoad];	
	
}

-(void)login{
	
	if(!_engine)
    {
		_engine = [[SA_OAuthTwitterEngine alloc] initOAuthWithDelegate:self];
		_engine.consumerKey    = kOAuthConsumerKey;
		_engine.consumerSecret = kOAuthConsumerSecret;	
	}
	
	//UIViewController *controller = [[UIViewController alloc]init];
	UIViewController *controller = [SA_OAuthTwitterController controllerToEnterCredentialsWithTwitterEngine:_engine delegate:self];
	//[self presentModalViewController: controller animated: YES];
	if (controller){
	[self presentModalViewController: controller animated: YES];
	}
		if (!controller) 
        {
			spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
			[spinner setCenter:CGPointMake(kScreenWidth/2.0, kScreenHeight/2.0)]; // I do this because I'm in landscape mode
			[self.view addSubview:spinner]; // spinner is not visible until started
			[spinner startAnimating];
		//Twitter Integration Code Goes Here
		[_engine sendUpdate:tweetTextField.text];
		[self.navigationController dismissModalViewControllerAnimated:YES];
	}
	
	
}

/////////////////////////////////
-(void)cancelButton
{	
	[self.navigationController dismissModalViewControllerAnimated:YES];
}



- (void)viewDidUnload {	
	
}


- (void)textViewDidChange:(UITextView *)textView
{
	if (textView.text.length <= 140) {
			textLengthLabel.text = [NSString stringWithFormat:@"%i",textView.text.length];
			self.msgString = textView.text;
	}else{
		 textView.text = self.msgString;
				
	}
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
	[_engine release];
	[tweetTextField release];
    [super dealloc];
}

//=============================================================================================================================
#pragma mark SA_OAuthTwitterEngineDelegate
- (void) storeCachedTwitterOAuthData: (NSString *) data forUsername: (NSString *) username {
	NSUserDefaults			*defaults = [NSUserDefaults standardUserDefaults];
	[defaults setObject: data forKey: @"authData2"];
	[defaults synchronize];
	
	//[self updateTwitter];
	UIBarButtonItem *sendButton = [[UIBarButtonItem alloc]initWithTitle:@"Send" style:UIBarButtonItemStyleBordered target:self action:@selector(sendTweet)];
	self.navigationItem.leftBarButtonItem = sendButton;	
}

- (NSString *) cachedTwitterOAuthDataForUsername: (NSString *) username {
	return [[NSUserDefaults standardUserDefaults] objectForKey: @"authData2"];
}

//=============================================================================================================================
#pragma mark TwitterEngineDelegate
- (void) requestSucceeded: (NSString *) requestIdentifier {
   // NSLog(@"NSSteing%@",requestIdentifier);
	if([spinner isAnimating])
	[spinner stopAnimating];
   
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Succeeded" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert show];
	[alert release];
    
	NSLog(@"Request %@ succeeded", requestIdentifier);
}

- (void) requestFailed: (NSString *) requestIdentifier withError: (NSError *) error {
	if([spinner isAnimating])
	[spinner stopAnimating];
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Succeeded" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert show];
	[alert release];
	NSLog(@"Request %@ failed with error: %@", requestIdentifier, error);
}
@end
