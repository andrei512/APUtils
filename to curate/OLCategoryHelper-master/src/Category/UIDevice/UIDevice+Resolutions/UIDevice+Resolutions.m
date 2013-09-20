//
// UIDevice+Resolutions.m
// Simple UIDevice Category for handling different iOSs hardware resolutions
//
// Created by Daniele Margutti on 9/13/12.
// web: http://www.danielemargutti.com
// mail: daniele.margutti@gmail.com
// Copyright (c) 2012 Daniele Margutti.
//

#import "UIDevice+Resolutions.h"

@implementation UIDevice (Resolutions)

+ (UIDeviceResolution) currentResolution
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {

        if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {

            CGSize result = [[UIScreen mainScreen] bounds].size;

            result = CGSizeMake(result.width * [UIScreen mainScreen].scale, result.height * [UIScreen mainScreen].scale);

            if (result.height == 480) return UIDevice_iPhoneStandardRes;

            return (result.height == 960 ? UIDevice_iPhoneHiRes : UIDevice_iPhoneTallerHiRes);

        } else {

            return UIDevice_iPhoneStandardRes;
        }
    } else if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {

        CGSize result = [[UIScreen mainScreen] bounds].size;

        result = CGSizeMake(result.width * [UIScreen mainScreen].scale, result.height * [UIScreen mainScreen].scale);

        if (result.height == 1024) return UIDevice_iPadStandardRes;

        return UIDevice_iPadHiRes;

    } else {

        return UIDevice_iPadStandardRes;
    }
}

@end
