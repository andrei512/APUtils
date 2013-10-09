//
//  NSNumber+APUtils.m
//
//  Created by Andrei Puni on 5/29/13.
//

#import "NSNumber+APUtils.h"

@implementation NSNumber (APUtils)

- (NSString *)formatedString {
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

- (NSString *)formatedStringWithCurrency:(NSString *)currency {
    NSNumberFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSNumberFormatter alloc] init];
        [formatter setCurrencyCode:currency ?: @"USD"];
        [formatter setGroupingSeparator:@","];
        [formatter setDecimalSeparator:@"."];
        [formatter setMaximumFractionDigits:0];
        [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    }
    return [formatter stringForObjectValue:self];
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

@end
