//
// Created by Matteo Tomasulo on 24/04/14.
// Copyright (c) 2014 netarrow. All rights reserved.
//

#import "UNPLesson.h"


@implementation UNPLesson {
}

- (id)initForDay:(int) dayOfWeek start:(NSString *)start end:(NSString *)end {

    self = [super init];

    NSDateFormatter* formatFromInput = [[NSDateFormatter alloc] init];
    [formatFromInput setDateFormat:@"HH:mm"];
    self.dayOfWeek = dayOfWeek;
    self.startHour  = [formatFromInput dateFromString:start];
    self.endHour = [formatFromInput dateFromString:end];
    [formatFromInput release];

    return self;
}

- (void)dealloc {
    [self.startHour release];
    [self.endHour release];
    [super dealloc];
}
@end