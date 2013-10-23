//
//  NSString+APUtils.h
//
//  Created by Andrei Puni on 4/18/13.
//

#import <Foundation/Foundation.h>

NSString *CamelCaseToUnderscores(NSString *input);
NSString *UnderscoresToCamelCase(NSString *underscores);
NSString *CapitalizeFirst(NSString *source);

#define kNumberRegex @"^(\\d+(\\.\\d*)?)?$"
#define kIntegerRegex @"^\\d*$"
#define kEmailRegex @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"

typedef NSArray *(^APArrayStringBlock)(NSString *);

@interface NSString (APUtils)

@property (nonatomic, readonly) APArrayStringBlock splitBlock;

- (NSString *)stringByRemovingSuffix:(NSString *)suffix;
- (BOOL)containsString:(NSString *)substring;
- (BOOL)containsString:(NSString *)substring caseSensitive:(BOOL)sensitive;


- (BOOL)matches:(NSString *)pattern;

- (NSString *)stringByEscapingPercents;
- (NSString *)stringByUnscapingPercents;

- (NSString *)stringByBase64EncodingString;
- (NSString *)stringByBase64DecodingString;
- (NSData   *)dataByBase64DecodingString;

- (NSString *)HMAC_SHA1SignatureWithKey:(NSString *)signingKey;
+ (NSString *)randomStringWithLength:(NSUInteger)length;

- (NSData   *)UTF8Data;

@end

/**
 *  get bool string
 *
 *  @param boolValue bool value
 *
 *  @return bool string, @"YES" or @"NO"
 */
FOUNDATION_EXPORT NSString* NSStringFromBOOL(BOOL boolValue);