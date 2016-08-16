//
//  MyTabBarController.m
//  Project-GameLive
//
//  Created by tarena on 16/7/29.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "MyTabBarController.h"
#import "MyViewController.h"
#import "CategoriesViewController.h"
#import "IntroViewController.h"
#import "LiveViewController.h"

@interface MyTabBarController ()
@property (nonatomic) MyViewController *myVC;
@property (nonatomic) CategoriesViewController *cateVC;
@property (nonatomic) IntroViewController *introVC;
@property (nonatomic) LiveViewController *liveVC;
@end

@implementation MyTabBarController


#pragma mark - view lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [UITabBar appearance].translucent = NO;
    [UITabBar appearance].tintColor = kRGB(252, 50, 41, 1);
    [UINavigationBar appearance].translucent = NO;
    [UINavigationBar appearance].barTintColor = kRGB(252, 50, 41, 1);
    [UINavigationBar appearance].barStyle = UIBarStyleBlack;
    
    UINavigationController *navi0 = [[UINavigationController alloc] initWithRootViewController:self.introVC];
    UINavigationController *navi1 = [[UINavigationController alloc] initWithRootViewController:self.cateVC];
    UINavigationController *navi2 = [[UINavigationController alloc] initWithRootViewController:self.liveVC];
    UINavigationController *navi3 = [[UINavigationController alloc] initWithRootViewController:self.myVC];
    self.viewControllers = @[navi0,navi1,navi2,navi3];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - lazy load
- (MyViewController *)myVC {
	if(_myVC == nil) {
		_myVC = [[MyViewController alloc] initWithStyle:UITableViewStyleGrouped];
        _myVC.title = @"我的";
        _myVC.tabBarItem.image = [UIImage imageNamed:@"我的_默认"];
        _myVC.tabBarItem.selectedImage = [UIImage imageNamed:@"我的_焦点"];
	}
	return _myVC;
}

- (CategoriesViewController *)cateVC {
	if(_cateVC == nil) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 6;
        layout.sectionInset = UIEdgeInsetsMake(6, 6, 6, 6);
        CGFloat width = (kScreenW - 4 * 6) / 3;
        CGFloat height = width * 450 / 345 + 26;
        layout.itemSize = CGSizeMake((long)width, height);
		_cateVC = [[CategoriesViewController alloc] initWithCollectionViewLayout:layout];
        _cateVC.title = @"栏目";
        _cateVC.tabBarItem.image = [UIImage imageNamed:@"栏目_默认"];
        _cateVC.tabBarItem.selectedImage = [UIImage imageNamed:@"栏目_焦点"];
	}
	return _cateVC;
}

- (IntroViewController *)introVC {
	if(_introVC == nil) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 6;
        layout.sectionInset = UIEdgeInsetsMake(6, 6, 6, 6);
        // 352 * 204
        CGFloat width = (kScreenW - 3 * 6) / 2;
        CGFloat height = width * 204 / 352 + 26;
        layout.itemSize = CGSizeMake((long)width, height);
        
        
		_introVC = [[IntroViewController alloc] initWithCollectionViewLayout:layout];
        _introVC.title = @"推荐";
        _introVC.tabBarItem.image = [UIImage imageNamed:@"推荐_默认"];
        _introVC.tabBarItem.selectedImage = [UIImage imageNamed:@"推荐_焦点"];
	}
	return _introVC;
}

- (LiveViewController *)liveVC {
	if(_liveVC == nil) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 6;
        layout.sectionInset = UIEdgeInsetsMake(6, 6, 6, 6);
        CGFloat width = (kScreenW - 3 * 6) / 2;
        CGFloat height = width * 197 / 347 + 26;
        layout.itemSize = CGSizeMake((long)width, height);
		_liveVC = [[LiveViewController alloc] initWithCollectionViewLayout:layout];
        _liveVC.title = @"直播";
        _liveVC.tabBarItem.image = [UIImage imageNamed:@"发现_默认"];
        _liveVC.tabBarItem.selectedImage = [UIImage imageNamed:@"发现_焦点"];
	}
	return _liveVC;
}

@end
