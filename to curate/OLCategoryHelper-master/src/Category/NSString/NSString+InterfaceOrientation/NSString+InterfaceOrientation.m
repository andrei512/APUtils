//
// NSString+InterfaceOrientation.m
// OLCategoryHelper
//
// Created by Pay Liu on 13/9/10.
// Copyright (c) 2013年 Octalord Information Inc. All rights reserved.
//

#import "NSString+InterfaceOrientation.h"

NSString* NSStringFromUIInterfaceOrientation(UIInterfaceOrientation orientation)
{
    NSString *value = nil;

    if (orientation == UIInterfaceOrientationPortrait) {

        value = @"UIInterfaceOrientationPortrait";

    } else if (orientation == UIInterfaceOrientationPortraitUpsideDown) {

        value = @"UIInterfaceOrientationPortraitUpsideDown";

    } else if (orientation == UIInterfaceOrientationLandscapeLeft) {

        value = @"UIInterfaceOrientationLandscapeLeft";

    } else if (orientation == UIInterfaceOrientationLandscapeRight) {

        value = @"UIInterfaceOrientationLandscapeRight";

    } else {

        value = @""; // unknown
    }

    return value;
}

@implementation NSString (InterfaceOrientation)

@end
