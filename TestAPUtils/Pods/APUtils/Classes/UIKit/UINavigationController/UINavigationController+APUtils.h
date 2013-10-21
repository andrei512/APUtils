//
//  UINavigationController+APUtils.h
//  DevAPUtils
//
//  Created by Andrei Puni on 9/25/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (APUtils)

/**
 *  seek all the object is kind of aClass
 */
- (NSArray *) viewControllersForClass:(Class)aClass;

/**
 * seek the first one object is kind of aClass and return it
 */
- (UIViewController *) viewControllerForClass:(Class)aClass;

/**
 * pop to the first object is kind of aClass and return poped viewControllers
 */
- (NSArray *) popToViewControllerClass:(Class)aClass animated:(BOOL)animated;

/*
 * pop and then push
 *
 * http://stackoverflow.com/questions/410471/how-can-i-pop-a-view-from-a-uinavigationcontroller-and-replace-it-with-another-i
 */
- (UIViewController *) popThenPushViewController:(UIViewController *)viewController animated:(BOOL)animated;


@end
