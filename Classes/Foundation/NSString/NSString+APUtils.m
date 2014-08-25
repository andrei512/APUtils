//
//  NSString+APUtils.m
//
//  Created by Andrei Puni on 4/18/13.
//

#import "NSString+APUtils.h"
#import "NSData+APUtils.h"
#import <CommonCrypto/CommonHMAC.h>

// code from: http://stackoverflow.com/questions/1918972/camelcase-to-underscores-and-back-in-objective-c
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


@implementation NSString (APUtils)

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

- (NSString *)stringByEscapingPercents{
    NSString *result = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
																					(CFStringRef)self,
																					NULL,
																					CFSTR("!*'();:@&=+$,/?%#[]"),
																					kCFStringEncodingUTF8);
	return result;
}

- (NSString *)stringByUnscapingPercents{
    NSString *result = (__bridge NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
																									(CFStringRef)self,
																									CFSTR(""),
																									kCFStringEncodingUTF8);
	return result;
}

- (NSString *)HMAC_SHA1SignatureWithKey:(NSString *)signingKey{
	const char *keyBytes = [signingKey cStringUsingEncoding:NSUTF8StringEncoding];
    const char *baseStringBytes = [self cStringUsingEncoding:NSUTF8StringEncoding];
    unsigned char digestBytes[CC_SHA1_DIGEST_LENGTH];
    
	CCHmacContext ctx;
    CCHmacInit(&ctx, kCCHmacAlgSHA1, keyBytes, strlen(keyBytes));
	CCHmacUpdate(&ctx, baseStringBytes, strlen(baseStringBytes));
	CCHmacFinal(&ctx, digestBytes);
    
	NSData *digestData = [NSData dataWithBytes:digestBytes length:CC_SHA1_DIGEST_LENGTH];
	NSString *signatureString = [digestData stringByBase64EncodingData];
	return signatureString;
}

+ (NSString *)randomStringWithLength:(NSUInteger)length{
	static NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	
	NSMutableString *randomString = [NSMutableString stringWithCapacity: length];
	
	for (int i=0; i<length; i++) {
		[randomString appendFormat: @"%C", [letters characterAtIndex: arc4random() % [letters length]]];
	}
	
	return [randomString copy];
}

- (NSString *)stringByBase64EncodingString{
	return [[self UTF8Data] stringByBase64EncodingData];
}

- (NSString *)stringByBase64DecodingString{
	return [[self dataByBase64DecodingString] UTF8String];
}

static const char encodingTable[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

- (NSData *)dataByBase64DecodingString{
	if ([self length] == 0)
		return [NSData data];
	
	static char *decodingTable = NULL;
	if (decodingTable == NULL)
	{
		decodingTable = malloc(256);
		if (decodingTable == NULL)
			return nil;
		memset(decodingTable, CHAR_MAX, 256);
		NSUInteger i;
		for (i = 0; i < 64; i++)
			decodingTable[(short)encodingTable[i]] = i;
	}
	
	const char *characters = [self cStringUsingEncoding:NSASCIIStringEncoding];
	if (characters == NULL)     //  Not an ASCII string!
		return nil;
	char *bytes = malloc((([self length] + 3) / 4) * 3);
	if (bytes == NULL)
		return nil;
	NSUInteger length = 0;
	
	NSUInteger i = 0;
	while (YES)
	{
		char buffer[4];
		short bufferLength;
		for (bufferLength = 0; bufferLength < 4; i++)
		{
			if (characters[i] == '\0')
				break;
			if (isspace(characters[i]) || characters[i] == '=')
				continue;
			buffer[bufferLength] = decodingTable[(short)characters[i]];
			if (buffer[bufferLength++] == CHAR_MAX)      //  Illegal character!
			{
				free(bytes);
				return nil;
			}
		}
		
		if (bufferLength == 0)
			break;
		if (bufferLength == 1)      //  At least two characters are needed to produce one byte!
		{
			free(bytes);
			return nil;
		}
		
		//  Decode the characters in the buffer to bytes.
		bytes[length++] = (buffer[0] << 2) | (buffer[1] >> 4);
		if (bufferLength > 2)
			bytes[length++] = (buffer[1] << 4) | (buffer[2] >> 2);
		if (bufferLength > 3)
			bytes[length++] = (buffer[2] << 6) | buffer[3];
	}
	
	realloc(bytes, length);
	return [NSData dataWithBytesNoCopy:bytes length:length];
}

- (NSData *)UTF8Data{
	return [self dataUsingEncoding:NSUTF8StringEncoding];
}

- (APArrayStringBlock)splitBlock {
    __block NSString *string = self;
    return  ^ NSArray * (NSString *separator){
        return [string componentsSeparatedByString:separator];
    };
}

- (NSNumber *)convertToNumber {
    NSNumber *number = nil;
    if ( ([self rangeOfString:@","].location != NSNotFound) || ([self rangeOfString:@"."].location != NSNotFound) ) {
        number = @([self doubleValue]);
    } else {
        number = @([self longLongValue]);
    }
    return number;
}

@end

NSString *NSStringFromBOOL(BOOL boolValue) {
    return boolValue == YES ? @"YES" : @"NO";
}

