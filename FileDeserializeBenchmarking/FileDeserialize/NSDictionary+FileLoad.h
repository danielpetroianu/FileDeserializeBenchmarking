//
//  NSDictionary+FileLoad.h
//  FileDeserializeBenchmarking
//
//  Created by Petroianu Daniel on 10/4/14.
//  Copyright (c) 2014 Petroianu Daniel. All rights reserved.
//

@interface NSDictionary (FileLoad)

+ (NSDictionary *)dp_dictionaryWithContentsOfJSONFile:(NSString *)path;

+ (NSDictionary *)dp_dictionaryWithContentsOfPlistFile:(NSString *)path;

@end
