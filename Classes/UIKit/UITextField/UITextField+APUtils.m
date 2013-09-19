//
//  UITextField+APUtils.m
//
//  Created by Andrei Puni on 4/30/13.
//

#import "UITextField+APUtils.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

#import <objc/runtime.h>

#define kStoreKey @"UITextField-text-store"

@implementation UITextField (APUtils)

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

@end
