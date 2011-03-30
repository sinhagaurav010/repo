//
//  iCodeBlogAnnotationView.h
//  Find a Park
//
//  Created by Dharmendra Singh Kushwaha on 25/02/10.
//  Copyright ChromeInfotech 2010. All rights reserved.
//  Email:gauravs@chromeinfotech.com
//


/**
 @ Description : This class is used to provide the functionality to add custom annotation on map view.
  */
#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "MyAnnotation.h"

@interface iCodeBlogAnnotationView : MKAnnotationView 
{
	NSInteger annotation_view_tag;
}

@property(nonatomic,assign) NSInteger annotation_view_tag;



@end
