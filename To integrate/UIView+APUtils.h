//
//  UIView+APUtils.h
//  Point2Homes
//
//  Created by Andrei Puni on 8/23/13.
//  Copyright (c) 2013 Yardi. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  Category of UIView containing some util methods
 */
@interface UIView (APUtils)

/**
 *  Loads and returns the 1st view for the specified nib
 *
 *  @param nibName
 *
 *  @return a UIView instance
 */
+ (instancetype)viewWithNibName:(NSString *)nibName;

/**
 *  Rounded corners using performant Bezier Path
 *
 *  @param inRadius radius of the corners
 */
- (void)addBezierPathRoundedCornersWithRadius:(CGFloat)inRadius;

@end
