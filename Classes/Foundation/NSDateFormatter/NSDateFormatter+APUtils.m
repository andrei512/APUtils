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
    
    if (dateFormatter == nil
        || ![inDateFormat isEqualToString:dateFormatter.dateFormat]) { // if the format of the cached date formatter has changed (maybe due to a call to setFormat)
        dateFormatter = [[NSDateFormatter alloc] init];
        
        // See https://developer.apple.com/library/ios/qa/qa1480/_index.html. Also flagged by FauxPasApp.
        NSLocale *enUSPOSIXLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        [dateFormatter setLocale:enUSPOSIXLocale];
        
        [dateFormatter setDateFormat:inDateFormat];
        
        threadDictionary[key] = dateFormatter;
    }
    
    return dateFormatter;
}

@end
