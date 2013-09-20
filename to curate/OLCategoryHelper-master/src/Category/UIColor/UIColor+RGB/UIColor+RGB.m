//
// UIColor+RGB.m
// OLCategoryHelper
//
// Created by Pay Liu on 13/9/5.
// Copyright (c) 2013年 Octalord Information Inc. The MIT License.
//

#import "UIColor+RGB.h"

UIColor* UIColorFromRGB(float r, float g, float b)
{
    return [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:1.0f];
}

UIColor* UIColorFromRGBA(float r, float g, float b, float a)
{
    return [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:a];
}

@implementation UIColor (RGB)

@end
