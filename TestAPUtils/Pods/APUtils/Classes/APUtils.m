//
//  APUtils.m
//
//  Created by Andrei Puni on 4/18/13.
//

#import "APUtils.h"

void after(NSTimeInterval timeInterval, void(^block)(void)) {
    double delayInSeconds = timeInterval;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), block);
}

@implementation APUtils

+ (BOOL)canMakePhoneCalls {
    static BOOL didCallMethod = NO;
    static BOOL canMakePhoneCalls;
    if (didCallMethod == NO) {
        didCallMethod = YES;
        canMakePhoneCalls = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tel://"]];
    }
    return canMakePhoneCalls;
}

+ (void)findAndResignFirstReponder {
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    [self findAndResignFirstResponderFromView:keyWindow];
}

+ (BOOL)findAndResignFirstResponderFromView:(UIView *)view {
    if (view.isFirstResponder) {
        [view resignFirstResponder];
        return YES;
    }
    for (UIView *subView in view.subviews) {
        if ([self findAndResignFirstResponderFromView:subView]) {
            return YES;
        }
    }
    return NO;
}

+ (void)benchmark:(void(^)(void))block name:(NSString *)name {
    clock_t start = clock();
    
    block();
    
    double executionTime = (double)(clock()-start) / CLOCKS_PER_SEC;
    
    NSLog(@"%@ duration -> %.3f", name, executionTime);
}

+ (void)benchmark:(void(^)(void))block {
    [self benchmark:block name:@"Event"];
}


@end

