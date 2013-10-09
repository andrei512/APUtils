//
//  UIView+APUtils.m
//  Point2Homes
//
//  Created by Andrei Puni on 8/23/13.
//  Copyright (c) 2013 Yardi. All rights reserved.
//

#import "UIView+APUtils.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (APUtils)

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

- (void)addBezierPathRoundedCornersWithRadius:(CGFloat)inRadius {
    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
    //Setting the background color of the masking shape layer to clear color is key
    //otherwise it would mask everything
    shapeLayer.backgroundColor = [UIColor clearColor].CGColor;
    shapeLayer.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:inRadius].CGPath;
    
    
    
    self.layer.masksToBounds = YES;
    self.layer.mask = shapeLayer;
    shapeLayer.frame = self.layer.bounds;
}

@end
