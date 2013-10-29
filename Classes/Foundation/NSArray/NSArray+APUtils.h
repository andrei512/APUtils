//
//  NSArray+APUtils.h
//
//  Created by Andrei Puni on 4/29/13.
//

#import <Foundation/Foundation.h>

typedef BOOL(^APBoolBlock)(id object);
typedef id(^APObjectBlock)(id object);
typedef NSString *(^APStringStringBlock)(NSString *string);

@interface NSArray (APUtils)

- (NSMutableArray *)filterWithBlock:(APBoolBlock)block;
- (NSMutableArray *)mapWithBlock:(APObjectBlock)block;
- (NSMutableArray *)mapWithSelector:(SEL)selector;
- (NSMutableArray *)mapToClass:(Class)objectClass;

+ (NSArray *)arrayFromPlistNamed:(NSString *)name;

- (APStringStringBlock)join;

@end


