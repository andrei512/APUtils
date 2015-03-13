//
//  NSNumberFormatter+APUtils.m
//  DevAPUtils
//
//  Created by Stefan Sabau on 13/03/15.
//  Copyright (c) 2015 Andrei Puni. All rights reserved.
//

#import "NSNumberFormatter+APUtils.h"

@implementation NSNumberFormatter (APUtils)

+ (NSNumberFormatter *)threadSafeInstanceWithStyle:(NSNumberFormatterStyle)numberStyle behavior:(NSNumberFormatterBehavior)behavior {
    NSString *key = [@"NSNumberFormatter." stringByAppendingString:[NSString stringWithFormat:@"%lu.%lu", numberStyle, behavior]];
    
    NSMutableDictionary *threadDictionary = [[NSThread currentThread] threadDictionary];

    NSNumberFormatter *numberFormatter = threadDictionary[key];
    
    if (numberFormatter == nil || !(numberStyle == numberFormatter.numberStyle && behavior == numberFormatter.formatterBehavior)) { // if the style / behavior of the cached formatter has changed (maybe due to a call to setFormat)
        numberFormatter = [NSNumberFormatter new];
        
        [numberFormatter setNumberStyle:numberStyle];
        [numberFormatter setFormatterBehavior:behavior];
        
        threadDictionary[key] = numberFormatter;
    }
    
    return numberFormatter;
}

@end
