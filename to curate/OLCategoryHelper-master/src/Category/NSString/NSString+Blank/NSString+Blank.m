//
// NSString+Blank.m
// OLCategoryHelper
//
// Created by Pay Liu on 13/9/14.
// Copyright (c) 2013年 Octalord Information Inc. All rights reserved.
//

#import "NSString+Blank.h"

@implementation NSString (Blank)

- (BOOL) isBlank
{
    BOOL blank = NO;

    if (self.length == 0) {

        blank = YES;

    } else if ( [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0) {

        blank = YES;
    }

    return blank;
}

- (BOOL) isNotBlank
{
    return ![self isBlank];
}

- (BOOL) isEmpty
{
    BOOL empty = NO;

    if (self.length == 0) {

        empty = YES;
    }

    return empty;
}

- (BOOL) isNotEmpty
{
    return ![self isEmpty];
}

@end
