//
//  RegisterViewController.m
//  Project-GameLive
//
//  Created by tarena on 16/8/9.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *pwdTF;

@end

@implementation RegisterViewController

- (void)returnUserName:(ReturnUserBlock)block {
    _returnUserBlock = block;
}

- (IBAction)dismissBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)loginBtnClicked:(id)sender {
    NSError *error = nil;
    NSString *savedPwd = [YYKeychain getPasswordForService:@"registerMobile" account:_phoneTF.text error:&error];
    if ([_pwdTF.text isEqualToString:savedPwd]) {
        NSLog(@"登录成功");
        self.returnUserBlock(self.phoneTF.text);
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        NSLog(@"用户名或密码错误");
        NSLog(@"%@", error);
    }
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.title = @"登录";
    [UINavigationBar appearance].translucent = NO;
    [UINavigationBar appearance].barTintColor = kRGB(238, 128, 18, 1);
    [UINavigationBar appearance].barStyle = UIBarStyleBlack;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
