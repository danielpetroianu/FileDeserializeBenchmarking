//
//  ItemModel.h
//  FileDeserializeBenchmarking
//
//  Created by Petroianu Daniel on 10/3/14.
//  Copyright (c) 2014 Petroianu Daniel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemModel : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)aDictionary;

@property(assign, nonatomic) NSInteger uid;
@property(copy, nonatomic) NSString *firstName;
@property(copy, nonatomic) NSString *lastName;

@end
