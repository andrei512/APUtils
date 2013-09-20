//
//  ACEViewController.m
//  ACEToolKitDemo
//
//  Created by Stefano Acerbetti on 1/22/13.
//  Copyright (c) 2013 Stefano Acerbetti. All rights reserved.
//

#import "ACEViewController.h"

@interface ACEViewController ()<UIAlertViewDelegate, UIActionSheetDelegate>

@end

@implementation ACEViewController

#pragma mark - Alert View

- (IBAction)delegateAlertView:(id)sender
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"ACEAlertView"
                                                        message:@"Test with blocks"
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:@"Option 1", @"Option 2", nil];
    
    [alertView show];
}

- (IBAction)blockAlertView:(id)sender
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"ACEAlertView"
                                                        message:@"Test with blocks"
                                                       delegate:nil
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:@"Option 1", @"Option 2", nil];
    
    [alertView showWithSelectBlock:^BOOL(NSInteger index, NSString *title) {
        self.messageLabel.text = [NSString stringWithFormat:@"Selected option '%@'", title];
        return NO;
        
    } cancel:^BOOL{
        self.messageLabel.text = @"No selection";
        return NO;
        
    }];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.cancelButtonIndex != buttonIndex) {
        self.messageLabel.text = [NSString stringWithFormat:@"Selected option '%@'", [alertView buttonTitleAtIndex:buttonIndex]];
        
    } else {
        self.messageLabel.text = @"No selection";
    }
}


#pragma mark - Action Sheet

- (IBAction)delegateActionSheet:(id)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"ACEActionSheet"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:@"Danger here"
                                                    otherButtonTitles:@"Option 1", @"Option 2", nil];
    
    [actionSheet showInView:self.view];
}

- (IBAction)blockActionSheet:(id)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"ACEActionSheet"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:@"Danger here"
                                                    otherButtonTitles:@"Option 1", @"Option 2", nil];
    
    // set the blocks
    actionSheet.selectBlock = ^BOOL(NSInteger index, NSString *title) {
        self.messageLabel.text = [NSString stringWithFormat:@"Selected option '%@'", title];
        return NO;
    };
    
    actionSheet.cancelBlock = ^BOOL{
        self.messageLabel.text = @"No selection";
        return NO;
    };
    
    actionSheet.destructiveBlock = ^BOOL{
        self.messageLabel.text = @"Destructive action";
        return NO;
    };
    
    [actionSheet showInView:self.view];

}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (actionSheet.destructiveButtonIndex == buttonIndex) {
        self.messageLabel.text = @"Destructive action";
        
    } else if (actionSheet.cancelButtonIndex == buttonIndex) {
        self.messageLabel.text = @"No selection";
        
    } else {
        self.messageLabel.text = [NSString stringWithFormat:@"Selected option '%@'", [actionSheet buttonTitleAtIndex:buttonIndex]];
    }
}

@end
