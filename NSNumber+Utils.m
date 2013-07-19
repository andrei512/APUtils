//
//  NSNumber+Utils.m
//  Point2Homes
//
//  Created by Andrei Puni on 5/29/13.
//  Copyright (c) 2013 Point2. All rights reserved.
//

#import "NSNumber+Utils.h"

@implementation NSNumber (Utils)

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
    static NSNumberFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSNumberFormatter alloc] init];
        [formatter setCurrencyCode:ifXnilY(currency, @"USD")];
        [formatter setGroupingSeparator:@","];
        [formatter setDecimalSeparator:@"."];
        [formatter setMaximumFractionDigits:0];
        [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    }
    return [formatter stringForObjectValue:self];
}

@end
