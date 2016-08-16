//
//  RoomViewController.m
//  Project-GameLive
//
//  Created by tarena on 16/8/15.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "RoomViewController.h"
#import "RoomViewModel.h"
#import <IJKMediaFramework/IJKMediaFramework.h>
@interface RoomViewController ()

@property (nonatomic) RoomViewModel *viewModel;
@property (nonatomic, strong) IJKFFMoviePlayerController *player;
@end

@implementation RoomViewController

#pragma mark Init and lazy load
- (instancetype)initWithUid:(NSString *)uid {
    if (self = [super init]) {
        _uid = uid;
    }
    return self;
}

- (RoomViewModel *)viewModel {
    if(_viewModel == nil) {
        _viewModel = [[RoomViewModel alloc] initWithUid:self.uid];
    }
    return _viewModel;
}

#pragma mark -
#pragma mark View lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    //获取ViewModel数据
    [self.viewModel getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
        NSLog(@"%@", [self.viewModel defaultVideoPath]);
        [self playVideo];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        
        [btn setTitle:@"Change" forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor purpleColor];
        btn.frame = CGRectMake(20, 20, 60, 40);
        [btn addTarget:self action:@selector(changeBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.player.view addSubview:btn];
    }];


}

- (void)dismissController:sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -
#pragma mark Private methods

- (void)playVideo {
    self.player = [[IJKFFMoviePlayerController alloc] initWithContentURLString:[self.viewModel defaultVideoPath] withOptions:[IJKFFOptions optionsByDefault]];
    [self.player prepareToPlay];
    self.player.scalingMode = IJKMPMovieScalingModeAspectFit;
    // 750 * 420
    self.player.view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.player.view];
}

- (void)changeBtnClicked:sender {
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        SEL selector = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        int val = UIInterfaceOrientationPortrait;
        if ([UIDevice currentDevice].orientation == UIDeviceOrientationPortrait) {
            val = UIInterfaceOrientationLandscapeRight;
        }
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    if ([UIDevice currentDevice].orientation == UIDeviceOrientationPortrait) {
        self.player.view.frame = CGRectMake(0, 0, kScreenW, kScreenW * 420 / 750);
    } else if ([UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeLeft || [UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeRight) {
        self.player.view.frame = [UIScreen mainScreen].bounds;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
