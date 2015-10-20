//
//  NSArray+APUtils.m
//
//  Created by Andrei Puni on 4/29/13.
//

#import "NSArray+APUtils.h"
#import "NSObject+APUtils.h"

@implementation NSArray (APUtils)

- (NSMutableArray *)filterWithBlock:(APBoolBlock)block {
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
        return [objectClass fromJson:object];
    }];
}

+ (NSArray *)arrayFromPlistNamed:(NSString *)name {
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"plist"];
    return [NSArray arrayWithContentsOfFile:path];
}

- (APStringStringBlock)join {
    __block NSArray *list = self;
    return ^ NSString * (NSString *delimiter) {
        return [list componentsJoinedByString:delimiter];
    };
}

#pragma mark - JSON

- (NSString *)jsonString {
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:0
                                                         error:&error];
    
    if (jsonData == nil) {
#ifdef DEBUG
        NSLog(@"fail to get JSON from array: %@, error: %@", self, error);
#endif
        return nil;
    }
    
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    return jsonString;
}

+ (NSArray *)arrayWithJSON:(NSString *)json {
    NSError *error = nil;
    NSData *jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
    
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers | NSJSONReadingAllowFragments error:&error];
    
    if (error != nil) {
#ifdef DEBUG
        NSLog(@"fail to get dictioanry from JSON: %@, error: %@", json, error);
#endif
    }
    
    return jsonArray;
}

@end


//#pragma mark - Range
//
//@interface APRangeEnumerator : NSEnumerator
//
//@property int start, finish, step, i;
//
//+ (instancetype)rangeWithStart:(int)start finish:(int)finish;
//+ (instancetype)rangeWithStart:(int)start finish:(int)finish step:(int)step;
//
//@end
//
//
//@implementation APRangeEnumerator
//
//+ (instancetype)rangeWithStart:(int)start finish:(int)finish {
//    return [self rangeWithStart:start finish:finish step:1];
//}
//
//+ (instancetype)rangeWithStart:(int)start finish:(int)finish step:(int)step {
//    APRangeEnumerator *enumerator = [APRangeEnumerator new];
//    
//    enumerator.start = start;
//    enumerator.finish = finish;
//    enumerator.step = step;
//    enumerator.i = start;
//    
//    return enumerator;
//}
//
//- (id)nextObject {
//    return @(self.i);
//}
//
//- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
//                                  objects:(id __unsafe_unretained [])buffer
//                                    count:(NSUInteger)len {
//    
//}
//
//- (NSArray *)allObjects {
//    NSMutableArray *all = [NSMutableArray arrayWithCapacity:(self.finish - self.start + self.step) / self.step];
//    for (int i = self.start; i < self.finish; )
//}
//
//
//@end
