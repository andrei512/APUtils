//
//  NSDictionary+APUtils.h
//
//  Created by Andrei Puni on 5/6/13.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (APUtils)

- (NSMutableDictionary *)merge:(NSDictionary *)dict;

#pragma mark - JSON

- (NSString*) jsonString;
+ (NSDictionary*) dictionaryWithJSON:(NSString*)json;

#pragma mark - Typing

- (NSNumber *)numberForKey:(NSString *)key;
- (NSString *)stringForKey:(NSString *)key;
- (NSDate *)dateForKey:(NSString *)key;
- (NSArray *)listForKey:(NSString *)key;
- (NSArray *)arrayForKey:(NSString *)key;
- (NSDictionary *)dictionaryForKey:(NSString *)key;
- (NSDictionary *)hashForKey:(NSString *)key;

@end
