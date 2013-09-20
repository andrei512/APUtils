// ACEAlertView.m
// 
// Copyright (c) 2013 Stefano Acerbetti
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "ACEToolKit.h"

@interface ACEAlertView ()<UIAlertViewDelegate>
@property (nonatomic, assign) id<UIAlertViewDelegate> alertDelegate;
@end

#pragma mark -

@implementation ACEAlertView

- (id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    self = [super initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles, nil];
    if (self != nil) {
        
        if (otherButtonTitles != nil) {
            // add the other buttons from the list
            va_list args;
            va_start(args, otherButtonTitles);
            
            NSString* buttonTitle;
            while ((buttonTitle = va_arg(args, NSString *))) {
                [self addButtonWithTitle:buttonTitle];
            }
        }
        
        // reset the cancel button and store the delegate
        self.cancelButtonIndex = 0;
        self.delegate = delegate;
    }
    return self;
}

- (id)delegate
{
    return self.alertDelegate;
}

- (void)setDelegate:(id)delegate
{
    [super setDelegate:self];
    self.alertDelegate = delegate;
}


#pragma mark - Show

- (void)showWithSelectBlock:(SelectBlock)select cancel:(DismissBlock)cancel
{
    self.selectBlock = select;
    self.cancelBlock = cancel;
    [self show];
}


#pragma mark - Alert View Delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    BOOL notifyDelegate = YES;
    
    if (alertView.cancelButtonIndex != buttonIndex) {
        if (self.selectBlock != nil) {
            notifyDelegate = self.selectBlock(buttonIndex, [alertView buttonTitleAtIndex:buttonIndex]);
        }
        
    } else {
        if (self.cancelBlock != nil) {
            notifyDelegate = self.cancelBlock();
        }
    }
    
    if (notifyDelegate && [self.alertDelegate respondsToSelector:_cmd]) {
        [self.alertDelegate alertView:alertView clickedButtonAtIndex:buttonIndex];
    }
    
    // clean the delegate
    self.delegate = nil;
    self.alertDelegate = nil;
}

- (void)alertViewCancel:(UIAlertView *)alertView
{
    if ([self.alertDelegate respondsToSelector:_cmd]) {
        [self.alertDelegate alertViewCancel:alertView];
    }
}

- (void)willPresentAlertView:(UIAlertView *)alertView
{
    if ([self.alertDelegate respondsToSelector:_cmd]) {
        [self.alertDelegate willPresentAlertView:alertView];
    }
}

- (void)didPresentAlertView:(UIAlertView *)alertView
{
    if ([self.alertDelegate respondsToSelector:_cmd]) {
        [self.alertDelegate didPresentAlertView:alertView];
    }
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if ([self.alertDelegate respondsToSelector:_cmd]) {
        [self.alertDelegate alertView:alertView willDismissWithButtonIndex:buttonIndex];
    }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if ([self.alertDelegate respondsToSelector:_cmd]) {
        [self.alertDelegate alertView:alertView didDismissWithButtonIndex:buttonIndex];
    }
}

- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView
{
    if ([self.alertDelegate respondsToSelector:_cmd]) {
        return [self.alertDelegate alertViewShouldEnableFirstOtherButton:alertView];
        
    } else {
        return YES;
    }
}

#if !ACE_HAS_ARC

- (void)dealloc
{
    self.alertDelegate = nil;
    self.selectBlock = nil;
    self.cancelBlock = nil;
    [super dealloc];
}

#endif

@end
