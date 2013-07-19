//
//  NSObject+APUtils.m
//
//  Created by Andrei on 8/11/12.
//

#import "NSObject+APUtils.h"
#import "NSString+APUtils.h"
#import "MARTNSObject.h"
#import "RTProperty.h"
#import "APUtils.h"

@implementation NSObject (Model)

#define kPropertyName @"kPropertyName"

- (NSArray *)properties {
    NSMutableArray *properties = [NSMutableArray array];
    
    Class class = self.rt_class;
    do {
        for (RTProperty *property in class.rt_properties) {
            [properties addObject:[property name]];                    
        }
        class = [class superclass];
    } while ([class superclass]);
    
    return properties;
}

- (id)loadFrom:(id)data {
    // memoize the properties lists for each class
    __strong static NSMutableDictionary *propertiesDicts = nil;
    
    if (propertiesDicts == nil) {
        propertiesDicts = [NSMutableDictionary dictionary];
    }
    
    NSArray *properties = [propertiesDicts objectForKey:NSStringFromClass([self class])];
    
    if (properties == nil) {
        properties = [self properties];
        [propertiesDicts setObject:properties forKey:NSStringFromClass([self class])];
    }
    
    for (NSString *propertyName in properties) {
        @try {
            id value = data[propertyName];
            if (value) {
                [self setValue:value
                        forKey:propertyName];
            } else {
                value = data[CamelCaseToUnderscores(propertyName)];
                if (value) {
                    [self setValue:value
                            forKey:propertyName];
                } else {
                    value = data[CapitalizeFirst(propertyName)];
                    if (value) {
                        [self setValue:value
                                forKey:propertyName];
                    }
                }
            }
        }
        @catch (NSException *exception) {
            // silent exception
        }
    }
    
    if ([self respondsToSelector:@selector(customLoadData:)]) {
        [self performSelector:@selector(customLoadData:) withObject:data];
    }
    
    return self;
}

- (id)ashes {
    return [self ashes:NO];
}

- (id)ashes:(BOOL)underscored {
    NSMutableDictionary *ashes = [NSMutableDictionary dictionary];

    Class class = self.rt_class;
    do {
        for (RTProperty *property in class.rt_properties) {
            if ([self valueForKey:[property name]] != nil) {
                if (underscored) { 
                    [ashes setValue:[self valueForKey:[property name]] 
                             forKey:CamelCaseToUnderscores([property name])];
                } else {
                    [ashes setValue:[self valueForKey:[property name]] 
                             forKey:[property name]];
                }
            }
        }
        class = [class superclass];
    } while ([class superclass]);

    return ashes;
}

+ (id)createFrom:(id)data {
    id ret = [self new];
    
    [ret loadFrom:data];
    
    return ret;
}

- (NSString *)className {
    return NSStringFromClass(self.class);
}

- (NSString *)hashKey {
    return [NSString stringWithFormat:@"%d", (int)self];
}

- (Class)classByRemovingSuffix:(NSString *)suffix {
    return [[self class] classByRemovingSuffix:suffix];
}

+ (Class)classByRemovingSuffix:(NSString *)suffix {
    return [self classByReplacingSuffix:suffix with:@""];
}

- (Class)classByReplacingSuffix:(NSString *)suffix with:(NSString *)replacement {
    return [[self class] classByReplacingSuffix:suffix with:replacement];
}

+ (Class)classByReplacingSuffix:(NSString *)suffix with:(NSString *)replacement {
    NSString *classnameWithoutSuffix = [NSStringFromClass([self class])
                                        stringByRemovingSuffix:suffix];
    
    NSString *newClassname = [classnameWithoutSuffix stringByAppendingString:replacement];
    
    return NSClassFromString(newClassname);
}


- (Class)classByAddingSuffix:(NSString *)suffix {
    return [[self class] classByAddingSuffix:suffix];
}

+ (Class)classByAddingSuffix:(NSString *)suffix {
    NSString *newClassname = [NSStringFromClass(self) stringByAppendingString:suffix];
    
    return NSClassFromString(newClassname);
}

@end
