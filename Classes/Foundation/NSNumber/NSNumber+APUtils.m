//
//  NSNumber+APUtils.m
//
//  Created by Andrei Puni on 5/29/13.
//

#import "NSNumber+APUtils.h"

@implementation NSNumber (APUtils)

- (NSString *)formattedString {
    static NSNumberFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSNumberFormatter alloc] init];
        [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
        [formatter setGroupingSeparator:@","];
        [formatter setDecimalSeparator:@"."];
        [formatter setMaximumFractionDigits:2];
    }
    return [formatter stringForObjectValue:self];
}

- (NSString *)formattedStringWithCurrency:(NSString *)currency {
    if (!currency) {
        currency = @"USD";
    }
    
    NSString *key = [@"NSNumberFormatterWithCurrency." stringByAppendingString:currency];
    
    NSMutableDictionary *threadDictionary = [[NSThread currentThread] threadDictionary];
    NSNumberFormatter *numberFormatter = threadDictionary[key];
    
    if (!numberFormatter || ![currency isEqualToString:numberFormatter.currencyCode]) { // if the currency code of the cached number formatter has changed (maybe due to an explicit call to setCurrencyCode)
        numberFormatter = [[NSNumberFormatter  alloc] init];
        [numberFormatter setGroupingSeparator:@","];
        [numberFormatter setDecimalSeparator:@"."];
        [numberFormatter setMaximumFractionDigits:0];
        [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
        [numberFormatter setCurrencyCode:currency];
        
        threadDictionary[key] = numberFormatter;
    }
    
    return [numberFormatter stringForObjectValue:self];
}

- (NSDate *)dateValue {
    return [NSDate dateWithTimeIntervalSince1970:[self doubleValue]];      // if self is nil, its doubleValue is 0.0
}

+ (int)randomInt:(int)maxInt {
    return arc4random() % maxInt;
}

+ (BOOL)randomBool {
    return arc4random() % 2 ? YES : NO;
}

- (NSString *)shortDescription {
    int intValue = self.intValue;
    if (intValue < 1000) {
        return [NSString stringWithFormat:@"%d", intValue];
    } else if (intValue < 1000000) {
        return [NSString stringWithFormat:@"%dK", intValue / 1000];
    } else {
        double inMillions = self.doubleValue / 1e6;
        double afterTheDot = inMillions - ((int)inMillions);
        
        if (afterTheDot < 1e-7 ||
            afterTheDot > 0.95) {
            return [NSString stringWithFormat:@"%.0fM", inMillions];
        } else {
            return [NSString stringWithFormat:@"%.1fM", inMillions];
        }
    }
}

@end
