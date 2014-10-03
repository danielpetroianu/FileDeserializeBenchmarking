//
//  main.m
//  FileDeserializeBenchmarking
//
//  Created by Petroianu Daniel on 10/3/14.
//  Copyright (c) 2014 Petroianu Daniel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemModel.h"


#import "JSONFileDeserialize.h"
#import "PlistFileDeserialize.h"

int main(int argc, char * argv[]) {
	@autoreleasepool {
		
		NSLog(@"Start Testing");
		
		id<FileDeserializeProtocol> jsonDeserializer = [[JSONFileDeserialize alloc] init];
		
		NSDictionary *result = [jsonDeserializer deserializeFile:@"data.json"];
		
		NSLog(@"%@", result);
		
		
		
		return 0;
	}
}
