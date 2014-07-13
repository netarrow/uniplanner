//
// Created by Matteo Tomasulo on 23/04/14.
// Copyright (c) 2014 netarrow. All rights reserved.
//

#import "UNPSemester.h"
#import "UNPCourse.h"


@implementation UNPSemester {

}

- (id)init {
    self = [super init];

    self.courses = [[NSMutableArray array] retain];

    return self;
}


- (id)initForYear:(int)year {
    if(self == [self init]) {
        self.year = year;
    }

    return self;
}


- (void)addCourse:(UNPCourse *)course {
    [self.courses addObject:course];
}

- (void)dealloc {
    [self.courses release];
    [super dealloc];
}


@end