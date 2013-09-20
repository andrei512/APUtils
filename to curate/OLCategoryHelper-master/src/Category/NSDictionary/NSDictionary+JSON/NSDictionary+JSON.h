//
//  NSDictionary+JSON.h
//  OLCategoryHelper
//
//  Created by Pay Liu on 13/9/18.
//  Copyright (c) 2013年 Octalord Information Inc. The MIT License
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JSON)

- (NSString*) jsonString;

+ (NSDictionary*) dictionaryWithJSON:(NSString*)json;

@end
