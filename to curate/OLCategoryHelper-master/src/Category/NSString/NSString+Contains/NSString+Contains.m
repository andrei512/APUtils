//
// NSString+Contains.m
// OLCategoryHelper
//
// Created by Pay Liu on 13/9/20.
// Copyright (c) 2013年 Octalord Information Inc. The MIT License
//

#import "NSString+Contains.h"

@implementation NSString (Contains)

- (BOOL) containsString:(NSString *)substring
{
    NSRange range = [self rangeOfString:substring];
    BOOL found = (range.location != NSNotFound);

    return found;
}

@end
