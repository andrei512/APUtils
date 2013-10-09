//
//  NSDate+APUtils.m
//
//  Created by Andrei Puni on 5/21/13.
//

#import "NSDate+APUtils.h"

typedef NSDictionary *(^APTimeIntervalBlock)(void);

// sixty seconds * sexty minutes * twenty four hours
const CGFloat A_DAY_IN_SECONDS = 60. * 60. * 24.;

@implementation NSDate (APUtils)

#pragma mark - Time Intervals

+ (NSDictionary *)timeIntervalNamed:(NSString *)intervalName {
    static NSDictionary *timeIntervals = nil;
  
    if (timeIntervals == nil) {
        timeIntervals = @{
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
    }
    
    APTimeIntervalBlock block = timeIntervals[intervalName];
    
    return block ? block() : @{};
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

#pragma mark - Time ago

/*
 * This guy can be a little unreliable and produce unexpected results,
 * you're better off using daysAgoAgainstMidnight
 */
- (NSUInteger) daysAgo
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSDayCalendarUnit)
                                               fromDate:self
                                                 toDate:[NSDate date]
                                                options:0];
    
    return [components day];
}

- (NSUInteger) hoursAgo
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSHourCalendarUnit)
                                               fromDate:self
                                                 toDate:[NSDate date]
                                                options:0];
    
    return [components hour];
}

- (NSUInteger) daysAgoAgainstMidnight {
    // get a midnight version of ourself:
    return - [[self simpleDate] timeIntervalSinceNow] / (A_DAY_IN_SECONDS);
}

- (NSString *) stringDaysAgo {
    return [self stringDaysAgoAgainstMidnight:YES];
}

- (NSString *) stringDaysAgoAgainstMidnight:(BOOL)flag {
    NSUInteger daysAgo = (flag) ? [self daysAgoAgainstMidnight] : [self daysAgo];
    NSString *text = nil;
    
    switch (daysAgo) {
        case 0:
            text = @"Today";
            break;
            
        case 1:
            text = @"Yesterday";
            break;
            
        default:
            text = [NSString stringWithFormat:@"%d days ago", daysAgo];
    }
    
    return text;
}

#pragma mark - General

- (NSUInteger) weekday {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *weekdayComponents = [calendar components:(NSWeekdayCalendarUnit) fromDate:self];
    
    return [weekdayComponents weekday];
}

- (NSTimeInterval) unixTime {
    return [self timeIntervalSince1970];     // if nil, return 0.0
}


@end
