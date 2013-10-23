//
//  NSObject+APRuntime.m
//  DevAPUtils
//
//  Created by Andrei on 10/18/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import "NSObject+APRuntime.h"
#import "NSString+APUtils.h"
#import "NSArray+APUtils.h"
#import <objc/runtime.h>

static inline NSMutableDictionary * propertyAttributesFromString(NSString *string) {
    //    R    The property is read-only (readonly).
    //    C    The property is a copy of the value last assigned (copy).
    //    &    The property is a reference to the value last assigned (retain).
    //    N    The property is non-atomic (nonatomic).
    //    G<name> The property defines a custom getter selector name.
    //            The name follows the G (for example, GcustomGetter,).
    //    S<name> The property defines a custom setter selector name.
    //            The name follows the S (for example, ScustomSetter:,).
    //    D   The property is dynamic (@dynamic).
    //    W   The property is a weak reference (__weak).
    //    P   The property is eligible for garbage collection.
    //    T<encoding> Specifies the type using old-style encoding.
    
    NSArray *attributeDescriptions = string.splitBlock(@",");
    // in all cases it will insert
    NSMutableDictionary *info = [NSMutableDictionary dictionaryWithCapacity:attributeDescriptions.count + 1];
    
    const NSDictionary *constants = @{
        @"R" : @{ @"association_type"   :   @"read-only" },
        @"C" : @{ @"association_type"   :   @"copy" },
        @"&" : @{ @"association_type"   :   @"retain" },
        @"W" : @{ @"association_type"   :   @"weak" },
        @"N" : @{ @"non-atomic"         :   @YES },
        @"D" : @{ @"dynamic"            :   @YES },
    };
    
    for (NSString *attributeDescription in attributeDescriptions) {
        NSDictionary *i = constants[attributeDescription];
        if (i != nil) {
            [info addEntriesFromDictionary:i];
        } else {
            NSString *first = [attributeDescription substringToIndex:1];
            NSString *rest = [attributeDescription substringFromIndex:1];
            
            if ([first isEqualToString:@"T"]) {
                info[@"raw_type"] = rest;
                if ([rest matches:@"@\"\\w+\""]) {
                    // ignoring @" and "
                    info[@"class"] = [rest substringWithRange:NSMakeRange(2, rest.length - 3)];
                }
            } else if ([first isEqualToString:@"V"]) {
                info[@"ivar"] = rest;
            }
        }
    }
    
    return info;
}

@implementation NSObject (APRuntime)

+ (NSDictionary *)propertyInfo {
    Class currentClass = [self class];

    NSMutableDictionary *propertyInfo = [NSMutableDictionary dictionary];
    
    do {
        unsigned int outCount, i;
        objc_property_t *properties = class_copyPropertyList(currentClass, &outCount);
        
        for (i = 0; i < outCount; i++) {
            objc_property_t property = properties[i];
            
            NSString *propertyName = [NSString stringWithFormat:@"%s", property_getName(property)];
            NSString *propertyAttributes = [NSString stringWithFormat:@"%s", property_getAttributes(property)];

            NSMutableDictionary *info = propertyAttributesFromString(propertyAttributes);
            
            info[@"name"] = propertyName;
            
            propertyInfo[propertyName] = info;
        }
        
        currentClass = [currentClass superclass];
    } while ([currentClass superclass]);

    return propertyInfo;
}

@end
