//
// Created by Matteo Tomasulo on 24/04/14.
// Copyright (c) 2014 netarrow. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UNPCourse.h"
#import "NSDate-Utilities.h"
#import "UNPLesson.h"
#import "UNPConfiguration.h"

@interface CourseTests : XCTestCase
@end

@implementation CourseTests

UNPCourse* course;
UNPConfiguration* config;

-(void)setUp {
    NSDate* startDate = [NSDate dateByDay:1 month:9 andYear: 2014];

    NSDate* endDate = [NSDate dateByDay:15 month:12 andYear: 2014];

    NSDate *examDate = [NSDate dateByDay:20 month:2 andYear:2015];

    config = [[UNPConfiguration alloc] init];
    config.cfuHour = 25;

    course = [[UNPCourse alloc] initCourse:@"Analisi" cfu:12 margin:1 lessonStart:startDate lessonEnd:endDate examDate:examDate];
}

-(void)tearDown {
    [config release];
    [course release];
}

-(void)testCourse_crateWithAllProperties_mustBeValorized {

    XCTAssertEqual(course.courseName, @"Analisi");
    XCTAssertEqual(course.cfu, 12);
    XCTAssertEqual(course.margin, 1);
    XCTAssert([course.lessonStartDate isEqualToDate: [NSDate dateByDay:1 month:9 andYear: 2014]]);
    XCTAssert([course.lessonEndDate isEqualToDate: [NSDate dateByDay:15 month:12 andYear: 2014]]);
    XCTAssert([course.examDate isEqualToDate: [NSDate dateByDay:20 month:2 andYear:2015]]);

}

-(void)testCourse_addLesson_mustBeAdded {
    UNPLesson* lesson = [[UNPLesson alloc] initForDay:1 start:@"9:00" end:@"12:00"];
    [course addLesson:lesson];

    [lesson release];

    XCTAssertEqual([course.lessons count], 1);
    XCTAssertEqual([[[course.lessons objectAtIndex:0] startHour] hour], 9);
    XCTAssertEqual([[[course.lessons objectAtIndex:0] endHour] hour], 12);
}

-(void)testCourse_getTotalLessonHourOnWeek_SumHour {
    UNPLesson* morning = [[UNPLesson alloc] initForDay:1 start:@"9:00" end:@"12:00"];
    UNPLesson* afternoon = [[UNPLesson alloc] initForDay:1 start:@"15:00" end:@"16:00"];

    [course addLesson:morning];
    [course addLesson:afternoon];

    [morning release];
    [afternoon release];

    int hour = [course weekLessonHour];

    XCTAssertEqual(hour, 4);
}


-(void)testCourse_getTotalLessonHourOnSemester_SumHour {
    UNPCourse* shortCourse = [[UNPCourse alloc] initCourse:@"Intro to nothing" cfu:1 margin:1 lessonStart:[NSDate dateByDay:28 month:4 andYear:2014] lessonEnd:[NSDate dateByDay:13 month:5 andYear:2014] examDate:nil];
    UNPLesson* morning = [[UNPLesson alloc] initForDay:1 start:@"9:00" end:@"12:00"];
    UNPLesson* afternoon = [[UNPLesson alloc] initForDay:1 start:@"15:00" end:@"16:00"];
    UNPLesson* nextDay = [[UNPLesson alloc] initForDay:2 start:@"10:00" end:@"11:00"];
    UNPLesson* nextDayAfternoon = [[UNPLesson alloc] initForDay:3 start:@"16:00" end:@"18:00"];

    [shortCourse addLesson:morning];
    [shortCourse addLesson:afternoon];
    [shortCourse addLesson:nextDay];
    [shortCourse addLesson:nextDayAfternoon];

    [morning release];
    [afternoon release];
    [nextDay release];
    [nextDayAfternoon release];

    int hour = [shortCourse totalLessonHours];

    XCTAssertEqual(hour, 19);

    [shortCourse release];
}

-(void)testCourse_getStudyHourForCourse_remainingHour {
    UNPCourse* shortCourse = [[UNPCourse alloc] initCourse:@"Intro to nothing" cfu:1 margin:1 lessonStart:[NSDate dateByDay:28 month:4 andYear:2014] lessonEnd:[NSDate dateByDay:13 month:5 andYear:2014] examDate:nil];
    shortCourse.configuration = config;

    UNPLesson* morning = [[UNPLesson alloc] initForDay:1 start:@"9:00" end:@"12:00"];   // 3
    UNPLesson* afternoon = [[UNPLesson alloc] initForDay:1 start:@"15:00" end:@"16:00"];  // 1
    UNPLesson* nextDay = [[UNPLesson alloc] initForDay:2 start:@"10:00" end:@"11:00"];  // 1
    UNPLesson* nextDayAfternoon = [[UNPLesson alloc] initForDay:3 start:@"16:00" end:@"18:00"];  // 2
    // 3 days of lessons, 7 hours per week, in total are 19 hours for this course

    [shortCourse addLesson:morning];
    [shortCourse addLesson:afternoon];
    [shortCourse addLesson:nextDay];
    [shortCourse addLesson:nextDayAfternoon];

    [morning release];
    [afternoon release];
    [nextDay release];
    [nextDayAfternoon release];

    int hour = [shortCourse studyHourInSemester];

    XCTAssertEqual(hour, 6); // 1 CFU is 25 hours, 19 of lesson so 6 of study

    [shortCourse release];
}



@end