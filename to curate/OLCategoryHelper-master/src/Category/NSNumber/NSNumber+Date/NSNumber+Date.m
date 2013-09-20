//
// NSNumber+Helper.m
//
// Created by Pay on 13/3/19.
// Copyright (c) 2013年 Octalord. The MIT License
//

#import "NSNumber+Date.h"

@implementation NSNumber (Date)

- (NSDate *) dateValue
{
    return [NSDate dateWithTimeIntervalSince1970:[self doubleValue]];      // if self is nil, its doubleValue is 0.0
}

@end
