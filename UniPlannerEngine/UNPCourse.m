//
// Created by Matteo Tomasulo on 24/04/14.
// Copyright (c) 2014 netarrow. All rights reserved.
//

#import "UNPCourse.h"
#import "UNPLesson.h"
#import "NSDate-Utilities.h"
#import "UNPConfiguration.h"


@implementation UNPCourse {

}

- (id)initCourse:(NSString *)name cfu:(int)cfu margin:(int)margin lessonStart:(NSDate *)start lessonEnd:(NSDate *)end examDate:(NSDate *)examDate {
    self = [super self];
    
   self.courseName = name;
   self.cfu = cfu;
   self.margin = margin;
   self.lessonStartDate = start;
   self.lessonEndDate = end;
   self.examDate = examDate;

    self.lessons = [[NSMutableArray array] retain];

    return self;
}

- (void)addLesson:(UNPLesson *)lesson {
    [_lessons addObject:lesson];
}

- (int)weekLessonHour {

    int total = 0;

    for(UNPLesson * lesson in _lessons) {
        total += [lesson.startHour hoursBeforeDate: lesson.endHour];

    }

    return total;
}

- (int)totalLessonHours {
    int total = 0;

    @autoreleasepool {

        NSDate* currentDate = [[_lessonStartDate copy] autorelease];

        for(UNPLesson *lesson in _lessons) {
            do {
                if(lesson.dayOfWeek == currentDate.workWeekday) {
                     total += [lesson.startHour hoursBeforeDate:lesson.endHour];
                }

                currentDate = [currentDate dateByAddingDays:1];

            } while([currentDate isEarlierThanDate:_lessonEndDate] || [currentDate isEqualToDateIgnoringTime:_lessonEndDate]);

            currentDate = [[_lessonStartDate copy] autorelease];
        }

    }

    return total;
}

- (int)studyHourInSemester {
    int lessonHour = [self totalLessonHours];
    int totalCourseEffort = [self cfu] * [_configuration cfuHour];

    return totalCourseEffort - lessonHour;
}

- (void)dealloc {
    [self.courseName release];
    [self.lessonStartDate release];
    [self.lessonEndDate release];
    [self.examDate release];
    [self.lessons release];
    [self.configuration release];
    [super dealloc];
}

@end