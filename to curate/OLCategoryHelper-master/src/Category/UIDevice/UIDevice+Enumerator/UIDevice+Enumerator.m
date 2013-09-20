//
// UIDevice+Orientation.m
// OLCategoryHelper
//
// Created by Pay Liu on 13/9/10.
// Copyright (c) 2013年 Octalord Information Inc. All rights reserved.
//

#import "UIDevice+Enumerator.h"

NSString* NSStringFromUIDeviceOrientation(UIDeviceOrientation orientation)
{
    NSString *value = nil;

    if (orientation == UIDeviceOrientationUnknown) {

        value = @"UIDeviceOrientationUnknown";

    } else if (orientation == UIDeviceOrientationPortrait) {

        value = @"UIDeviceOrientationPortrait";

    } else if (orientation == UIDeviceOrientationPortraitUpsideDown) {

        value = @"UIDeviceOrientationPortraitUpsideDown";

    } else if (orientation == UIDeviceOrientationLandscapeLeft) {

        value = @"UIDeviceOrientationLandscapeLeft";

    } else if (orientation == UIDeviceOrientationLandscapeRight) {

        value = @"UIDeviceOrientationLandscapeRight";

    } else if (orientation == UIDeviceOrientationFaceUp) {

        value = @"UIDeviceOrientationFaceUp";

    } else if (orientation == UIDeviceOrientationFaceDown) {

        value = @"UIDeviceOrientationFaceDown";

    } else {

        value = @"";
    }

    return value;
}

NSString* NSStringFromUIDeviceBatteryState(UIDeviceBatteryState state)
{
    NSString *value = nil;

    if (state == UIDeviceBatteryStateUnknown) {

        value = @"UIDeviceBatteryStateUnknown";

    } else if (state == UIDeviceBatteryStateUnplugged) {

        value = @"UIDeviceBatteryStateUnplugged";

    } else if (state == UIDeviceBatteryStateCharging) {

        value = @"UIDeviceBatteryStateCharging";

    } else if (state == UIDeviceBatteryStateFull) {

        value = @"UIDeviceBatteryStateFull";

    } else {

        value = @"";
    }

    return value;
}

NSString* NSStringFromUIUserInterfaceIdiom(UIUserInterfaceIdiom idiom)
{
    NSString *value = nil;

    if (idiom == UIUserInterfaceIdiomPhone) {

        value = @"UIUserInterfaceIdiomPhone";

    } else if (idiom == UIUserInterfaceIdiomPad) {

        value = @"UIUserInterfaceIdiomPad";

    } else {

        value = @"";
    }

    return value;
}

@implementation UIDevice (Enumerator)

- (NSString *) orientationString
{
    return NSStringFromUIDeviceOrientation(self.orientation);
}

- (NSString *) batteryStateString
{
    return NSStringFromUIDeviceBatteryState(self.batteryState);
}

- (NSString *) userInterfaceIdiomString
{
    return NSStringFromUIUserInterfaceIdiom(self.userInterfaceIdiom);
}

@end
