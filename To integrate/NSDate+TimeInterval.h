//
//  NSDate+TimeInterval.h
//  Point2Homes
//
//  Created by Andrei Puni on 9/12/13.
//  Copyright (c) 2013 Yardi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (TimeInterval)

+ (NSDictionary *)timeIntervalNamed:(NSString *)intervalName;

+ (NSDictionary *)timeIntervalWithBeginDate:(NSDate *)beginDate
                                 andEndDate:(NSDate *)endDate;

+ (NSDictionary *)todayTimeInterval;
+ (NSDictionary *)thisWeekTimeInterval;
+ (NSDictionary *)thisWeekendTimeInterval;
+ (NSDictionary *)sinceNowTimeInterval;

// returns the N-th day from a week
- (NSDate *)getWeekday:(int)weekdayNumber;

// keeps only the year, month and day of the month
- (NSDate *)simpleDate;

#pragma mark - Date Formating

- (NSString *)formatedDate;

- (NSString *)formatedDateWithFormat:(NSString *)dateFormat;

@end
