//
//  UINavigationController+APUtils.m
//  DevAPUtils
//
//  Created by Andrei Puni on 9/25/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import "UINavigationController+APUtils.h"

@implementation UINavigationController (APUtils)

- (NSArray *)viewControllersForClass:(Class)aClass {
    NSMutableArray *controllers = [[NSMutableArray array] mutableCopy];
    
    for (UIViewController *v in self.viewControllers) {
        if ([v isKindOfClass:aClass] == YES) {
            [controllers addObject:v];
        }
    }
    
    return [NSArray arrayWithArray:controllers];
}

- (UIViewController *) viewControllerForClass:(Class)aClass {
    for (UIViewController *v in self.viewControllers) {
        if ([v isKindOfClass:aClass] == YES) {
            return v;
        }
    }
    
    return nil;
}

- (NSArray *) popToViewControllerClass:(Class)aClass animated:(BOOL)animated {
    UIViewController *v = [self viewControllerForClass:aClass];
    
    return [self popToViewController:v animated:animated];
}

- (UIViewController *) popThenPushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    UIViewController *v = [self popViewControllerAnimated:NO];
    
    [self pushViewController:viewController animated:animated];
    
    return v;
}


@end
