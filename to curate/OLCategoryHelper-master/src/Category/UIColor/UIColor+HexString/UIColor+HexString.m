//
// UIColor+HexString.m
//
// Created by Pay on 13/3/14.
// Copyright (c) 2013年 Octalord. The MIT License
//

#import "UIColor+HexString.h"

@implementation UIColor (HexString)

+ (UIColor *) colorWithHex:(int)hex
{
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0
                           green:((float)((hex & 0xFF00) >> 8)) / 255.0
                            blue:((float)(hex & 0xFF)) / 255.0 alpha:1.0];
}

@end
