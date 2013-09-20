// ACEActionSheet.m
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

@interface ACEActionSheet ()<UIActionSheetDelegate>
@property (nonatomic, assign) id<UIActionSheetDelegate> actionSheetDelegate;
@end

#pragma mark -

@implementation ACEActionSheet

- (id)initWithTitle:(NSString *)title delegate:(id<UIActionSheetDelegate>)delegate cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    self = [super initWithTitle:title delegate:delegate cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
    if (self != nil) {
        
        // start with the destructive button
        if (destructiveButtonTitle.length > 0) {
            self.destructiveButtonIndex = [self addButtonWithTitle:destructiveButtonTitle];
        }
        
        if (otherButtonTitles != nil) {
            // add the other buttons from the list
            va_list args;
            va_start(args, otherButtonTitles);
            
            NSString* buttonTitle;
            while ((buttonTitle = va_arg(args, NSString *))) {
                [self addButtonWithTitle:buttonTitle];
            }
        }
        
        // end with the cancel button
        if (cancelButtonTitle.length > 0) {
            self.cancelButtonIndex = [self addButtonWithTitle:cancelButtonTitle];
        }
        
        self.delegate = delegate;
    }
    return self;
}

- (id)delegate
{
    return self.actionSheetDelegate;
}

- (void)setDelegate:(id)delegate
{
    [super setDelegate:self];
    self.actionSheetDelegate = delegate;
}


#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    BOOL notifyDelegate = YES;
    
    if (actionSheet.destructiveButtonIndex == buttonIndex) {
        if (self.destructiveBlock != nil) {
            notifyDelegate = self.destructiveBlock();
        }
        
    } else if (actionSheet.cancelButtonIndex == buttonIndex) {
        if (self.cancelBlock != nil) {
            notifyDelegate = self.cancelBlock();
        }
        
    } else {
        if (self.selectBlock != nil) {
            notifyDelegate = self.selectBlock(buttonIndex, [actionSheet buttonTitleAtIndex:buttonIndex]);
        }
    }
    
    if (notifyDelegate && [self.actionSheetDelegate respondsToSelector:_cmd]) {
        [self.actionSheetDelegate actionSheet:actionSheet clickedButtonAtIndex:buttonIndex];
    }
    
}

- (void)actionSheetCancel:(UIActionSheet *)actionSheet
{
    if ([self.actionSheetDelegate respondsToSelector:_cmd]) {
        [self.actionSheetDelegate actionSheetCancel:actionSheet];
    }
}

- (void)willPresentActionSheet:(UIActionSheet *)actionSheet
{
    if ([self.actionSheetDelegate respondsToSelector:_cmd]) {
        [self.actionSheetDelegate willPresentActionSheet:actionSheet];
    }
}

- (void)didPresentActionSheet:(UIActionSheet *)actionSheet
{
    if ([self.actionSheetDelegate respondsToSelector:_cmd]) {
        [self.actionSheetDelegate didPresentActionSheet:actionSheet];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if ([self.actionSheetDelegate respondsToSelector:_cmd]) {
        [self.actionSheetDelegate actionSheet:actionSheet willDismissWithButtonIndex:buttonIndex];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if ([self.actionSheetDelegate respondsToSelector:_cmd]) {
        [self.actionSheetDelegate actionSheet:actionSheet didDismissWithButtonIndex:buttonIndex];
    }
    
    // clean the delegate
    self.delegate = nil;
    self.actionSheetDelegate = nil;
}

#if !ACE_HAS_ARC

- (void)dealloc
{
    self.actionSheetDelegate = nil;
    self.selectBlock = nil;
    self.destructiveBlock = nil;
    self.cancelBlock = nil;
    [super dealloc];
}

#endif

@end
