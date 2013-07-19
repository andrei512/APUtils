//
//  UIDevice+Utils.m
//  Point2Homes
//
//  Created by Andrei Puni on 6/27/13.
//  Copyright (c) 2013 Point2. All rights reserved.
//

#import "UIDevice+Utils.h"
#import "NSString+Utils.h"

@implementation UIDevice (Utils)

+ (NSString *)deviceType {
    NSString *devicePlatform = [[UIDevice currentDevice] model];
    if ([devicePlatform containsString:@"iPod" caseSensitive:NO]) {
        return @"iPod";
    }
    if ([devicePlatform containsString:@"iPhone" caseSensitive:NO]) {
        return @"iPhone";
    }
    if ([devicePlatform containsString:@"iPad" caseSensitive:NO]) {
        return @"iPad";
    }
    return devicePlatform;
}

@end
