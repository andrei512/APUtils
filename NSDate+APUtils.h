//
//  NSDate+Utils.h
//
//  Created by Andrei Puni on 5/21/13.
//

#import <Foundation/Foundation.h>

@interface NSDate (Utils)

+ (NSDate *)today;
+ (NSDate *)yesterday;
+ (NSDate *)thisWeek;
+ (NSDate *)lastWeek;
+ (NSDate *)thisMonth;
+ (NSDate *)lastMonth;

+ (NSDate *)oneWeekAgo;
+ (NSDate *)oneMonthAgo;

@end
