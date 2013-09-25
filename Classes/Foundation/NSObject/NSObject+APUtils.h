//
//  NSObject+Phoenix.h
//  Clomp
//
//  Created by Andrei on 8/11/12.
//  Copyright (c) 2012 Whatevra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Model)

- (id)loadFrom:(id)data;
- (id)ashes;
- (id)ashes:(BOOL)underscored;

+ (id)createFrom:(id)data;

- (NSString *)className;

- (NSString *)hashKey;

- (Class)classByRemovingSuffix:(NSString *)suffix;
+ (Class)classByRemovingSuffix:(NSString *)suffix;

- (Class)classByReplacingSuffix:(NSString *)suffix with:(NSString *)replacement;
+ (Class)classByReplacingSuffix:(NSString *)suffix with:(NSString *)replacement;

- (Class)classByAddingSuffix:(NSString *)suffix;
+ (Class)classByAddingSuffix:(NSString *)suffix;

- (id)safePerform:(SEL)selector;
- (id)safePerform:(SEL)selector withObject:(id)object;

@end


