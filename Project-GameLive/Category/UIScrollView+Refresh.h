//
//  UIScrollView+Refresh.h
//  TRProject
//
//  Created by tarena on 16/7/13.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Refresh)

@property (nonatomic) MJRefreshGifHeader *header;

- (void)addHeaderRefresh:(void(^)())block;
- (void)addFooterRefresh:(void(^)())block;

- (void)beginHeaderRefresh;
- (void)endHeaderRefresh;

- (void)endFooterRefresh;

- (void)noticeNoMoreData;

- (void)addGifHeaderRefresh:(void(^)())block;

@end











