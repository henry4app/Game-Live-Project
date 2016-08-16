//
//  StarCell.m
//  Project-GameLive
//
//  Created by tarena on 16/8/3.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "StarCell.h"

@interface StarCell ()<iCarouselDelegate, iCarouselDataSource>

@end

@implementation StarCell

#pragma mark ic Delegate
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    if ([_dataSource respondsToSelector:@selector(numberOfItemsInStarCell:)]) {
        return [_dataSource numberOfItemsInStarCell:self];
    }
    return 0;
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value {
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view {
    if (!view) {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, carousel.bounds.size.height)];
        //view.backgroundColor = [UIColor blueColor];
        UIImageView *iv = [UIImageView new];
        [view addSubview:iv];
        iv.tag = 100;
        //iv.backgroundColor = [UIColor blueColor];
        iv.contentMode = UIViewContentModeScaleAspectFill;
        iv.clipsToBounds = YES;
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(-10);
            make.centerX.equalTo(0);
            make.width.height.equalTo(50);
        }];
        iv.layer.cornerRadius = 25;
        //iv.layer.masksToBounds = YES;
        UILabel *label = [UILabel new];
        [view addSubview:label];
        label.font = [UIFont systemFontOfSize:12];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.top.equalTo(iv.mas_bottom).equalTo(5);
        }];
        label.tag = 200;
    }
    UIImageView *iv = (UIImageView *)[view viewWithTag:100];
    UILabel *label = (UILabel *)[view viewWithTag:200];
    iv.image = [UIImage imageNamed:@"头像边框"];
    label.text = nil;
    if ([_dataSource respondsToSelector:@selector(starCell:titleAtIndex:)]) {
        label.text = [_dataSource starCell:self titleAtIndex:index];
    }
    if ([_dataSource respondsToSelector:@selector(starCell:iconURLAtIndex:)]) {
        [iv setImageWithURL:[_dataSource starCell:self iconURLAtIndex:index] placeholder:[UIImage imageNamed:@"头像边框"]];
    }
    return view;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index {
    if ([_delegate respondsToSelector:@selector(starCell:didSelectedIndex:)]) {
        [_delegate starCell:self didSelectedIndex:index];
    }
}


#pragma mark method
- (void)reloadData {
    [self.ic reloadData];
}

#pragma mark lazy load

- (iCarousel *)ic {
    if(_ic == nil) {
        _ic = [[iCarousel alloc] init];
        //_ic.type = iCarouselTypeTimeMachine;
        [self.contentView addSubview:_ic];
        [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
            make.bottom.equalTo(-1);
        }];
        
        _ic.delegate = self;
        _ic.dataSource = self;
        _ic.pagingEnabled = NO;
        // 负数为往左滚动，正数为往右滚动
        _ic.autoscroll = -.4;
        
        UIView *lineView = [UIView new];
        lineView.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.equalTo(0);
            make.height.equalTo(1);
        }];
    }
    return _ic;
}

@end
