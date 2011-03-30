

#import <CoreFoundation/CoreFoundation.h>
#import "TreeNode.h"

@interface XMLParser : NSObject
{
	NSMutableArray		*stack;
}

+ (XMLParser *) sharedInstance;
- (TreeNode *) parseXMLFromURL: (NSURL *) url;
- (TreeNode *) parseXMLFromData: (NSData*) data;
@end

