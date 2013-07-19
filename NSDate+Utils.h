//
//  NSDate+Utils.h
//  Point2Homes
//
//  Created by Andrei Puni on 5/21/13.
//  Copyright (c) 2013 Point2. All rights reserved.
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
