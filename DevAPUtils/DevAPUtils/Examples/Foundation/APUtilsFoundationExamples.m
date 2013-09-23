//
//  APUtilsFoundationExamples.m
//  DevAPUtils
//
//  Created by Andrei Puni on 9/19/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import "APUtilsFoundationExamples.h"

@interface User : NSObject

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSNumber *age;

@end

@implementation User

- (NSString *)description {
    return [NSString stringWithFormat:@"User: %@ %@ - age %@", self.firstName, self.lastName, self.age];
}

@end

@implementation APUtilsFoundationExamples

- (void)runExamples {
    [self arrayExamples];
    [self dateExamples];
}

- (void)arrayExamples {
    NSArray *array = @[@1.1, @2.2, @3.3, @4.4, @5.5, @6.6, @7.7, @8.7, @9.9, @10];
    
    PO([array filter:^BOOL(NSNumber *nr) {
        return nr.intValue % 2 == 1;
    }])
    
    PO([array map:^id(NSNumber *number) {
        return @(number.intValue * 2);
    }])
    
    PO([array mapWithSelector:@selector(formatedString)])
    
    NSArray *usersInfo = [NSArray arrayFromPlistNamed:@"Users"];
    PO(usersInfo)
    
    PO([usersInfo mapToClass:[User class]])
}

- (void)dateExamples {
    
}

@end
