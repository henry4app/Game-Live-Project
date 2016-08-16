//
//  WelcomeViewController.m
//  Project-GameLive
//
//  Created by tarena on 16/8/4.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "WelcomeViewController.h"
#import "iCarousel.h"
#import "MyTabBarController.h"
#import "AppDelegate.h"

@import AVFoundation;
@interface WelcomeViewController ()<iCarouselDelegate, iCarouselDataSource>

@property (nonatomic) iCarousel *ic;
@property (nonatomic) NSArray<UIImage *> *imageList;
@property (nonatomic) AVPlayerLayer *playerLayer;

@end

@implementation WelcomeViewController

#pragma mark ic Delegate
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    return self.imageList.count;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view {
    if (!view) {
        view = [[UIImageView alloc] initWithFrame:carousel.bounds];
        view.contentMode = UIViewContentModeScaleAspectFill;
        view.clipsToBounds = YES;
    }
    ((UIImageView *)view).image = self.imageList[index];
    return view;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index {
    [UIView animateWithDuration:1 animations:^{
        self.view.window.alpha = 0;
        self.view.window.transform = CGAffineTransformMakeScale(1.5, 1.5);
    } completion:^(BOOL finished) {
        AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        delegate.welcomeWindow.hidden = YES;
        //释放指针索引
        delegate.welcomeWindow.rootViewController = nil;
        delegate.welcomeWindow = nil;
        //设置当前版本号为已读版本号
//        NSDictionary *infoDic = [NSBundle mainBundle].infoDictionary;
//        NSString *version = infoDic[@"CFBundleShortVersionString"];
//        [[NSUserDefaults standardUserDefaults] setObject:version forKey:@"ReadVersion"];
//        //立刻写入
//        [[NSUserDefaults standardUserDefaults] synchronize];
    }];
}

- (void)dealloc {
    NSLog(@"dealloc");
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark lazy load
- (iCarousel *)ic {
    if(_ic == nil) {
        _ic = [[iCarousel alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:_ic];
        _ic.delegate = self;
        _ic.dataSource = self;
        _ic.bounces = NO;
        _ic.pagingEnabled = YES;
    }
    return _ic;
}

- (NSArray<UIImage *> *)imageList {
    if(_imageList == nil) {
        NSArray *imageNames960 = @[@"0welcome960", @"1welcome960", @"2welcome960"];
        NSArray *imageNames1136 = @[@"0welcome1136", @"1welcome1136", @"2welcome1136"];
        NSArray *imageNames1334 = @[@"0welcome1334", @"1welcome1334", @"2welcome1334"];
        NSArray *imageNames2208 = @[@"0welcome1472", @"1welcome1472", @"2welcome1472"];
        //获取设备的物理尺寸的高度
        CGFloat height = [UIScreen mainScreen].nativeBounds.size.height;
        NSArray *imageNames = nil;
        if (height == 960) {
            imageNames = imageNames960;
        }
        if (height == 1136) {
            imageNames = imageNames1136;
        }
        if (height == 1334) {
            imageNames = imageNames1334;
        }
        if (height == 2208) {
            imageNames = imageNames2208;
        }
        NSMutableArray *tmpArr = [NSMutableArray new];
        [imageNames enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [tmpArr addObject:[UIImage imageNamed:obj]];
        }];
        _imageList = tmpArr.copy;
        
        
    }
    return _imageList;
}

//隐藏状态栏
- (BOOL)prefersStatusBarHidden {
    return YES;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    //不加背景色会看到底层的Window
    self.view.backgroundColor = [UIColor blackColor];

    //载入视频
    NSURL *videoURL = [[NSBundle mainBundle] URLForResource:@"dyla_movie" withExtension:@"mp4"];
    AVPlayerItem *item = [AVPlayerItem playerItemWithURL:videoURL];
    AVPlayer *player = [AVPlayer playerWithPlayerItem:item];
    _playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
    _playerLayer.frame = self.view.bounds;
    //视频播放界面模式
    _playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    [self.view.layer addSublayer:_playerLayer];
    [player play];
    
    //添加播放结束之后的监听事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playToEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:item];
    
}

- (void)playToEnd {
    [_playerLayer removeFromSuperlayer];
    [self.ic reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}







@end
