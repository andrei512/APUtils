#import <Foundation/Foundation.h>

@interface NSString (Derp)

-(NSString *)derp_stringByEscapingPercents;
-(NSString *)derp_stringByUnscapingPercents;

-(NSString *)derp_stringByBase64EncodingString;
-(NSString *)derp_stringByBase64DecodingString;
-(NSData   *)derp_dataByBase64DecodingString;

-(NSString *)derp_HMAC_SHA1SignatureWithKey:(NSString *)signingKey;
+(NSString *)derp_randomStringWithLength:(NSUInteger)length;

-(NSData   *)derp_UTF8Data;

@end
