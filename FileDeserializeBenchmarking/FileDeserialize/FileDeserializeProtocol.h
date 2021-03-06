//
//  FileDeserializeProtocol.h
//  FileDeserializeBenchmarking
//
//  Created by Petroianu Daniel on 10/3/14.
//  Copyright (c) 2014 Petroianu Daniel. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FileDeserializeProtocol <NSObject>

- (NSDictionary *)deserializeFile:(NSString *)fileName;

@end
