//
// Created by Matteo Tomasulo on 24/04/14.
// Copyright (c) 2014 netarrow. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UNPLesson;
@class UNPConfiguration;


@interface UNPCourse : NSObject

@property(nonatomic, copy) NSString *courseName;
@property(nonatomic, assign) int cfu;
@property(nonatomic, assign) int margin;
@property(nonatomic, copy) NSDate *lessonStartDate;
@property(nonatomic, copy) NSDate *lessonEndDate;
@property(nonatomic, copy) NSDate *examDate;
@property(nonatomic, retain) NSMutableArray *lessons;
@property(nonatomic, retain) UNPConfiguration *configuration;

- (id)initCourse:(NSString *)string cfu:(int)cfu margin:(int)margin lessonStart:(NSDate *)start lessonEnd:(NSDate *)end examDate:(NSDate *)date;

- (void)addLesson:(UNPLesson *)lesson;

- (int)weekLessonHour;

- (int)totalLessonHours;

- (int)studyHourInSemester;
@end