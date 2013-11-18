//
//  UIView+APUtils.m
//  DevAPUtils
//
//  Created by Andrei Puni on 9/25/13.
//  Copyright (c) 2013 Andrei Puni. All rights reserved.
//

#import "UIView+APUtils.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (APUtils)

#pragma mark - Nibs

+ (instancetype)viewWithNibName:(NSString *)nibName {
    UINib *nib = [UINib nibWithNibName:nibName bundle:nil];
    NSArray *objects = [nib instantiateWithOwner:nil options:nil];
    for (NSObject *object in objects) {
        if ([object isKindOfClass:[self class]]) {
            return (UIView *)object;
        }
    }
    return nil;
}


#pragma mark - Shortcuts for frame properties

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}


#pragma mark - Shortcuts for the coords

- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}


#pragma mark - Shortcuts for positions

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}


#pragma mark - Shortcuts for dimensions

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)orientationWidth {
    return UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)
    ? self.height : self.width;
}

- (CGFloat)orientationHeight {
    return UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)
    ? self.width : self.height;
}

#pragma mark - Shortcuts for subviews

- (UIView *)descendantOrSelfWithClass:(Class)cls {
    if ([self isKindOfClass:cls])
        return self;
    
    for (UIView * child in self.subviews) {
        UIView *it = [child descendantOrSelfWithClass:cls];
        if (it != nil) {
            return it;
        }
    }
    
    return nil;
}

- (UIView*)ancestorOrSelfWithClass:(Class)cls {
    if ([self isKindOfClass:cls]) {
        return self;
        
    } else if (self.superview) {
        return [self.superview ancestorOrSelfWithClass:cls];
        
    } else {
        return nil;
    }
}

- (void)removeAllSubviews {
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}


#pragma mark - Rounded corners

- (void)addBezierPathRoundedCornersWithRadius:(CGFloat)inRadius {
    if (!self.layer.mask) {
        CAShapeLayer * shapeLayer = [CAShapeLayer layer];
        //Setting the background color of the masking shape layer to clear color is key
        //otherwise it would mask everything
        shapeLayer.backgroundColor = [UIColor clearColor].CGColor;
        shapeLayer.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:inRadius].CGPath;
        
        
        
        self.layer.masksToBounds = YES;
        self.layer.mask = shapeLayer;
        shapeLayer.frame = self.layer.bounds;
    }
}

- (void)setRoundedCorners:(UIRectCorner)corners radius:(CGFloat)radius {
	CGRect rect = self.bounds;
    
    // Create the path
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:rect
                                                   byRoundingCorners:corners
                                                         cornerRadii:CGSizeMake(radius, radius)];
    
    // Create the shape layer and set its path
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = rect;
    maskLayer.path = maskPath.CGPath;
    
    // Set the newly created shape layer as the mask for the view's layer
    self.layer.mask = maskLayer;
}

- (void)setRoundedCornersWithRadius:(CGFloat)radius {
    [self addBezierPathRoundedCornersWithRadius:radius];
}

@end
