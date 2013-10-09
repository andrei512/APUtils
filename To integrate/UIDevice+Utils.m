//
//  UIDevice+Utils.m
//  Point2Homes
//
//  Created by Bogdan Poplauschi on 10/3/13.
//  Copyright (c) 2013 Yardi. All rights reserved.
//

#import "UIDevice+Utils.h"

@implementation UIDevice (Utils)

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
