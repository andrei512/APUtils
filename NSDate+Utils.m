//
//  NSDate+Utils.m
//  Point2Homes
//
//  Created by Andrei Puni on 5/21/13.
//  Copyright (c) 2013 Point2. All rights reserved.
//

#import "NSDate+Utils.h"

@implementation NSDate (Utils)


+ (NSDate *)today {
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ) fromDate:[[NSDate alloc] init]];
    
    [components setHour:-[components hour]];
    [components setMinute:-[components minute]];
    [components setSecond:-[components second]];
    NSDate *today = [cal dateByAddingComponents:components toDate:[[NSDate alloc] init] options:0]; //This variable should now be pointing at a date object that is the start of today (midnight);

    return today;
}

+ (NSDate *)yesterday {
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ) fromDate:[[NSDate alloc] init]];
    
    [components setHour:-[components hour]];
    [components setMinute:-[components minute]];
    [components setSecond:-[components second]];
    NSDate *today = [cal dateByAddingComponents:components toDate:[[NSDate alloc] init] options:0]; //This variable should now be pointing at a date object that is the start of today (midnight);
    
    [components setHour:-24];
    [components setMinute:0];
    [components setSecond:0];
    NSDate *yesterday = [cal dateByAddingComponents:components toDate: today options:0];
    
    return yesterday;
}

+ (NSDate *)thisWeek {
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ) fromDate:[[NSDate alloc] init]];
    
    [components setHour:-[components hour]];
    [components setMinute:-[components minute]];
    [components setSecond:-[components second]];
    [components setHour:-24];
    [components setMinute:0];
    [components setSecond:0];
    components = [cal components:NSWeekdayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:[[NSDate alloc] init]];
    [components setDay:([components day] - ([components weekday] - 1))];
    NSDate *thisWeek  = [cal dateFromComponents:components];

    return thisWeek;
}

+ (NSDate *)lastWeek {
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ) fromDate:[[NSDate alloc] init]];
    
    [components setHour:-[components hour]];
    [components setMinute:-[components minute]];
    [components setSecond:-[components second]];
    [components setHour:-24];
    [components setMinute:0];
    [components setSecond:0];
    components = [cal components:NSWeekdayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:[[NSDate alloc] init]];
    [components setDay:([components day] - ([components weekday] - 1))];
    [components setDay:([components day] - 7)];
    NSDate *lastWeek  = [cal dateFromComponents:components];
    
    return lastWeek;
}

+ (NSDate *)thisMonth {
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ) fromDate:[[NSDate alloc] init]];
    
    [components setHour:-[components hour]];
    [components setMinute:-[components minute]];
    [components setSecond:-[components second]];
    [components setHour:-24];
    [components setMinute:0];
    [components setSecond:0];
    components = [cal components:NSWeekdayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:[[NSDate alloc] init]];
    [components setDay:([components day] - ([components weekday] - 1))];
    [components setDay:([components day] - 7)];
    [components setDay:([components day] - ([components day] -1))];
    NSDate *thisMonth = [cal dateFromComponents:components];    

    return thisMonth;
}

+ (NSDate *)lastMonth {
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ) fromDate:[[NSDate alloc] init]];
   
    [components setHour:-[components hour]];
    [components setMinute:-[components minute]];
    [components setSecond:-[components second]];
    [components setHour:-24];
    [components setMinute:0];
    [components setSecond:0];
    components = [cal components:NSWeekdayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:[[NSDate alloc] init]];
    [components setDay:([components day] - ([components weekday] - 1))];
    [components setDay:([components day] - 7)];
    [components setDay:([components day] - ([components day] -1))];
    [components setMonth:([components month] - 1)];
    NSDate *lastMonth = [cal dateFromComponents:components];
    
    return lastMonth;
}

+ (NSDate *)oneWeekAgo {
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:(NSHourCalendarUnit |
                                                    NSMinuteCalendarUnit |
                                                    NSSecondCalendarUnit)
                                          fromDate:[[NSDate alloc] init]];
    
    [components setDay:[components day] - 7];
    NSDate *oneWeekAgo  = [cal dateFromComponents:components];
    return oneWeekAgo;
}

+ (NSDate *)oneMonthAgo {
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:(NSHourCalendarUnit |
                                                    NSMinuteCalendarUnit |
                                                    NSSecondCalendarUnit)
                                          fromDate:[[NSDate alloc] init]];
    
    [components setDay:[components day] - 30];
    NSDate *oneWeekAgo  = [cal dateFromComponents:components];
    return oneWeekAgo;
}

@end
