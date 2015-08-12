//
//  UIDevice+APUtils.h
//
//  Created by Andrei Puni on 6/27/13.
//

#import <UIKit/UIKit.h>

FOUNDATION_EXPORT NSString * NSStringFromUIDeviceOrientation(UIDeviceOrientation orientation);
FOUNDATION_EXPORT NSString * NSStringFromUIDeviceBatteryState(UIDeviceBatteryState state);
FOUNDATION_EXPORT NSString * NSStringFromUIUserInterfaceIdiom(UIUserInterfaceIdiom idiom);

typedef NS_ENUM (NSUInteger, UIDeviceResolution) {
    UIDevice_iPhoneStandardRes = 1,          // iPhone 1,3,3GS Standard Resolution   (320x480px)
    UIDevice_iPhoneHiRes = 2,                // iPhone 4,4S High Resolution          (640x960px)
    UIDevice_iPhoneTallerHiRes = 3,          // iPhone 5 High Resolution             (640x1136px)
    UIDevice_iPadStandardRes = 4,            // iPad 1,2 Standard Resolution         (1024x768px)
    UIDevice_iPadHiRes = 5                   // iPad 3 High Resolution               (2048x1536px)
};


@interface UIDevice (APUtils)

// iPhone, iPad, iPod, Simulator
+ (NSString *)deviceType;

/**
 *  String text of UIDeviceOrientation
 *
 *  @return orientation string
 */
- (NSString *)orientationString;

/**
 *  String text of UIDeviceBatteryState
 *
 *  @return battery state string
 */
- (NSString *)batteryStateString;

/**
 *  tring text of UIUserInterfaceIdiom
 *
 *  @return UserInterface idiom string
 */
- (NSString *)userInterfaceIdiomString;

+ (UIDeviceResolution)currentResolution;

// Versions

- (NSInteger)majorSystemVersion;
- (float)minorSystemVersion;
- (BOOL)isIOS8;
- (BOOL)isIOS8OrLater;
- (BOOL)isIOS7;
- (BOOL)isIOS7OrLater;
- (BOOL)isIOS6OrEarlier;
- (BOOL)isIOS6;

@end
