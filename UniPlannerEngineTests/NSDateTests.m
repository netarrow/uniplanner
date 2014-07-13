//
// Created by Matteo Tomasulo on 02/05/14.
// Copyright (c) 2014 netarrow. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDate-Utilities.h"

@interface NSDateTests : XCTestCase

@end

@implementation NSDateTests 
    
-(void)testNSDate_dateByDateMonthAndYear_createTheDate {

    NSDate *date = [NSDate dateByDay:28 month:4 andYear:2014];

    XCTAssertEqual([date day], 28);
    XCTAssertEqual([date month], 4);
    XCTAssertEqual([date year], 2014);
    XCTAssertEqual([date workWeekday], 1);

}
    

@end