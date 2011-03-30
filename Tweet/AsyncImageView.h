//
//  AsyncImageView.h
//  TwitterToTwit
//
//  Created by gaurav sinha on 24/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AsyncImageView : UIView {
    NSURLConnection* connection; //keep a reference to the connection so we can cancel download in dealloc
	NSMutableData* data; 
}
- (void)loadImageFromURL:(NSURL*)url;
-(UIImage*) image;
@end
