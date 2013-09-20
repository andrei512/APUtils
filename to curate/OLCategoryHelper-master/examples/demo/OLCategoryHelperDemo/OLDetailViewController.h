//
//  OLDetailViewController.h
//  OLCategoryHelperDemo
//
//  Created by Pay Liu on 13/9/5.
//  Copyright (c) 2013年 Octalord Information Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OLDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
