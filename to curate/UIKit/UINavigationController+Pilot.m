//
// UINavigationController+Pilot.m
//
// Created by Pay on 13/3/21.
// Copyright (c) 2013年 Octalord. The MIT License
//

#import "UINavigationController+Pilot.h"

@implementation UINavigationController (Pilot)

- (NSArray *) viewControllersForClass:(Class)aClass
{
    NSMutableArray *controllers = [[NSMutableArray array] mutableCopy];

    for (UIViewController *v in self.viewControllers) {

        if ([v isKindOfClass:aClass] == YES) {

            [controllers addObject:v];
        }
    }

    NSArray *ary = [NSArray arrayWithArray:controllers];

    [controllers release];

    return ary;
}

- (UIViewController *) viewControllerForClass:(Class)aClass
{
    for (UIViewController *v in self.viewControllers) {

        if ([v isKindOfClass:aClass] == YES) {

            return v;
        }
    }

    return nil;
}

- (NSArray *) popToViewControllerClass:(Class)aClass animated:(BOOL)animated
{

    UIViewController *v = [self viewControllerForClass:aClass];

    return [self popToViewController:v animated:animated];
}

- (UIViewController *) popThenPushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    UIViewController *v = [self popViewControllerAnimated:NO];

    [self pushViewController:viewController animated:animated];

    return v;
}

@end
