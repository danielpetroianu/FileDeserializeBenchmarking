//
//  PlistFileDeserialize.m
//  FileDeserializeBenchmarking
//
//  Created by Petroianu Daniel on 10/3/14.
//  Copyright (c) 2014 Petroianu Daniel. All rights reserved.
//

#import "PlistFileDeserialize.h"

@implementation PlistFileDeserialize

- (NSDictionary *)deserializeFile:(NSString *)fileName
{
	NSString *filePath = [[NSBundle mainBundle] pathForResource:[fileName stringByDeletingPathExtension]
														 ofType:@"plist"];
	
	NSDictionary *plistDict = [NSDictionary dp_dictionaryWithContentsOfPlistFile:filePath];
	
	id list = [plistDict objectForKey:@"List"];
	if(NO == [list isKindOfClass:[NSArray class]]) {
		return nil;
	}
	
	NSMutableArray *array = [NSMutableArray arrayWithCapacity:[(NSArray *)list count]];
	for (NSDictionary *itemDictionary in list) {
		[array addObject:[[ItemModel alloc] initWithDictionary:itemDictionary]];
	}
	
	return @{
		@"List": [NSArray arrayWithArray:array]
	};
}

@end
