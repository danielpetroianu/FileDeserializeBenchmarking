//
//  main.m
//  FileDeserializeBenchmarking
//
//  Created by Petroianu Daniel on 10/3/14.
//  Copyright (c) 2014 Petroianu Daniel. All rights reserved.
//

#import "NSDictionary+FileLoad.h"
#import "JSONFileDeserialize.h"
#import "PlistFileDeserialize.h"

#define kNumberOrIterations 1000

extern uint64_t dispatch_benchmark(size_t count, void (^block)(void));

void benchmarkFileLoadJSON(NSString *fileName)
{
	uint64_t t = dispatch_benchmark(kNumberOrIterations, ^{
		@autoreleasepool {
			NSString *filePath = [[NSBundle mainBundle] pathForResource:[fileName stringByDeletingPathExtension]
																 ofType:@"json"];
			__unused NSDictionary *result = [NSDictionary dp_dictionaryWithContentsOfJSONFile:filePath];
		}
	});
	NSLog(@"file:'%@.json' opened in avg. time:  %10llu ns", fileName, t);
}

void benchmarkFileLoadPlist(NSString *fileName)
{
	uint64_t t = dispatch_benchmark(kNumberOrIterations, ^{
		@autoreleasepool {
			NSString *filePath = [[NSBundle mainBundle] pathForResource:[fileName stringByDeletingPathExtension]
																 ofType:@"plist"];
			__unused NSDictionary *result = [NSDictionary dp_dictionaryWithContentsOfPlistFile:filePath];
		}
	});
	NSLog(@"file:'%@.plist' opened in avg. time: %10llu ns", fileName, t);
}

void benchmarkDeserialize(id<FileDeserializeProtocol> deserializer, NSString *fileName)
{
	uint64_t t = dispatch_benchmark(kNumberOrIterations, ^{
		@autoreleasepool {
			__unused NSDictionary *result = [deserializer deserializeFile:fileName];
		}
	});
	NSLog(@"%-20s file:'%@' avg. runtime: %10llu ns", [NSStringFromClass([deserializer class]) UTF8String], fileName, t);
}

void runFileLoadTests()
{
	NSLog(@"-========== START FILE LOAD TESTING ==========-");
	NSLog(@"\n");
	
	benchmarkFileLoadJSON(@"data_dictionary_root_1");
	benchmarkFileLoadPlist(@"data_dictionary_root_1");
	NSLog(@"\n");
	
	benchmarkFileLoadJSON(@"data_dictionary_root_10");
	benchmarkFileLoadPlist(@"data_dictionary_root_10");
	NSLog(@"\n");
	
	benchmarkFileLoadJSON(@"data_dictionary_root_100");
	benchmarkFileLoadPlist(@"data_dictionary_root_100");
	NSLog(@"\n");
	
	benchmarkFileLoadJSON(@"data_dictionary_root_1000");
	benchmarkFileLoadPlist(@"data_dictionary_root_1000");
	NSLog(@"\n");
	
	benchmarkFileLoadJSON(@"data_dictionary_root_10000");
	benchmarkFileLoadPlist(@"data_dictionary_root_10000");
	NSLog(@"\n");
	
	benchmarkFileLoadJSON(@"data_dictionary_root_100000");
	benchmarkFileLoadPlist(@"data_dictionary_root_100000");
	
	NSLog(@"\n");
	NSLog(@"-========== TEST FILE LOAD ENDED ==========-");
}

void runDeserializeTest()
{
	@autoreleasepool {
		NSLog(@"-========== START DESERIALIZE TESTING ==========-");
		NSLog(@"\n");
		
		JSONFileDeserialize *jsonDeserializer = [[JSONFileDeserialize alloc] init];
		PlistFileDeserialize *plistDeserializer = [[PlistFileDeserialize alloc] init];
		
		benchmarkDeserialize(jsonDeserializer, @"data_dictionary_root_1");
		benchmarkDeserialize(plistDeserializer, @"data_dictionary_root_1");
		NSLog(@"\n");
		
		benchmarkDeserialize(jsonDeserializer, @"data_dictionary_root_10");
		benchmarkDeserialize(plistDeserializer, @"data_dictionary_root_10");
		NSLog(@"\n");
		
		benchmarkDeserialize(jsonDeserializer, @"data_dictionary_root_100");
		benchmarkDeserialize(plistDeserializer, @"data_dictionary_root_100");
		NSLog(@"\n");
		
		benchmarkDeserialize(jsonDeserializer, @"data_dictionary_root_1000");
		benchmarkDeserialize(plistDeserializer, @"data_dictionary_root_1000");
		NSLog(@"\n");
		
		benchmarkDeserialize(jsonDeserializer, @"data_dictionary_root_10000");
		benchmarkDeserialize(plistDeserializer, @"data_dictionary_root_10000");
		NSLog(@"\n");
		
		benchmarkDeserialize(jsonDeserializer, @"data_dictionary_root_100000");
		benchmarkDeserialize(plistDeserializer, @"data_dictionary_root_100000");
		
		NSLog(@"\n");
		NSLog(@"-========== TEST DESERIALIZE ENDED ==========-");
	}
}

int main(int argc, char * argv[]) {

	@autoreleasepool {
		NSLog(@"-========== START TESTING ==========-");
		NSLog(@"\n");
		
		runFileLoadTests();
		
		NSLog(@"\n");
		NSLog(@"\n");
		
		runDeserializeTest();

		NSLog(@"\n");
		NSLog(@"-========== TEST ENDED ==========-");
	
		return 0;
	}
}