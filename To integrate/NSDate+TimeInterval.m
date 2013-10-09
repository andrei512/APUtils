//
//  NSDate+TimeInterval.m
//  Point2Homes
//
//  Created by Andrei Puni on 9/12/13.
//  Copyright (c) 2013 Yardi. All rights reserved.
//

#import "NSDate+TimeInterval.h"

typedef NSDictionary *(^TimeIntervalBlock)(void);

const CGFloat A_DAY_IN_SECONDS = 60. * 60. * 24.;
// sixty seconds * sexty minutes * twenty four hours

@implementation NSDate (TimeInterval)

+ (NSDictionary *)timeIntervalNamed:(NSString *)intervalName {
    NSDictionary *timeIntervals = @{
        @"today" : (NSDictionary *)^() {
            return [NSDate todayTimeInterval];
        },
        @"thisWeek" : (NSDictionary *)^() {
            return [NSDate thisWeekTimeInterval];
        },
        @"thisWeekend" : (NSDictionary *)^() {
            return [NSDate thisWeekendTimeInterval];
        },
        @"sinceNow" : (NSDictionary *)^() {
            return [NSDate sinceNowTimeInterval];
        },
    };

    TimeIntervalBlock block = timeIntervals[intervalName];

    if (block != nil) {
        return block();
    }
    
    return @{};
}

+ (NSDictionary *)timeIntervalWithBeginDate:(NSDate *)beginDate
                                 andEndDate:(NSDate *)endDate {
    NSMutableDictionary *timeInterval = [NSMutableDictionary dictionaryWithCapacity:2];

    if (beginDate != nil) {
        timeInterval[@"begin_date"] = beginDate.formatedDate;
    }
    
    if (endDate != nil) {
        timeInterval[@"end_date"] = endDate.formatedDate;
    }
    
    return timeInterval;
}

+ (NSDictionary *)todayTimeInterval {
    NSDate *today  = ((NSDate *)[NSDate date]).simpleDate;

    return [NSDate timeIntervalWithBeginDate:today
                                  andEndDate:today];
}

+ (NSDictionary *)thisWeekTimeInterval {
    NSDate *today = [NSDate date];
    NSDate *firstDayOfTheWeek = [today getWeekday:2];
    NSDate *lastDayOfTheWeek = [today getWeekday:8];
    return [NSDate timeIntervalWithBeginDate:firstDayOfTheWeek
                                  andEndDate:lastDayOfTheWeek];
}

+ (NSDictionary *)thisWeekendTimeInterval {
    NSDate *today = [NSDate date];
    NSDate *firstDayOfTheWeekend = [today getWeekday:6];
    NSDate *lastDayOfTheWeek = [today getWeekday:8];
    return [NSDate timeIntervalWithBeginDate:firstDayOfTheWeekend
                                  andEndDate:lastDayOfTheWeek];
}

+ (NSDictionary *)sinceNowTimeInterval {
    NSDate *today = [NSDate date];
    return [NSDate timeIntervalWithBeginDate:today
                                  andEndDate:nil];
}

// returns the N-th day from a week
- (NSDate *)getWeekday:(int)weekdayNumber {
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *components = [cal components:
                                    NSMonthCalendarUnit |
                                    NSYearCalendarUnit |
                                    NSWeekdayCalendarUnit |
                                    NSYearForWeekOfYearCalendarUnit |
                                    NSWeekCalendarUnit                                    
                                          fromDate:self];

    if (weekdayNumber > 7) {
        weekdayNumber -= 7;
        [components setWeek:components.week + 1];
    }
    
    [components setWeekday:weekdayNumber];
    
    return [cal dateFromComponents:components];
}

// keeps only the year, month and day of the month
- (NSDate *)simpleDate {
    NSCalendar *cal = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [cal components:NSDayCalendarUnit |
                                                   NSMonthCalendarUnit |
                                                   NSYearCalendarUnit
                                               fromDate:self];
    
    return [cal dateFromComponents:components];
}


#pragma mark - Date Formating

- (NSString *)formatedDate {
    return [self formatedDateWithFormat:@"yyyy-MM-dd"];
}

- (NSString *)formatedDateWithFormat:(NSString *)dateFormat {
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:dateFormat];
    return [dateFormater stringFromDate:self];
}


@end
