//
//  NSDictionary+APUtils.m
//
//  Created by Andrei Puni on 5/6/13.
//

#import "NSDictionary+APUtils.h"

@implementation NSDictionary (APUtils)

- (NSMutableDictionary *)merge:(NSDictionary *)dict {
    @try {
        NSMutableDictionary *result = nil;
        if ([self isKindOfClass:[NSMutableDictionary class]]) {
            result = (NSMutableDictionary *)self;
        } else {
            result = [NSMutableDictionary dictionaryWithDictionary:self];
        }
        
        for (id key in dict) {
            if (result[key] == nil) {
                result[key] = dict[key];
            } else {
                if ([result[key] isKindOfClass:[NSDictionary class]] &&
                    [dict[key] isKindOfClass:[NSDictionary class]]) {
                    result[key] = [result[key] merge:dict[key]];
                } else {
                    result[key] = dict[key];
                }
            }
        }
        return result;

    }
    @catch (NSException *exception) {
        return [self mutableCopy];
    }
}

#pragma mark - JSON

- (NSString *)jsonString {
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:0
                                                         error:&error];
    
    if (jsonData == nil) {
#ifdef DEBUG
        NSLog(@"fail to get JSON from dictionary: %@, error: %@", self, error);
#endif
        return nil;
    }
    
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    return jsonString;
}

+ (NSDictionary *)dictionaryWithJSON:(NSString *)json {
    NSError *error = nil;
    NSData *jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers | NSJSONReadingAllowFragments error:&error];
    
    if (error != nil) {
#ifdef DEBUG
        NSLog(@"fail to get dictioanry from JSON: %@, error: %@", json, error);
#endif        
    }
    
    return jsonDict;
}

#pragma mark - Typing

- (NSNumber *)numberForKey:(NSString *)key {
    id v = self[key];

    // return v.asNumber

    // this is like ifNumber just inline
    if ([v isKindOfClass:[NSNumber class]]) {
        return (NSNumber *)v;
    }

    return nil;
}

- (NSString *)stringForKey:(NSString *)key {
    id v = self[key];

    // return v.asString

    // this is like ifString just inline
    if ([v isKindOfClass:[NSString class]]) {
        return (NSString *)v;
    }

    return nil;
}

- (NSDate *)dateForKey:(NSString *)key {
    id v = self[key];

    // return v.asDate

    // this is like ifDate just inline
    if ([v isKindOfClass:[NSDate class]]) {
        return (NSDate *)v;
    }

    return nil;
}

- (NSArray *)listForKey:(NSString *)key {
    id v = self[key];

    // return v.asList

    // this is like ifList just inline
    if ([v isKindOfClass:[NSArray class]]) {
        return (NSArray *)v;
    }

    return nil;
}

- (NSArray *)arrayForKey:(NSString *)key {
    id v = self[key];

    // return v.asArray

    // this is like ifArray just inline
    if ([v isKindOfClass:[NSArray class]]) {
        return (NSArray *)v;
    }

    return nil;
}

- (NSDictionary *)dictionaryForKey:(NSString *)key {
    id v = self[key];
    
    // return v.asDictionary
    
    // this is like ifDictionary just inline
    if ([v isKindOfClass:[NSDictionary class]]) {
        return (NSDictionary *)v;
    }
    
    return nil;
}

- (NSDictionary *)hashForKey:(NSString *)key {
    id v = self[key];

    // return v.asHash

    // this is like ifHash just inline
    if ([v isKindOfClass:[NSDictionary class]]) {
        return (NSDictionary *)v;
    }

    return nil;
}




@end
