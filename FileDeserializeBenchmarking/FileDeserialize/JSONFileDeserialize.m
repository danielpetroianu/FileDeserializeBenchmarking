//
//  JSONFileDeserialize.m
//  FileDeserializeBenchmarking
//
//  Created by Petroianu Daniel on 10/3/14.
//  Copyright (c) 2014 Petroianu Daniel. All rights reserved.
//

#import "JSONFileDeserialize.h"


@interface JSONFileDeserialize ()

@end

@implementation JSONFileDeserialize

- (NSDictionary *)deserializeFile:(NSString *)fileName
{
	NSString *filePath = [[NSBundle mainBundle] pathForResource:[fileName stringByDeletingPathExtension]
														 ofType:@"json"];
	NSDictionary *jsonDict = [NSDictionary dp_dictionaryWithContentsOfJSONFile:filePath];
	
	id list = [jsonDict objectForKey:@"List"];
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
