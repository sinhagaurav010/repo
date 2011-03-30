//
//  SharedInstance.h
//  MyappFinder
//
//  Created by gaurav sinha on 06/02/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SharedInstance : NSObject 
{
	NSUInteger board[100];
	NSMutableArray *arrayForSorting;
	NSMutableArray *arrayLocationLong;
	NSMutableArray *arrayLocationLat;
	NSMutableArray *arrayShared;
	NSMutableArray *arrayName;
	NSMutableDictionary *dictionaryToSave;
	NSMutableArray *arrayVoucher;
}
-(NSMutableArray*)getTheArrayForVoucher;
-(void)setTheArrayForVoucher:(NSMutableArray*)array;
+ (SharedInstance *) sharedInstance;
-(void)settheMutablearray:(NSMutableArray*)array;
-(NSMutableArray*)gettheArray;
- (NSUInteger) getFieldValueAtPos:(NSUInteger)x;
- (void) setFieldValueAtPos:(NSUInteger)x ToValue:(NSUInteger)newVal;
-(void)settheMutablearrayWithSort:(NSMutableArray*)arry;
-(NSMutableArray*)gettheMutablearrayWithSort;
-(void)saveDictionary:(NSMutableDictionary*)dict;
-(NSMutableDictionary*)getTheSaveDictionary;
-(void)setlocationLog:(NSMutableArray*)arrayLong;
-(NSMutableArray*)getlocationLog;
-(void)setlocationLat:(NSMutableArray*)arrayLong;
-(NSMutableArray*)getlocationLat;
-(void)setNameArray:(NSMutableArray*)array;
-(NSMutableArray*)getArrayName;
@end
