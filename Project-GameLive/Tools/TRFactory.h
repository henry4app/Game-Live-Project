//
//  TRFactory.h
//  Project-GameLive
//
//  Created by tarena on 16/8/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRFactory : NSObject

//自动为传入的参数添加返回按钮
+ (void)addBackItemForVC: (UIViewController *)vc;

//添加搜索按钮
+ (void)addSearchItemForVC: (UIViewController *)vc clickedHanlder:(void(^)())handler;

//添加单按钮警告窗口
+ (void)addSingleButtonAlertControllerForVC: (UIViewController *)vc alertTitle:(NSString *)alertTitle alertMessage:(NSString *)alertMessage actionTitle:(NSString *)actionTitle actionHanlder:(void (^)())actionHandler;

@end
