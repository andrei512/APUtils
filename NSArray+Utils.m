//
//  NSArray+Utils.m
//  Point2Homes
//
//  Created by Andrei Puni on 4/29/13.
//  Copyright (c) 2013 Point2. All rights reserved.
//

#import "NSArray+Utils.h"

@implementation NSArray (Utils)

- (NSMutableArray *)filter:(BoolBlock)block {
    NSMutableArray *result = [NSMutableArray array];
    for (id object in self) {
        if (block(object)) {
            [result addObject:object];
        }
    }
    return result;
}

- (NSMutableArray *)map:(ObjectBlock)block {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.count];
    for (id object in self) {
        [result addObject:block(object)];
    }
    return result;
}

#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
- (NSMutableArray *)mapWithSelector:(SEL)selector {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.count];
    for (id object in self) {
        [result addObject:[object performSelector:selector]];
    }
    return result;
}


- (NSMutableArray *)mapToClass:(Class)objectClass {
    return [self map:^id(id object) {
        return [objectClass createFrom:object];
    }];
}

+ (NSArray *)arrayFromPlistNamed:(NSString *)name {
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"plist"];
    return [NSArray arrayWithContentsOfFile:path];
}


@end
