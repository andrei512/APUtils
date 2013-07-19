//
//  UITextField+Utils.m
//  Point2Homes
//
//  Created by Andrei Puni on 4/30/13.
//  Copyright (c) 2013 Point2. All rights reserved.
//

#import "UITextField+Utils.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

#import <objc/runtime.h>

#define kStoreKey @"wshyuxxvtubrzrcukofb"

static const char kUnformattedText;

@implementation UITextField (Utils)

+ (void)clearStoredTexts {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:@{} forKey:kStoreKey];
    [userDefaults synchronize];
}

+ (void)saveText:(NSString *)text forIdentifier:(NSString *)identifier {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *old = [userDefaults objectForKey:kStoreKey];
    NSMutableDictionary *new = [NSMutableDictionary dictionaryWithDictionary:old];
    new[identifier] = text ? text : @"";
    [userDefaults setObject:new forKey:kStoreKey];
    [userDefaults synchronize];
}

- (void)persistAs:(NSString *)identifier {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *store = [userDefaults objectForKey:kStoreKey];
    
    self.text = store[identifier];
    
    [[RACAble(self.text) throttle:0.6] subscribeNext:^(id text) {
        [[UITextField class] saveText:text forIdentifier:identifier];
    }];
}

#pragma mark - Properties

- (void)setUnformattedText:(NSString *)unformattedText {
    objc_setAssociatedObject(self, &kUnformattedText, unformattedText, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)unformattedText {
    return objc_getAssociatedObject(self, &kUnformattedText);
}

@end
