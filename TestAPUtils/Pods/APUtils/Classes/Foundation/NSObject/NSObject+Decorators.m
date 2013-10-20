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

@interface NSObject(DecoratorsPrivate)

@property (nonatomic, strong) NSMutableArray *__transf;
@property (nonatomic, strong) NSMutableArray *__maping;

@end

@implementation NSObject (Decorators)

+ (const char *)classKey {
    // this is the class key hash
    static const char **stash = NULL;
    
    static int cnt = 0;
    if (stash == NULL) {
        stash = (const char **)calloc(MAX_NR_CLASSES, sizeof(const char *));
    }
    
    const char *className = NSStringFromClass([self class]).UTF8String;
    
    // see if the key was in the stash
    for (int i = 0; i < cnt; ++i) {
        if (strcmp(className, stash[i]) == 0) {
            return stash[i];
        }
    }
    
    // keep the key
    int length = strlen(className);
    stash[cnt] = (const char *)calloc(length, length);
    cnt++;
    
    return className;
}

+ (NSMutableArray *)transformations {
    NSObject *d = (NSObject *)[self decorator];
    if (d.__transf == nil) {
        d.__transf = [NSMutableArray array];
    }
    return d.__transf;
}

+ (NSMutableArray *)mappings {
    NSObject *d = (NSObject *)[self decorator];
    if (d.__maping == nil) {
        d.__maping = [NSMutableArray array];
    }
    return d.__transf;
}


+ (instancetype)decorator {
    // All decorators are linked to the oracle
    static id oracle = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        oracle = [[NSObject alloc] init];
    });
    
    const char *key = [self classKey];
    
    id decorator = objc_getAssociatedObject(oracle, key);
    if (decorator == nil) {
        decorator = [self new];
        objc_setAssociatedObject(oracle, key, decorator, OBJC_ASSOCIATION_RETAIN);
    }

    return decorator;
}


#pragma mark - Object Subscripting

- (id)objectForKeyedSubscript:(id <NSCopying>)key {
    return [self valueForKey:(NSString *)key];
}

- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key {
    [self setValue:obj forKey:(NSString *)key];
}

@end
