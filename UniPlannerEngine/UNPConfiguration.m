//
// Created by Matteo Tomasulo on 23/04/14.
// Copyright (c) 2014 netarrow. All rights reserved.
//

#import "UNPConfiguration.h"
#import "InvalidFreeDayException.h"

static UNPConfiguration *config = nil;

@implementation UNPConfiguration

    @synthesize freeDay;

-(void) setFreeDay: (int) day {
    if(day < 1 || day > 7) {
        @throw([InvalidFreeDayException alloc]);
    }

    freeDay = day;
}

@end

