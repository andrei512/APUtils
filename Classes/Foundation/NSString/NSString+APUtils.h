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

@interface NSString (Utils)

- (NSString *)stringByRemovingSuffix:(NSString *)suffix;
- (BOOL)containsString:(NSString *)substring;
- (BOOL)containsString:(NSString *)substring caseSensitive:(BOOL)sensitive;


- (BOOL)matches:(NSString *)pattern;


@end
