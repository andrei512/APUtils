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

@end
