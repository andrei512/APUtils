//
// NSNumber+Date.h
//
// Created by Pay on 13/3/19.
// Copyright (c) 2013年 Octalord. The MIT License
//

#import <Foundation/Foundation.h>

@interface NSNumber (Date)

/**
 *  return a NSDate value base on unix time in seconds
 *
 *  @return a NSDate value
 */
- (NSDate *) dateValue;

@end
