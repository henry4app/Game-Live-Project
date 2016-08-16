//
//  UIScrollView+Refresh.m
//  TRProject
//
//  Created by tarena on 16/7/13.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "UIScrollView+Refresh.h"

@implementation UIScrollView (Refresh)
- (void)addHeaderRefresh:(void(^)())block{
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:block];
}
- (void)addFooterRefresh:(void(^)())block{
    self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:block];
}
- (void)beginHeaderRefresh{

    [self.mj_header beginRefreshing];
//    if ([self.header isRefreshing]) {
//        NSLog(@"will refresh");
//        self.header.lastUpdatedTimeLabel.hidden = !self.header.lastUpdatedTimeLabel.hidden;
//        self.header.stateLabel.hidden = !self.header.stateLabel.hidden;
//    }

}
- (void)endHeaderRefresh{
    [self.mj_header endRefreshing];
}

- (void)endFooterRefresh{
    [self.mj_footer endRefreshing];
}

- (void)noticeNoMoreData {
    [self.mj_footer endRefreshingWithNoMoreData];
}

- (void)addGifHeaderRefresh:(void (^)())block {
    self.header = [MJRefreshGifHeader headerWithRefreshingBlock:block];
    
    UIImage *idleImage = [UIImage imageNamed:@"img_mj_stateIdle"];
    UIImage *pullingImage = [UIImage imageNamed:@"img_mj_statePulling"];
    UIImage *refresing01 = [UIImage imageNamed:@"img_mj_stateRefreshing_01"];
    UIImage *refresing02 = [UIImage imageNamed:@"img_mj_stateRefreshing_02"];
    UIImage *refresing03 = [UIImage imageNamed:@"img_mj_stateRefreshing_03"];
    UIImage *refresing04 = [UIImage imageNamed:@"img_mj_stateRefreshing_04"];
    
    [self.header setImages: @[idleImage] forState:MJRefreshStateIdle];
    [self.header setImages:@[pullingImage] forState:MJRefreshStatePulling];
    [self.header setImages:@[refresing01,refresing02,refresing03,refresing04] forState:MJRefreshStateRefreshing];
    
    
}


@end








