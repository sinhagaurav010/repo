//
//  MyAnnotation.h
//  swiftGO
//
//  Created by Dharmendra Singh Kushwaha on 23/01/10.
//  Copyright ChromeInfotech 2010. All rights reserved.
//  mail:gauravs@chromeinfotech.com
//


#import <Foundation/Foundation.h>
#import <MapKit/MKAnnotation.h>


 @interface MyAnnotation : NSObject <MKAnnotation> 
	{
		CLLocationCoordinate2D coordinate;
		NSInteger  ann_tag;
		NSUInteger annotations;
		NSString   *title;
		NSString   *subtitle;
	    UIView     *annotation_view;
 		NSString   * userData;
        UIButton   *details_button;

	}
 @property (nonatomic, assign) CLLocationCoordinate2D coordinate;
 @property (nonatomic,assign)	NSInteger ann_tag;
@property (nonatomic,assign)	NSUInteger annotations;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic,assign) NSString *userData;
@property (nonatomic,assign)  UIView  *annotation_view;




@end
