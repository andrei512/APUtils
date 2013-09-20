//
// NSData+AES.h
//
// Created by Pay on 13/1/11.
// Copyright (c) 2013年 Octalord. The MIT License
//
// http://stackoverflow.com/questions/11482470/ios-5-data-encryption-aes-256-encryptwithkey-not-found
//

#import <Foundation/Foundation.h>

@interface NSData (Encryption)

- (NSData *) AES256EncryptWithKey:(NSString *)key;   // Encrypt
- (NSData *) AES256DecryptWithKey:(NSString *)key;   // Decrypt

@end
