//
//  NSObject+DuckTyping.m
//  DevAPUtils
//
//  Created by Andrei Puni on 10/21/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import "NSObject+DuckTyping.h"

@implementation NSObject (DuckTyping)

#pragma mark - AS DUCK

- (NSNumber *)asNumber {
    return nil;
}

- (NSString *)asString {
    return self.description;
}

- (NSDate *)asDate {
	return nil;
}

- (NSArray *)asList {
    return nil;
}

- (NSArray *)asArray {
    return nil;
}

- (NSDictionary *)asDictionary {
    return nil;
}

- (NSDictionary *)asHash {
    return nil;
}

#pragma mark - IF DUCK

- (NSNumber *)ifNumber {
    return [self isKindOfClass:[NSNumber class]] ? (NSNumber *)self : nil;
}

- (NSString *)ifString {
    return [self isKindOfClass:[NSString class]] ? (NSString *)self : nil;
}

- (NSDate *)ifDate {
	return [self isKindOfClass:[NSDate class]] ? (NSDate *)self : nil;	
}

- (NSArray *)ifList {
    return [self isKindOfClass:[NSArray class]] ? (NSArray *)self : nil;
}

- (NSArray *)ifArray {
    return [self isKindOfClass:[NSArray class]] ? (NSArray *)self : nil;
}

- (NSDictionary *)ifHash {
    return [self isKindOfClass:[NSDictionary class]] ? (NSDictionary *)self : nil;
}

- (NSDictionary *)ifDictionary {
    return [self isKindOfClass:[NSDictionary class]] ? (NSDictionary *)self : nil;
}

@end

