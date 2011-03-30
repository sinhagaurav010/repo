//
//  DataController.m
//  MyappFinder
//
//  Created by gaurav sinha on 06/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DataController.h"
#import "SharedInstance.h"
#define BOKM @"favourites"
@implementation DataController
+(NSString*)fileFromBundle:(NSString*)fileName
{
	NSString *filePath				= [[NSBundle mainBundle] pathForResource:fileName ofType:@"xml"];  
	NSData *myData					= [NSData dataWithContentsOfFile:filePath];  
	NSString *responseString		= [[NSString alloc] initWithData:myData encoding: NSUTF8StringEncoding];
	return responseString;
}

///To check whether restaurent is open or closed
+(BOOL)closeOrOpen
{
	NSDateFormatter *formatter;
	NSString        *dateString;
	BOOL _yesOrNo;
	formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"dd-MM-yyyy HH:mm"];
	
	dateString = [formatter stringFromDate:[NSDate date]];
	
	[formatter release];
	
	NSString *stringToCheckForEight = [[dateString substringToIndex:11] stringByAppendingString:@"08:00"];
	
	
	NSComparisonResult result8 = [dateString compare:stringToCheckForEight];
	
	NSString *stringToCheckFortwo = [[dateString substringToIndex:11] stringByAppendingString:@"24:00"];
	

	NSComparisonResult result2 = [dateString compare:stringToCheckFortwo];

	
	if(result2 == -1 )
	{
		if(result8 == 1)
			_yesOrNo = 1;
	}
	else 
	{
		_yesOrNo = 0;
	}
	
	return _yesOrNo;
}
///////return data for the lat when argument is nsmutable array 
+(NSMutableArray*)latitudeArray:(NSMutableArray*)array
{
	NSMutableArray *arraylat  = [NSMutableArray  new];
	for(int  i = 0;i<[array count];i++)
		[arraylat addObject:[[array objectAtIndex:i]objectForKey:@"latitude"]];
	
	return arraylat;
	[arraylat  release];
}

///////return data for the long when argument is nsmutable array 
+(NSMutableArray*)longArray:(NSMutableArray*)array
{
	NSMutableArray *arraylat  = [NSMutableArray  new];
	for(int  i = 0;i<[array count];i++)
		[arraylat addObject:[[array objectAtIndex:i]objectForKey:@"longitude"]];
	
	return arraylat;
	[arraylat  release];
}

///////return data for the name when argument is nsmutable array 
+(NSMutableArray*)nameArray:(NSMutableArray*)array
{
	NSMutableArray *arrayname  = [NSMutableArray  new];
	for(int  i = 0;i<[array count];i++)
		[arrayname addObject:[[array objectAtIndex:i]objectForKey:@"store_name"]];
	
	return arrayname;
	[arrayname  release];
}

////////Check whether store already exist in favourite or not
+(BOOL)_isExitInFavourite:(NSString*)storeName
{
	NSMutableArray *arrayFav = [NSMutableArray new];
	BOOL _isExit = 0;
	arrayFav = [DataController arraFromFav];
	for(int i = 0;i<[arrayFav count];i++)
	{
	if([[[arrayFav objectAtIndex:i]objectForKey:@"store_name"]isEqualToString:storeName])
	{
		_isExit = 1;
		break;
	}
	}
	NSLog(@"sdvsda");
	return _isExit;
}

////return nsmutable array according the county
+(NSMutableArray*)filterTheCountry:(NSMutableArray*)arrayGroup
{
	NSMutableArray *array = [NSMutableArray new];
	for(int i = 0;i<[arrayGroup count];i++)
	{
		BOOL temp = 0;
		for(int j = 0;j<[array count];j++)
		{
		if([[arrayGroup objectAtIndex:i] isEqualToString:[array objectAtIndex:j]])
		{
			temp = 1;
			break;
		}
		}
		if(temp == 0)
		{
		[array addObject:[arrayGroup objectAtIndex:i]];
		}
	}
	return array;
}
////////save the dictionary in favourites in NSUserDefault
+(void)saveInFavourites:(NSMutableDictionary*)dictionaryForFav
{
    NSUserDefaults			*defaults = [NSUserDefaults standardUserDefaults];
	NSArray  *arrayBookmark = [NSArray new];
	if([defaults arrayForKey:BOKM])
	{
		arrayBookmark  = [NSArray arrayWithArray:[defaults arrayForKey:BOKM]];
		[defaults removeObjectForKey:BOKM];
		[defaults synchronize];
	}
	NSMutableArray *array = [NSMutableArray new];
	array = [DataController arraymutable:arrayBookmark];
	[array addObject:dictionaryForFav];
	[defaults setObject:array forKey:BOKM];
	[defaults synchronize];
	if(array)
	{
		[array release];
		array = nil;
	}
}

/////////Get the array from the favourites
+(NSMutableArray*)arraFromFav
{
	NSUserDefaults			*defaults = [NSUserDefaults standardUserDefaults];
	NSArray  *arrayBookmark = [NSArray new];
	if([defaults arrayForKey:BOKM])
	{
		arrayBookmark  = [NSArray arrayWithArray:[defaults arrayForKey:BOKM]];
	}
	NSMutableArray *array = [NSMutableArray new];
	array = [DataController arraymutable:arrayBookmark];
	return array;
	if(array)
	{
		[array release];
		array = nil;
	}
	
}

///////////pass Latitude and longitude of source and destination give the NSURLRequest
+(NSURLRequest*)GeNSurlRequestFor:(float_t)sourcelat:(float_t)sourcelong:(float_t)destlat:(float_t)destlong
{
	//NSString *url1 = [NSString stringWithFormat: @"http://maps.google.com/maps?saddr=%f,%f&daddr=%f,%f", 36.17191,-115.14,36.17489,-115.1371];	
	NSString *url1 = [NSString stringWithFormat: @"http://maps.google.com/maps?saddr=%f,%f&daddr=%f,%f", sourcelat,sourcelong,destlat,destlong];	
	NSURL *url = [NSURL URLWithString:url1];
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	
	return request;
}
/////Sort by the country name
+(NSMutableArray*)sortByCountry:(NSString*)countryName
{
	SharedInstance *share = [SharedInstance sharedInstance];
	NSMutableArray *array = [NSMutableArray new];

	for(int i = 0;i<[[share gettheArray]  count];i++)
	{
	if([[[[share gettheArray]objectAtIndex:i]objectForKey:@"county"]isEqualToString:countryName])
	{
		[array addObject:[[share gettheArray]objectAtIndex:i]];
	}
	}
	return array;
}

////////////convert into array into nsmutable array
+(NSMutableArray*)arraymutable:(NSArray*)arrayns
{	
	NSMutableArray *array = [NSMutableArray new];
	for (int i = 0; i<[arrayns count]; i++) 
	{
		[array addObject:[arrayns objectAtIndex:i]];
	}
	
	return array;
	if(array)
	{
		[array release];
		array = nil;
	}
}
@end
