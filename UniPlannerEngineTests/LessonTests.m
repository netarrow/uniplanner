//
// Created by Matteo Tomasulo on 24/04/14.
// Copyright (c) 2014 netarrow. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UNPLesson.h"
#import "NSDate-Utilities.h"

@interface LessonTests : XCTestCase

@end

@implementation LessonTests {
}

-(void) testLesson_createWithDayOfWeekAndHour_mustBeValorized {

    UNPLesson* lesson = [[UNPLesson alloc] initForDay: 1 start: @"9:30" end: @"12:00" ];

    XCTAssertEqual(lesson.dayOfWeek, 1);
    XCTAssertEqual([lesson.startHour hour], 9);
    XCTAssertEqual([lesson.startHour minute], 30);
    XCTAssertEqual([lesson.endHour hour], 12);
    XCTAssertEqual([lesson.endHour minute], 00);

    [lesson release];

}

@end