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

@end
