//
//  UIDevice+Utils.h
//  Point2Homes
//
//  Created by Bogdan Poplauschi on 10/3/13.
//  Copyright (c) 2013 Yardi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Utils)

- (NSInteger)majorSystemVersion;
- (float)minorSystemVersion;
- (BOOL)isIOS7OrLater;
- (BOOL)isIOS7;
- (BOOL)isIOS6OrEarlier;
- (BOOL)isIOS6;

@end
