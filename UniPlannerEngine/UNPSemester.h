//
// Created by Matteo Tomasulo on 23/04/14.
// Copyright (c) 2014 netarrow. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UNPCourse;


@interface UNPSemester : NSObject

@property (nonatomic, retain) NSMutableArray* courses;

@property(nonatomic, assign) int year;

- (id)initForYear:(int)year;

- (void)addCourse:(UNPCourse *)course;

@end