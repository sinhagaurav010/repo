//
//  DataController.h
//  MyappFinder
//
//  Created by gaurav sinha on 06/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#define LOG 1

@interface DataController : NSObject {

}
+(NSString*)fileFromBundle:(NSString*)fileName;
+(NSMutableArray*)filterTheCountry:(NSMutableArray*)arrayGroup;
+(NSMutableArray*)sortByCountry:(NSString*)countryName;
+(NSURLRequest*)GeNSurlRequestFor:(float_t)sourcelat:(float_t)sourcelong:(float_t)destlat:(float_t)destlong;
+(NSMutableArray*)arraymutable:(NSArray*)arrayns;
+(NSMutableArray*)arraymutable:(NSArray*)arrayns;
+(NSMutableArray*)arraFromFav;
+(void)saveInFavourites:(NSMutableDictionary*)dictionaryForFav;
+(BOOL)closeOrOpen;
+(NSMutableArray*)latitudeArray:(NSMutableArray*)array;
+(NSMutableArray*)longArray:(NSMutableArray*)array;
+(NSMutableArray*)nameArray:(NSMutableArray*)array;
+(BOOL)_isExitInFavourite:(NSString*)storeName;

@end
