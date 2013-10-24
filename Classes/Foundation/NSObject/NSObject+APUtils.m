//
//  NSObject+APUtils.m
//
//  Created by Andrei on 8/11/12.
//

#import "NSObject+APUtils.h"
#import "NSString+APUtils.h"
#import "APUtils.h"

@implementation NSObject (Model)

- (NSArray *)objectProperties {
    NSDictionary *propertyInfo = [[self class] propertyInfo];
    NSMutableArray *properties = [NSMutableArray arrayWithCapacity:propertyInfo.count];
    
    for (NSString *propertyName in propertyInfo) {
        NSDictionary *property = propertyInfo[propertyName];
        // raw_type starts with @ for all NSObject subclasses
        // raw_type is @ for id type
        // raw_type is d / i /... for primitive data-types
        
        // we need all objects + id
        if ([property[@"raw_type"] hasPrefix:@"@"]) {
            [properties addObject:property];
        }
    }
    
    return properties;
}

- (instancetype)fromJson:(NSDictionary *)data {
    // memoize the properties lists for each class
    // To do: move this part on the class decorator
    __strong static NSMutableDictionary *propertiesDicts = nil;
    
    if (propertiesDicts == nil) {
        propertiesDicts = [NSMutableDictionary dictionary];
    }
    
    NSArray *properties = [propertiesDicts objectForKey:NSStringFromClass([self class])];
    
    if (properties == nil) {
        properties = [self objectProperties];
        [propertiesDicts setObject:properties forKey:NSStringFromClass([self class])];
    }
    
    for (NSDictionary *propertyInfo in properties) {
        NSString *propertyName = propertyInfo[@"name"];
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
    
    if ([self conformsToProtocol:@protocol(APJSONCustomLoading)]) {
        [self safePerform:@selector(customLoadJson:) withObject:data];
    }
    
    return self;
}

- (NSDictionary *)asJson {
    return [self _asJson:NO];
}

- (NSDictionary *)asUnserscoredJson {
    return [self _asJson:YES];
}

- (NSDictionary *)_asJson:(BOOL)underscored {
    NSMutableDictionary *ashes = [NSMutableDictionary dictionary];

    Class class = [self class];
    do {
        for (NSDictionary *propertyInfo in self.objectProperties) {
            NSString *propertyName = propertyInfo[@"name"];
            if ([self valueForKey:propertyName] != nil) {
                if (underscored) { 
                    [ashes setValue:[self valueForKey:propertyName]
                             forKey:CamelCaseToUnderscores(propertyName)];
                } else {
                    [ashes setValue:[self valueForKey:propertyName]
                             forKey:propertyName];
                }
            }
        }
        class = [class superclass];
    } while ([class superclass]);

    return ashes;
}

+ (instancetype)fromJson:(NSDictionary *)data {
    id ret = [self new];
    
    [ret fromJson:data];
    
    return ret;
}

#pragma mark - Class Derivation

+ (NSString *)className {
    return NSStringFromClass(self.class);
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

#pragma mark - Safe Perform

- (id)safePerform:(SEL)selector {
    return [self safePerform:selector withObject:nil];
}

- (id)safePerform:(SEL)selector withObject:(id)object {
    NSParameterAssert(selector != NULL);
    NSParameterAssert([self respondsToSelector:selector]);
    
    if ([self respondsToSelector:selector]) {
        NSMethodSignature* methodSig = [self methodSignatureForSelector:selector];
        if(methodSig == nil) {
            return nil;
        }
        
        const char* retType = [methodSig methodReturnType];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        if(strcmp(retType, @encode(void)) != 0) {
            return [self performSelector:selector withObject:object];
        } else {
            [self performSelector:selector withObject:object];
            return nil;
        }
#pragma clang diagnostic pop
    } else {
#ifndef NS_BLOCK_ASSERTIONS
        NSString *message =
            [NSString stringWithFormat:@"%@ does not recognize selector %@",
             self,
             NSStringFromSelector(selector)];
        NSAssert(false, message);
#endif
        return nil;
    }
}

@end


