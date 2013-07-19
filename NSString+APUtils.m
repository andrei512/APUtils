//
//  NSString+APUtils.m
//
//  Created by Andrei Puni on 4/18/13.
//

#import "NSString+APUtils.h"

NSString *CamelCaseToUnderscores(NSString *input) {
    NSMutableString *output = [NSMutableString string];
    NSCharacterSet *uppercase = [NSCharacterSet uppercaseLetterCharacterSet];
    for (NSInteger idx = 0; idx < [input length]; idx += 1) {
        unichar c = [input characterAtIndex:idx];
        if ([uppercase characterIsMember:c]) {
            [output appendFormat:@"%s%C", (idx == 0 ? "" : "_"), (unichar)(c ^ 32)];
        } else {
            [output appendFormat:@"%C", c];
        }
    }
    return output;
}

NSString *UnderscoresToCamelCase(NSString *underscores) {
    NSMutableString *output = [NSMutableString string];
    BOOL makeNextCharacterUpperCase = NO;
    for (NSInteger idx = 0; idx < [underscores length]; idx += 1) {
        unichar c = [underscores characterAtIndex:idx];
        if (c == '_') {
            makeNextCharacterUpperCase = YES;
        } else if (makeNextCharacterUpperCase) {
            [output appendString:[[NSString stringWithCharacters:&c length:1] uppercaseString]];
            makeNextCharacterUpperCase = NO;
        } else {
            [output appendFormat:@"%C", c];
        }
    }
    return output;
}

NSString *CapitalizeFirst(NSString *source) {
    if ([source length] == 0) {
        return source;
    }
    return [source stringByReplacingCharactersInRange:NSMakeRange(0, 1)
                                           withString:[[source substringWithRange:NSMakeRange(0, 1)] capitalizedString]];
}


@implementation NSString (Utils)

- (NSString *)stringByRemovingSuffix:(NSString *)suffix {
    if (suffix.length > self.length) {
        return nil;
    }
    if (suffix.length == 0) {
        return self;
    }
    NSString *s = [self substringFromIndex:self.length - suffix.length];
    if ([s isEqualToString:suffix]) {
        return [self substringToIndex:self.length - suffix.length];
    } else {
        return nil;
    }
}

- (BOOL)containsString:(NSString *)substring {
    NSRange suffixRange = [self rangeOfString:substring];
    
    if (suffixRange.location != NSNotFound) {
        return YES;
    }
    
    return NO;
}

- (BOOL)containsString:(NSString *)substring caseSensitive:(BOOL)sensitive {
    NSRange suffixRange = [self rangeOfString:substring options:NSCaseInsensitiveSearch];
    if (sensitive == YES) {
        suffixRange = [self rangeOfString:substring];
    }
    
    if (suffixRange.location != NSNotFound) {
        return YES;
    }
    
    return NO;
}

- (BOOL)matches:(NSString *)pattern {
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    if(regex == nil) {
        return NO;
    }
    
    NSUInteger n = [regex numberOfMatchesInString:self options:0 range:NSMakeRange(0, [self length])];
    return n == 1;
}

@end
