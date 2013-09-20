//
// NSString+BOOL.m
// OLCategoryHelper
//
// Created by Pay Liu on 13/9/5.
// Copyright (c) 2013年 Octalord Information Inc. The MIT License.
//

#import "NSString+BOOL.h"

NSString* NSStringFromBOOL(BOOL boolValue)
{
    return boolValue == YES ? @"YES" : @"NO";
}

@implementation NSString (BOOL)

@end
