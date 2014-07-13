
// Created by Matteo Tomasulo on 23/04/14.
// Copyright (c) 2014 netarrow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UNPConfiguration : NSObject

@property(nonatomic, assign) int cfuHour;

@property(nonatomic, assign) int freeDay;


+ (UNPConfiguration *)sharedConfig;
@end