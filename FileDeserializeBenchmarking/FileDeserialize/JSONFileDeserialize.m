//
//  JSONFileDeserialize.m
//  FileDeserializeBenchmarking
//
//  Created by Petroianu Daniel on 10/3/14.
//  Copyright (c) 2014 Petroianu Daniel. All rights reserved.
//

#import "JSONFileDeserialize.h"
#import "ItemModel.h"

@interface JSONFileDeserialize ()

@end

@implementation JSONFileDeserialize

- (NSDictionary *)deserializeFile:(NSString *)fileName
{
	NSString *filePath = [[NSBundle mainBundle] pathForResource:[fileName stringByDeletingPathExtension]
														 ofType:@"json"];
	NSError *error = nil;
	NSData *JSONData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:&error];
	
	id object = [NSJSONSerialization JSONObjectWithData:JSONData
												options:NSJSONReadingAllowFragments
												  error:&error];
	
	if(nil != error){
		NSLog(@"Error: %@", error);
		return nil;
	}
	
	if (NO == [object isKindOfClass:[NSDictionary class]]) {
		return nil;
	}
	
	id list = [object objectForKey:@"List"];
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
