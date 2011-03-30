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
		//NSLog(@"view.annotation_view_tag = %i",annotation_view_tag);

		MyAnnotation* myAnnotation = (MyAnnotation*)annotation;
		annotation_view_tag = myAnnotation.ann_tag;	
		
		//NSLog(@"annotation_view_tag %i",annotation_view_tag);
		self = [super initWithAnnotation:myAnnotation reuseIdentifier:nil];
		
		self.frame = CGRectMake(0, 0, 21,35);
		self.backgroundColor = [UIColor clearColor];
		UIImageView  *view_details  =  [[UIImageView alloc ]init];
		view_details.frame    = CGRectMake(0,0, 21,35);
		view_details.backgroundColor  =  [UIColor clearColor];
		view_details.image	=[UIImage imageNamed:@"McD.png"];
		
		
		//UILabel  *lbl_details   =  
		[self addSubview:view_details];
		[view_details release];
		return self;
}
@end
