//
//  TRFactory.m
//  Project-GameLive
//
//  Created by tarena on 16/8/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRFactory.h"

@implementation TRFactory

+ (void)addBackItemForVC:(UIViewController *)vc {
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"返回_默认"] forState:UIControlStateNormal];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"返回_按下"] forState:UIControlStateHighlighted];
    backBtn.frame = CGRectMake(0, 0, 44, 44);
    [backBtn bk_addEventHandler:^(id sender) {
        [vc.navigationController popViewControllerAnimated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    // 配置返回按钮距离屏幕边缘的距离
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -15;
    vc.navigationItem.leftBarButtonItems = @[spaceItem, backItem];
    
}

+ (void)addSearchItemForVC:(UIViewController *)vc clickedHanlder:(void(^)())handler {
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [searchBtn setBackgroundImage:[UIImage imageNamed:@"搜索_默认"] forState:UIControlStateNormal];
    [searchBtn setBackgroundImage:[UIImage imageNamed:@"搜索_按下"] forState:UIControlStateHighlighted];
    searchBtn.frame = CGRectMake(0, 0, 44, 44);
    [searchBtn bk_addEventHandler:^(id sender) {
        !handler?:handler();
    } forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc] initWithCustomView:searchBtn];
    // 配置返回按钮距离屏幕边缘的距离
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -15;
    vc.navigationItem.rightBarButtonItems = @[spaceItem, searchItem];

}

+ (void)addSingleButtonAlertControllerForVC:(UIViewController *)vc alertTitle:(NSString *)alertTitle alertMessage:(NSString *)alertMessage actionTitle:(NSString *)actionTitle actionHanlder:(void (^)())actionHandler {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:alertTitle message:alertMessage preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        !actionHandler ?: actionHandler();
    }];
    [alertController addAction:alertAction];
    [vc presentViewController:alertController animated:YES completion:nil];
}


@end












































