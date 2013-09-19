//
//  UIDevice+APUtils.m
//
//  Created by Andrei Puni on 6/27/13.
//

#import "UIDevice+APUtils.h"
#import "NSString+APUtils.h"

@implementation UIDevice (APUtils)

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
