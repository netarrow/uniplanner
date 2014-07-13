//
// Created by Matteo Tomasulo on 24/04/14.
// Copyright (c) 2014 netarrow. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UNPSemester.h"
#import "UNPCourse.h"
#import "NSDate-Utilities.h"

@interface SemesterTests : XCTestCase
@end

@implementation SemesterTests
{
    UNPSemester* semester;
}

- (void)setUp
{
    [super setUp];

    semester = [[UNPSemester alloc] init];
}

- (void)tearDown
{
    [super tearDown];

    [semester release];
}

-(void) testSemester_year_canBeSetted {
    semester.year = 2014;

    XCTAssertEqual(semester.year, 2014);
}

-(void) testSemester_initForYear_yearMustBeSelected {
    UNPSemester* semesterForYear = [[UNPSemester alloc] initForYear: 2014];

    XCTAssertEqual(semesterForYear.year, 2014);

    [semesterForYear release];
}

-(void) testSemester_addCourse_mustBeAdded {
    UNPCourse* algebra = [[UNPCourse alloc] initCourse:@"Algebra" cfu:9 margin:1 lessonStart:[NSDate dateByDay:1 month:10 andYear:2014] lessonEnd:[NSDate dateByDay:20 month:12 andYear:2014] examDate:nil ];
    UNPCourse* phisic = [[UNPCourse alloc] initCourse:@"Phisic" cfu:6 margin:2 lessonStart:[NSDate dateByDay:1 month:10 andYear:2014] lessonEnd:[NSDate dateByDay:20 month:12 andYear:2014] examDate:nil ];

    [semester addCourse: algebra];
    [semester addCourse: phisic];

    [algebra release];
    [phisic release];

    XCTAssertEqual([semester.courses count], 2);

}


@end