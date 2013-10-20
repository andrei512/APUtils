//
//  UIDevice+APUtils.m
//
//  Created by Andrei Puni on 6/27/13.
//

#import "UIDevice+APUtils.h"
#import "NSString+APUtils.h"

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

- (NSString *) orientationString {
    return NSStringFromUIDeviceOrientation(self.orientation);
}

- (NSString *) batteryStateString {
    return NSStringFromUIDeviceBatteryState(self.batteryState);
}

- (NSString *) userInterfaceIdiomString {
    return NSStringFromUIUserInterfaceIdiom(self.userInterfaceIdiom);
}

+ (UIDeviceResolution)currentResolution {
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

#pragma mark - Versions

static NSString *systemVersion = nil;

- (NSInteger)majorSystemVersion {
    if (!systemVersion.length) {
        systemVersion = [self systemVersion];
    }
    return [systemVersion integerValue];
}

- (float)minorSystemVersion {
    if (!systemVersion.length) {
        systemVersion = [self systemVersion];
    }
    return [systemVersion floatValue] - [systemVersion integerValue];
}

- (BOOL)isIOS7OrLater {
    return ([self majorSystemVersion] >= 7);
}

- (BOOL)isIOS7 {
    return ([self majorSystemVersion] == 7);
}

- (BOOL)isIOS6OrEarlier {
    return ([self majorSystemVersion] <= 6);
}

- (BOOL)isIOS6 {
    return ([self majorSystemVersion] == 6);
}


@end
