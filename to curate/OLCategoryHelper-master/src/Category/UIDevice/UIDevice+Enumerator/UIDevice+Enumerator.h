//
// UIDevice+Orientation.h
// OLCategoryHelper
//
// Created by Pay Liu on 13/9/10.
// Copyright (c) 2013年 Octalord Information Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

FOUNDATION_EXPORT NSString* NSStringFromUIDeviceOrientation(UIDeviceOrientation orientation);
FOUNDATION_EXPORT NSString* NSStringFromUIDeviceBatteryState(UIDeviceBatteryState state);
FOUNDATION_EXPORT NSString* NSStringFromUIUserInterfaceIdiom(UIUserInterfaceIdiom idiom);

@interface UIDevice (Enumerator)
/**
 *  String text of UIDeviceOrientation
 *
 *  @return orientation string
 */
- (NSString *) orientationString;

/**
 *  String text of UIDeviceBatteryState
 *
 *  @return battery state string
 */
- (NSString *) batteryStateString;

/**
 *  tring text of UIUserInterfaceIdiom
 *
 *  @return UserInterface idiom string
 */
- (NSString *) userInterfaceIdiomString;

@end
