//
//  AdCell.m
//  Project-GameLive
//
//  Created by 顾晨洁 on 16/8/2.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "AdCell.h"

@interface AdCell ()<iCarouselDelegate, iCarouselDataSource>
@property (nonatomic) UIView *maskView;
@end

@implementation AdCell
#pragma mark ic Delegate
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    if ([_dataSource respondsToSelector:@selector(numberOfItemsInCell:)]) {
        return [_dataSource numberOfItemsInCell:self];
    }
    return 0;
}

-  (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view {
    if (view == nil) {
        view = [[UIImageView alloc] initWithFrame:carousel.bounds];
    }
    if ([_dataSource respondsToSelector:@selector(iconURLForItemInCell:atIndex:)]) {
        [((UIImageView *)view) setImageWithURL:[_dataSource iconURLForItemInCell:self atIndex:index] placeholder:[UIImage imageNamed:@"主播正在赶来"]];
    } else {
        ((UIImageView *)view).image = [UIImage imageNamed:@"主播正在赶来"];
    }
    return view;
}

- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel {
    _pageControl.currentPage = carousel.currentItemIndex;
    if ([_dataSource respondsToSelector:@selector(titleForItemInCell:atIndex:)]) {
        _titleLb.text = [_dataSource titleForItemInCell:self atIndex:carousel.currentItemIndex];
    }
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index {
    if ([_delegate respondsToSelector:@selector(carousel:didSelectItemAtIndex:)]) {
        [_delegate adCell:self didSelecteIconAtIndex:index];
    }
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value {
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}

#pragma mark method

- (void)reloadData {
    if ([_dataSource respondsToSelector:@selector(numberOfItemsInCell:)]) {
        _pageControl.numberOfPages = [_dataSource numberOfItemsInCell:self];
    }
    if ([_dataSource respondsToSelector:@selector(titleForItemInCell:atIndex:)]) {
        if ([_dataSource respondsToSelector:@selector(numberOfItemsInCell:)]) {
            if ([_dataSource numberOfItemsInCell:self] > 0) {
                self.titleLb.text = [_dataSource titleForItemInCell:self atIndex:0];
            }
        }
    }
    [_ic reloadData];
    
    [_timer invalidate];
    _timer = nil;
    _timer = [NSTimer bk_scheduledTimerWithTimeInterval:2 block:^(NSTimer *timer) {
        [self.ic scrollToItemAtIndex:_ic.currentItemIndex + 1 animated:YES];
    } repeats:YES];
}



#pragma mark lifecycle
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self ic];
        [self titleLb];
        [self pageControl];
    }
    return self;
}


#pragma mark lazy load
- (iCarousel *)ic {
    if(_ic == nil) {
        _ic = [[iCarousel alloc] init];
        [self.contentView addSubview:_ic];
        [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _ic.delegate = self;
        _ic.dataSource = self;
        _ic.pagingEnabled = YES;
    }
    return _ic;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self.maskView addSubview:_titleLb];
        _titleLb.textColor = [UIColor whiteColor];
        _titleLb.font = [UIFont systemFontOfSize:14];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.centerY.equalTo(0);
        }];
    }
    return _titleLb;
}

- (UIPageControl *)pageControl {
    if(_pageControl == nil) {
        _pageControl = [[UIPageControl alloc] init];
        [self.maskView addSubview:_pageControl];
        [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-5);
            make.centerY.equalTo(0);
        }];
    }
    return _pageControl;
}

- (UIView *)maskView {
	if(_maskView == nil) {
		_maskView = [[UIView alloc] init];
        [self.contentView addSubview:_maskView];
        _maskView.backgroundColor = kRGB(0, 0, 0, 0.5);
        [_maskView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.height.equalTo(30);
        }];
	}
	return _maskView;
}

@end
