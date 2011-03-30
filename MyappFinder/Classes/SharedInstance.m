//
//  SharedInstance.m
//  MyappFinder
//
//  Created by gaurav sinha on 06/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SharedInstance.h"


@implementation SharedInstance
static SharedInstance *_sharedInstance;

-init
{
	if (self = [super init])
	{
		// custom initialization
		//memset(board, 0, sizeof(board));
	}
	return self;
}
+ (SharedInstance *) sharedInstance
{
	if (!_sharedInstance)
	{
		_sharedInstance = [[SharedInstance alloc] init];
	}
	
	return _sharedInstance;
}

- (NSUInteger) getFieldValueAtPos:(NSUInteger)x
{
	return board[x];
}
/////Set the nsmutable array which has got from the parsing
-(void)settheMutablearray:(NSMutableArray*)array
{
	arrayShared = [NSMutableArray new];
	arrayShared = array;
}

//return the array which was parsed
-(NSMutableArray*)gettheArray
{
	return arrayShared;
}
///////
//return array of country
-(void)settheMutablearrayWithSort:(NSMutableArray*)arry
{
	arrayForSorting = [NSMutableArray new];
	arrayForSorting = arry;
}
-(NSMutableArray*)gettheMutablearrayWithSort
{
	return arrayForSorting;
}
//////Save the dictionary of parse data for details
-(void)saveDictionary:(NSMutableDictionary*)dict
{
	dictionaryToSave = [NSMutableDictionary new];
	dictionaryToSave  =  dict;
}
-(NSMutableDictionary*)getTheSaveDictionary
{
	return dictionaryToSave;
}
//////Here the array save for the long
-(void)setlocationLog:(NSMutableArray*)arrayLong
{
	arrayLocationLong = [NSMutableArray  new];
	arrayLocationLong = arrayLong;
}
-(NSMutableArray*)getlocationLog
{
	return arrayLocationLong;
}

//////Here the array save for the latitude
-(void)setlocationLat:(NSMutableArray*)arrayLong
{
	arrayLocationLat = [NSMutableArray  new];
	arrayLocationLat = arrayLong;
}
-(NSMutableArray*)getlocationLat
{
	return arrayLocationLat;
}

/////Set the name array for tille in the map
-(void)setNameArray:(NSMutableArray*)array
{
	arrayName = [NSMutableArray new];
	arrayName = array;
}
-(NSMutableArray*)getArrayName
{
	return arrayName;
}


///////At 1 -cell number is stored of nearby when user is clicked to find its details
////////At 2-cell of picker in search view controller
///////At 3-cell of voucherview controller is clicked

- (void) setFieldValueAtPos:(NSUInteger)x ToValue:(NSUInteger)newVal
{
	board[x] = newVal;
}

////////get the array for vouchers
-(NSMutableArray*)getTheArrayForVoucher
{
	return arrayVoucher ;
}

////////set the array for vouchers
-(void)setTheArrayForVoucher:(NSMutableArray*)array
{
	arrayVoucher = [NSMutableArray new];
	arrayVoucher = array;
}

@end
