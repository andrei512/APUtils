//
// UIImage+H568.m
//
// Created by Pay on 13/2/25.
// Copyright (c) 2013年 Octalord. The MIT License
//

#import "UIImage+H568.h"
#import "UIDevice+Resolutions.h"

@implementation UIImage (H568)

+ (UIImage *) imageNamedH568:(NSString *)name
{
    NSString *filename = nil;

    if ([UIDevice currentResolution] == UIDevice_iPhoneTallerHiRes) {

        filename = [name stringByAppendingFormat:@"-568h"];  // auto detect @2x

    } else {

        filename = [NSString stringWithString:name];
    }

    return [UIImage imageNamed:filename];
}

@end