//
//  NSUserDefaults+Utils.m
//  Point2Homes
//
//  Created by Andrei Puni on 7/9/13.
//  Copyright (c) 2013 Point2. All rights reserved.
//

#import "NSUserDefaults+Utils.h"

@implementation NSUserDefaults (Utils)

+ (BOOL)setUserValue:(id)value forKey:(id)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setValue:value forKey:key];
    return [userDefaults synchronize];
}

+ (id)valueForKey:(NSString *)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults valueForKey:key];
}

@end
