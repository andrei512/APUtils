//
//  NSDateFormatter+APUtils.m
//  DevAPUtils
//
//  Created by Bogdan Poplauschi on 27/11/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import "NSDateFormatter+APUtils.h"

@implementation NSDateFormatter (APUtils)

+ (NSDateFormatter *)threadSafeInstanceWithFormat:(NSString *)inDateFormat {
    NSParameterAssert(inDateFormat);
    
    NSString *key = [@"NSDateFormatter." stringByAppendingString:inDateFormat];
    
    NSMutableDictionary *threadDictionary = [[NSThread currentThread] threadDictionary];
    NSDateFormatter *dateFormatter = threadDictionary[key];
    
    if (dateFormatter == nil) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:inDateFormat];
        
        threadDictionary[key] = dateFormatter;
    }
    
    return dateFormatter;
}

@end
