//
//  ConfigurationTests.m
//  ConfigurationTests
//
//  Created by Matteo Tomasulo on 23/04/14.
//  Copyright (c) 2014 netarrow. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UNPConfiguration.h"
#import "InvalidFreeDayException.h"

@interface ConfigurationTests : XCTestCase

@end

@implementation ConfigurationTests
{
    UNPConfiguration* configuration;
}

- (void)setUp
{
    [super setUp];

    configuration = [[UNPConfiguration alloc] init];
}

- (void)tearDown
{
    [super tearDown];

    [configuration release];
}

- (void)testConfiguration_cfuHour_canBeSetted
{
    configuration.cfuHour = 25;

    XCTAssertEqual(configuration.cfuHour, 25);

}

- (void)testConfiguration_freeDay_canBeSetted
{
    configuration.freeDay = 1;

    XCTAssertEqual(configuration.freeDay, 1);

}

-(void)testConfiguration_freeDayValueNotIncludedBetween1And7_mustThrowsException
{

    XCTAssertThrowsSpecific(configuration.freeDay = 0, InvalidFreeDayException);
    XCTAssertThrowsSpecific(configuration.freeDay = 8, InvalidFreeDayException);

}



@end
