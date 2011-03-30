
#import <UIKit/UIKit.h>

@class EGOImageView;
@interface ExampleCell : UITableViewCell {
    UILabel *labelLabel;
    UILabel *labelDetail;
    UILabel *labelDelay;
@private
	EGOImageView* imageView;
}
@property(nonatomic,retain)    UILabel *labelLabel;
@property(nonatomic,retain)     UILabel *labelDetail;
@property(nonatomic,retain)     UILabel *labelDelay;


- (void)setFlickrPhoto:(NSString*)flickrPhoto;
-(void)setTitle:(NSString*)string;
-(void)setdelay:(NSString*)string;

-(void)setSubTitle:(NSString*)string;
@end
