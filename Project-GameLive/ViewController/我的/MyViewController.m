//
//  MyViewController.m
//  Project-GameLive
//
//  Created by tarena on 16/7/29.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "MyViewController.h"
#import "MiddleCell.h"
#import "TopCell.h"
#import "RegisterViewController.h"
#import "SMSViewController.h"


@interface MyViewController ()

@property (nonatomic) NSString *user;

@end

@implementation MyViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[MiddleCell class] forCellReuseIdentifier:@"OtherSection"];
    //[self.tableView registerClass:[TopCell class] forCellReuseIdentifier:@"TopSection"];
    
    // 配置Tablview
    self.tableView.contentInset = UIEdgeInsetsMake(-70, 0, 0, 0);
    self.tableView.scrollEnabled = NO;
    self.tableView.sectionHeaderHeight = 1.0;
    self.tableView.sectionFooterHeight = 8.0;
    self.tableView.rowHeight = 50;
    
    // 配置导航栏
    self.navigationItem.title = @"";
    self.navigationController.navigationBar.translucent = YES;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    //去底部阴影
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    UIButton *messageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [messageBtn setBackgroundImage:[UIImage imageNamed:@"消息"] forState:UIControlStateNormal];
    [messageBtn setBackgroundImage:[UIImage imageNamed:@"消息"] forState:UIControlStateHighlighted];
    messageBtn.frame = CGRectMake(0, 0, 25, 23);
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:messageBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIButton *editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [editBtn setBackgroundImage:[UIImage imageNamed:@"个人中心编辑图标"] forState:UIControlStateNormal];
     [editBtn setBackgroundImage:[UIImage imageNamed:@"个人中心编辑图标"] forState:UIControlStateHighlighted];
    editBtn.frame = CGRectMake(0, 0, 20, 20);
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:editBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
    
    UIView *headerView = [[TopCell alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 300)];
    self.tableView.tableHeaderView = headerView;
    [((TopCell *)headerView).itemViewList[0] bk_whenTapped:^{
        NSLog(@"观看历史");
        
    }];
    [((TopCell *)headerView).liveBtn bk_addEventHandler:^(id sender) {
        NSLog(@"我要直播");
        
        
    } forControlEvents:UIControlEventTouchUpInside];
    
    [((TopCell *)headerView).regBtn bk_addEventHandler:^(id sender) {
        NSLog(@"注册");
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        RegisterViewController *rvc = [storyboard instantiateViewControllerWithIdentifier:@"rvc"];
        
        
        
        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:rvc];
        [self presentViewController:navi animated:YES completion:nil];
    } forControlEvents:UIControlEventTouchUpInside];
    
    [((TopCell *)headerView).loginBtn bk_addEventHandler:^(id sender) {
        NSLog(@"登录");
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        RegisterViewController *rvc = [storyboard instantiateViewControllerWithIdentifier:@"rvc"];
        
        [rvc returnUserName:^(NSString *username) {
            self.user = username;
            [((TopCell *)headerView).headIV setImage:[UIImage imageNamed:@"包包里有宝"]];
        }];

        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:rvc];
        [self presentViewController:navi animated:YES completion:nil];
    } forControlEvents:UIControlEventTouchUpInside];

    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    // Bottom Section
    if (indexPath.section == 1) {
        MiddleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OtherSection" forIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.cellIconIV.image = [UIImage imageNamed:@"手游"];
        cell.title.text = @"手游中心";
        cell.descLabel.text = @"玩游戏领鱼丸";
        return cell;
    }
    
    // Middle Section
 
        MiddleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OtherSection" forIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        if (indexPath.row == 0) {
            cell.cellIconIV.image = [UIImage imageNamed:@"开播提醒"];
            cell.title.text = @"开播提醒";
        }
        if (indexPath.row == 1) {
            cell.cellIconIV.image = [UIImage imageNamed:@"icon_tike"];
            cell.title.text = @"票务查询";
        }
        if (indexPath.row == 2) {
            cell.cellIconIV.image = [UIImage imageNamed:@"设置选项"];
            cell.title.text = @"设置选项";
        }
    
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}









@end
