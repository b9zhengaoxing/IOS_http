//
//  RefreshViewController.h
//  IOS_http
//
//  Created by tengfei li on 9/9/15.
//  Copyright (c) 2015年 LYD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RefreshViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
- (IBAction)beginToRefresh:(id)sender;

@end
