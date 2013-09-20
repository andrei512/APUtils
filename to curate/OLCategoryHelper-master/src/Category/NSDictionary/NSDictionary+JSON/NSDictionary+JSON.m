//
// NSDictionary+JSON.m
// OLCategoryHelper
//
// Created by Pay Liu on 13/9/18.
// Copyright (c) 2013年 Octalord Information Inc. The MIT License
//

#import "NSDictionary+JSON.h"

@implementation NSDictionary (JSON)

- (NSString *) jsonString
{
    NSError *error = nil;

    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:0
                                                         error:&error];

    if (jsonData == nil) {

        NSLog(@"fail to get JSON from dictionary: %@, error: %@", self, error);

        return nil;
    }

    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];

    return [jsonString autorelease];
}

+ (NSDictionary *) dictionaryWithJSON:(NSString *)json
{
    NSError *error = nil;

    NSData *jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];

    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers | NSJSONReadingAllowFragments error:&error];

    if (jsonDict == nil) {

        NSLog(@"fail to get dictioanry from JSON: %@, error: %@", json, error);

        return nil;
    }

    return jsonDict;
}

@end
