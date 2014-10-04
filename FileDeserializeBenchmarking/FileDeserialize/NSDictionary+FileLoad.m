//
//  NSDictionary+FileLoad.m
//  FileDeserializeBenchmarking
//
//  Created by Petroianu Daniel on 10/4/14.
//  Copyright (c) 2014 Petroianu Daniel. All rights reserved.
//

#import "NSDictionary+FileLoad.h"

@implementation NSDictionary (FileLoad)

+ (NSDictionary *)dp_dictionaryWithContentsOfJSONFile:(NSString *)path
{
	NSError *error = nil;
	NSData *JSONData = [NSData dataWithContentsOfFile:path options:NSDataReadingMappedIfSafe error:&error];
	
	id object = [NSJSONSerialization JSONObjectWithData:JSONData
												options:NSJSONReadingAllowFragments
												  error:&error];
	
	NSAssert1(nil == error, @"Error: %@", error.localizedDescription);
	NSAssert2([object isKindOfClass:[NSDictionary class]],
			  @"Error: object is of type: %@ instead of %@",
			  NSStringFromClass([object class]), NSStringFromClass([NSDictionary class]));
	
	return object;
}

+ (NSDictionary *)dp_dictionaryWithContentsOfPlistFile:(NSString *)path
{
	return [NSDictionary dictionaryWithContentsOfFile:path];
}

@end
