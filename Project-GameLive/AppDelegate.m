//
//  AppDelegate.m
//  Project-GameLive
//
//  Created by tarena on 16/7/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "MyTabBarController.h"
#import "NetManager.h"
#import "WelcomeViewController.h"
#import <SMS_SDK/SMSSDK.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (UIWindow *)window {
    if (!_window) {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [_window makeKeyAndVisible];
        _window.rootViewController = [MyTabBarController new];
        _window.windowLevel = 1;
    }
    return _window;
}

- (UIWindow *)welcomeWindow {
    if (!_welcomeWindow) {
        //后初始化的窗口显示在最上方
        _welcomeWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        //初始之后默认是隐藏的
        _welcomeWindow.hidden = NO;
        _welcomeWindow.rootViewController = [WelcomeViewController new];
        //窗口的层级关系，数值越大，则显示在上层 默认为0
        _welcomeWindow.windowLevel = 100;
    }
    return _welcomeWindow;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self configSystem:launchOptions];
    
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSLog(@"docPath: %@", docPath);
    
//    [NetManager getRoomModel:@"263925" completionHandler:^(RoomModel *model, NSError *error) {
//        NSLog(@"263925 room");
//    }];
    
    // SMS
    [SMSSDK registerApp:@"15dbd7919a128" withSecret:@"395fe6490e6d2b2ab9ae1ff652f21f5e"];
    
//    [self welcomeWindow];
//    [self window];
    /*
     1. 首次安装 显示欢迎页
     2. 升级安装 显示欢迎页
     3. 已经进入过主页面了 不显示欢迎页
     实现:
     如果进入过欢迎页: 则保存当前的软件版本号
     每次启动时: 判断系统的版本号, 和 保存过的启动版本号是否一致.
     
     */
    //NSLog(@"%@", NSHomeDirectory());
    [[NSUserDefaults standardUserDefaults] setObject:@"11" forKey:@"22"];
    //获取当前app版本号
    NSDictionary *infoDic = [NSBundle mainBundle].infoDictionary;
    //NSLog(@"%@", infoDic);
    NSString *version = infoDic[@"CFBundleShortVersionString"];
    //假设已经读取的版本号， key是ReadVersion
    NSString *readVersion = [[NSUserDefaults standardUserDefaults] objectForKey:@"ReadVersion"];
    if ([readVersion isEqualToString:version]) {
        [self window];
    } else {
#warning 临时测试用
//        [self welcomeWindow];
        [self window];
        
    }
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
