//
//  NSObject+DuckTyping.h
//  DevAPUtils
//
//  Created by Andrei Puni on 10/21/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (DuckTyping)

// tries to convert to a type
- (NSNumber *)asNumber;
- (NSString *)asString;
- (NSDate *)asDate;
- (NSArray *)asList;
- (NSArray *)asArray;
- (NSDictionary *)asDictionary;
- (NSDictionary *)asHash;

// nil or self if type
- (NSNumber *)ifNumber;
- (NSString *)ifString;
- (NSDate *)ifDate;
- (NSArray *)ifList;
- (NSArray *)ifArray;
- (NSDictionary *)ifDictionary;
- (NSDictionary *)ifHash;

@end
