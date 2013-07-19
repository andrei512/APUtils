//
//  NSUserDefaults+Utils.m
//
//  Created by Andrei Puni on 7/9/13.
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
