//
//  AsyncImageView.m
//  TwitterToTwit
//
//  Created by gaurav sinha on 24/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AsyncImageView.h"


@implementation AsyncImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (void)loadImageFromURL:(NSURL*)url {
    if (connection!=nil) { [connection release]; }
    if (data!=nil) { [data release]; }
    NSURLRequest  *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

- (void)connection:(NSURLConnection *)theConnection
    didReceiveData:(NSData *)incrementalData {
    if (data==nil) {
        data =
        [[NSMutableData alloc] initWithCapacity:2048];
    }
    [data appendData:incrementalData];
}

- (void)connectionDidFinishLoading:(NSURLConnection*)theConnection {
    
    [connection release];
    connection=nil;
    
    if ([[self subviews] count]>0) {
        [[[self subviews] objectAtIndex:0] removeFromSuperview];
    }
    
    UIImageView* imageView = [[[UIImageView alloc] initWithImage:[UIImage imageWithData:data]] autorelease];
    
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.autoresizingMask = ( UIViewAutoresizingFlexibleWidth || UIViewAutoresizingFlexibleHeight );
    
    [self addSubview:imageView];
    imageView.frame = self.bounds;
    [imageView setNeedsLayout];
    [self setNeedsLayout];
    [data release];
    data=nil;
}
- (UIImage*) image {
    UIImageView* iv = [[self subviews] objectAtIndex:0];
    
    return [iv image];
}


- (void)dealloc
{
    [connection cancel];
    [connection release];
    [data release];

    [super dealloc];
}

@end
