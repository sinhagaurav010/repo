//
//  iCodeBlogAnnotationView.m
//  Find a Park
//
//  Created by Dharmendra Singh Kushwaha on 25/02/10.
//  Copyright ChromeInfotech 2010. All rights reserved.
//  Email:dharmendras@chromeinfotech.com
//

#import "iCodeBlogAnnotationView.h"

#define kHeight 27//43 //36
#define kWidth  32//22 //30
#define kBorder 2

@implementation iCodeBlogAnnotationView
@synthesize annotation_view_tag;


- (id)initWithAnnotation:(id <MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
	{
		//NSLog(@"annotation view");
		
//		NSLog(@"view.annotation_view_tag = %i",annotation_view_tag);

		MyAnnotation* myAnnotation = (MyAnnotation*)annotation;
		NSLog(@" myAnnotation.ann_tag-????????????????????????-----%i", myAnnotation.ann_tag);
		annotation_view_tag = myAnnotation.ann_tag;	
		
		//NSLog(@"annotation_view_tag %i",annotation_view_tag);
		self = [super initWithAnnotation:myAnnotation reuseIdentifier:nil];
		
		self.frame = CGRectMake(0, 0, 21,35);
		self.backgroundColor = [UIColor clearColor];
				
		/*UIImageView *imageView = [[UIImageView alloc] init];
		imageView.frame = CGRectMake(0, -kHeight/4, kWidth , kHeight);
		if (![myAnnotation.userData isEqualToString:@"NA"])
			imageView.image	=[UIImage imageWithData:[NSData dataWithBase64EncodedString: myAnnotation.userData]];
		else 
			imageView.image	=[UIImage imageNamed:@"icon.png"];*/
		UIImageView  *view_details  =  [[UIImageView alloc ]init];
		view_details.frame    = CGRectMake(0,0, 21,35);
		view_details.backgroundColor  =  [UIColor clearColor];
		view_details.image	=[UIImage imageNamed:@"google_maps_pin.png"];
		//UILabel  *lbl_details   =  
		[self addSubview:view_details];
		[view_details release];
		
				
		return self;
	}


@end
