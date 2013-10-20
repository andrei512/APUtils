//
//  NSArray+APUtils.m
//
//  Created by Andrei Puni on 4/29/13.
//

#import "NSArray+APUtils.h"
#import "NSObject+APUtils.h"

@implementation NSArray (APUtils)

- (NSMutableArray *)filter:(APBoolBlock)block {
    NSMutableArray *result = [NSMutableArray array];
    for (id object in self) {
        if (block(object)) {
            [result addObject:object];
        }
    }
    return result;
}

- (NSMutableArray *)mapWithBlock:(APObjectBlock)block {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.count];
    for (id object in self) {
        [result addObject:block(object)];
    }
    return result;
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
- (NSMutableArray *)mapWithSelector:(SEL)selector {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.count];
    for (id object in self) {
        [result addObject:[object performSelector:selector]];
    }
    return result;
}
#pragma clang diagnostic pop

- (NSMutableArray *)mapToClass:(Class)objectClass {
    return [self mapWithBlock:^id(id object) {
        return [objectClass createFrom:object];
    }];
}

+ (NSArray *)arrayFromPlistNamed:(NSString *)name {
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"plist"];
    return [NSArray arrayWithContentsOfFile:path];
}


@end
