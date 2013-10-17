//
//  NSObject+Decorators.h
//  DevAPUtils
//
//  Created by Andrei on 10/17/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Decorators)

+ (instancetype)decorator;

// Object subscripting

- (id)objectForKeyedSubscript:(id <NSCopying>)key;
- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key;


@end
