//
//  main.m
//  FileDeserializeBenchmarking
//
//  Created by Petroianu Daniel on 10/3/14.
//  Copyright (c) 2014 Petroianu Daniel. All rights reserved.
//

#import "NSDictionary+FileLoad.h"
#import "UIDevice+ModelName.h"
#import "JSONFileDeserialize.h"
#import "PlistFileDeserialize.h"

#define kNumberOrIterations 1000
#define kMaxDataset 100

extern uint64_t dispatch_benchmark(size_t count, void (^block)(void));
void benchmarkFileLoadJSON(NSString *fileName);
void benchmarkFileLoadPlist(NSString *fileName);
void benchmarkDeserialize(id<FileDeserializeProtocol> deserializer, NSString *fileName);
void runFileLoadTests();
void runDeserializeTest();

int main(int argc, char * argv[]) {

	@autoreleasepool {
		NSLog(@"-========== START TESTING on %@ ==========-", [UIDevice dp_modelName]);
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

void runFileLoadTests()
{
	NSLog(@"-========== START FILE LOAD TESTING ==========-");
	NSLog(@"\n");
	
	for(int i = 1; i <= kMaxDataset; i *= 10)
	{
		benchmarkFileLoadJSON([NSString stringWithFormat:@"data_dictionary_root_%d", i]);
		benchmarkFileLoadPlist([NSString stringWithFormat:@"data_dictionary_root_%d", i]);
		NSLog(@"\n");
	}
	
	NSLog(@"-========== TEST FILE LOAD ENDED ==========-");
}

void benchmarkFileLoadJSON(NSString *fileName)
{
	uint64_t t = dispatch_benchmark(kNumberOrIterations, ^{
		@autoreleasepool {
			NSString *filePath = [[NSBundle mainBundle] pathForResource:[fileName stringByDeletingPathExtension]
																 ofType:@"json"];
			__unused NSDictionary *result = [NSDictionary dp_dictionaryWithContentsOfJSONFile:filePath];
		}
	});
	NSLog(@"file:'%30s.json'  opened in avg. time: %10llu ns", [fileName UTF8String], t);
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
	NSLog(@"file:'%30s.plist' opened in avg. time: %10llu ns", [fileName UTF8String], t);
}


void runDeserializeTest()
{
	@autoreleasepool {
		NSLog(@"-========== START DESERIALIZE TESTING ==========-");
		NSLog(@"\n");
		
		JSONFileDeserialize *jsonDeserializer = [[JSONFileDeserialize alloc] init];
		PlistFileDeserialize *plistDeserializer = [[PlistFileDeserialize alloc] init];
		
		for(int i = 1; i <= kMaxDataset; i *= 10)
		{
			benchmarkDeserialize(jsonDeserializer, [NSString stringWithFormat:@"data_dictionary_root_%d", i]);
			benchmarkDeserialize(plistDeserializer, [NSString stringWithFormat:@"data_dictionary_root_%d", i]);
			NSLog(@"\n");
		}
		
		NSLog(@"-========== TEST DESERIALIZE ENDED ==========-");
	}
}

void benchmarkDeserialize(id<FileDeserializeProtocol> deserializer, NSString *fileName)
{
	uint64_t t = dispatch_benchmark(kNumberOrIterations, ^{
		@autoreleasepool {
			__unused NSDictionary *result = [deserializer deserializeFile:fileName];
		}
	});
	NSLog(@"%-20s file:'%30s' avg. runtime: %10llu ns", [NSStringFromClass([deserializer class]) UTF8String], [fileName UTF8String], t);
}