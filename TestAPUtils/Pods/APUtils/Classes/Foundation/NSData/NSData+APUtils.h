//
//  NSData+APUtils.h
//  DevAPUtils
//
//  Created by Andrei Puni on 9/24/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (APUtils)

- (NSData *)AES256EncryptWithKey:(NSString *)key;   // Encrypt
- (NSData *)AES256DecryptWithKey:(NSString *)key;   // Decrypt

- (NSString *)stringByBase64EncodingData;
- (NSString *)stringByBase64DecodingData;

- (NSString *)UTF8String;

@end
