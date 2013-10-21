//
//  NSObject+Phoenix.h
//  Clomp
//
//  Created by Andrei on 8/11/12.
//  Copyright (c) 2012 Whatevra. All rights reserved.
//

#import <Foundation/Foundation.h>


#import "NSObject+APRuntime.h"
#import "NSObject+Decorators.h"
#import "NSObject+DuckTyping.h"


@interface NSObject (Model)

// Json referes to Obj-c equivalent to JSON using NSArray, NSDictionary,
// NSString, NSNumber and NSNull
+ (instancetype)fromJson:(id)data;
- (instancetype)fromJson:(id)data;

- (NSDictionary *)asJson;
- (NSDictionary *)asUnserscoredJson;

+ (NSString *)className;
- (NSString *)className;

- (NSString *)hashKey;

#pragma mark - Class Derivation

- (Class)classByRemovingSuffix:(NSString *)suffix;
+ (Class)classByRemovingSuffix:(NSString *)suffix;

- (Class)classByReplacingSuffix:(NSString *)suffix with:(NSString *)replacement;
+ (Class)classByReplacingSuffix:(NSString *)suffix with:(NSString *)replacement;

- (Class)classByAddingSuffix:(NSString *)suffix;
+ (Class)classByAddingSuffix:(NSString *)suffix;

- (id)safePerform:(SEL)selector;
- (id)safePerform:(SEL)selector withObject:(id)object;


@end


