//
//  ItemModel.m
//  FileDeserializeBenchmarking
//
//  Created by Petroianu Daniel on 10/3/14.
//  Copyright (c) 2014 Petroianu Daniel. All rights reserved.
//

#import "ItemModel.h"

@implementation ItemModel

- (instancetype)initWithDictionary:(NSDictionary *)aDictionary
{
	if(self = [super init]){
        self.uid       = [[aDictionary objectForKey:@"uid"] integerValue];
        self.firstName = [[aDictionary objectForKey:@"firstName"] description];
        self.lastName  = [[aDictionary objectForKey:@"lastName"] description];
	}
	
	return self;
}

-(NSString *)description
{
	return [NSString stringWithFormat:
			@"<%@: %p uid:%d firstName:%@ lastName:%@ >",
			NSStringFromClass([self class]), self, (int)self.uid, self.firstName, self.lastName];
}

@end
