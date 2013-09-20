//
// NSNumber+Random.m
// OLCategoryHelper
//
// Created by Pay Liu on 13/9/5.
// Copyright (c) 2013年 Octalord Information Inc. The MIT License
//

#import "NSNumber+Random.h"

@implementation NSNumber (Random)

+ (int) randomInt:(int)maxInt
{
    int r = arc4random() % maxInt;

    return r;
}

+ (BOOL) randomBool
{
    return [NSNumber randomInt:2] != 0 ? YES : NO;
}

@end
