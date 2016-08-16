//
//  SMSViewController.m
//  Project-GameLive
//
//  Created by tarena on 16/8/9.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "SMSViewController.h"
#import <SMS_SDK/SMSSDK.h>
@interface SMSViewController ()
@property (weak, nonatomic) IBOutlet UIButton *getCodeBtn;
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *pwdTF;
@property (weak, nonatomic) IBOutlet UITextField *codeTF;
@end

@implementation SMSViewController
- (IBAction)backBtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)getCode:(UIButton *)sender {

    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS
                                   phoneNumber:_phoneTF.text
                                          zone:@"86"
                              customIdentifier:nil
                                 result:^(NSError *error) {
                                     if (!error) {
                                         NSLog(@"获取验证码成功");
                                         //获取验证码成功
                                         sender.enabled = NO;
                                         sender.backgroundColor = [UIColor whiteColor];
                                         sender.layer.borderWidth = 1;
                                         sender.layer.borderColor = kRGB(239, 119, 8, 1).CGColor;
                                         [sender setTitleColor:kRGB(239, 119, 8, 1) forState:UIControlStateDisabled];
                                         __block NSUInteger counter = 60;
                                         [NSTimer bk_scheduledTimerWithTimeInterval:1 block:^(NSTimer *timer) {
                                             if (counter > 0) {
                                                 [sender setTitle:@(counter--).stringValue forState:UIControlStateDisabled];
                                                 //NSLog(@"%ld", self.counter);
                                             } else {
                                                 [sender setTitle:@"获取验证码" forState:UIControlStateNormal];
                                                 counter = 60;
                                                 sender.enabled = YES;
                                                 sender.backgroundColor = kRGB(239, 119, 8, 1);
                                                 sender.layer.borderWidth = 0;
                                                 [timer invalidate];
                                                 
                                             }
                                         } repeats:YES];
                                         [TRFactory addSingleButtonAlertControllerForVC:self alertTitle:@"获取验证码成功" alertMessage:@"请注意查看手机短信" actionTitle:@"确认" actionHanlder:nil];
                                         
                                     } else {
                                         NSLog(@"错误信息: %@", error);
                                         NSString *errStr = [error.userInfo valueForKey:@"getVerificationCode"];
                                         //获取验证码失败
                                         [TRFactory addSingleButtonAlertControllerForVC:self alertTitle:@"出错啦" alertMessage:errStr actionTitle:@"确认" actionHanlder:nil];
                                     }
                                 }];
    
}

- (IBAction)regBtn:(id)sender {
    [SMSSDK commitVerificationCode:_codeTF.text phoneNumber:self.phoneTF.text zone:@"86" result:^(NSError *error) {
        if (!error) {
            NSLog(@"验证成功");
            //将手机号和密码存入Keychain
            NSError *error = nil;
            [YYKeychain setPassword:_pwdTF.text forService:@"registerMobile" account:_phoneTF.text error:&error];
            NSLog(@"%@", error ? error : @"keychain存储成功");
            
            // 弹窗
            [TRFactory addSingleButtonAlertControllerForVC:self alertTitle:@"注册成功" alertMessage:@"请登录" actionTitle:@"确认" actionHanlder:^{
                [self.navigationController popViewControllerAnimated:YES];
            }];
        }
            else {
                NSLog(@"错误信息：%@", error);
                NSString *errStr = [error.userInfo valueForKey:@"commitVerificationCode"];
                [TRFactory addSingleButtonAlertControllerForVC:self alertTitle:@"注册失败" alertMessage:errStr actionTitle:@"确认" actionHanlder:nil];
            }
    }];
    
    
    
}


@end
