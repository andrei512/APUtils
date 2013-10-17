//
//  NSObject+Decorators.m
//  DevAPUtils
//
//  Created by Andrei on 10/17/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import "NSObject+Decorators.h"
#import <objc/runtime.h>

#define MAX_NR_CLASSES (1<<14) // 64 KB cache


@implementation NSObject (Decorators)

+ (const char *)classKey {
    // this is the class key hash
    static const char **stash = NULL;
    
    static int cnt = 0;
    if (stash == NULL) {
        stash = (const char **)calloc(MAX_NR_CLASSES, sizeof(const char *));
    }
    
    const char *className = NSStringFromClass([self class]).UTF8String;
    
    // see if the key was
    for (int i = 0; i < cnt; ++i) {
        if (strcmp(className, stash[i]) == 0) {
            return stash[i];
        }
    }
    
    stash[cnt++] = className;
    return className;
}

+ (instancetype)decorator {
    static NSLock *lock = nil;
    if (lock == nil) {
        lock = [[NSLock alloc] init];
    }
    
    static id oracle = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        oracle = [[NSObject alloc] init];
    });
    
    const char *key = [self classKey];
    
    
    id decorator = objc_getAssociatedObject(oracle, key);
    if (decorator == nil) {
        decorator = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(oracle, key, decorator, OBJC_ASSOCIATION_RETAIN);
    }

    return objc_getAssociatedObject(oracle, key);
}


#pragma mark - Object Subscripting

- (id)objectForKeyedSubscript:(id <NSCopying>)key {
    return [self valueForKey:(NSString *)key];
}

- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key {
    [self setValue:obj forKey:(NSString *)key];
}

@end
