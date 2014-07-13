//
// Created by Matteo Tomasulo on 24/04/14.
// Copyright (c) 2014 netarrow. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UNPLesson : NSObject

@property(nonatomic, copy) NSDate *startHour;
@property(nonatomic, copy) NSDate *endHour;

@property(nonatomic, assign) int dayOfWeek;

- (id)initForDay:(int)i start:(NSString *)start end:(NSString *)end;
@end