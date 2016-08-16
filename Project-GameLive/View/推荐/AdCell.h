//
//  AdCell.h
//  Project-GameLive
//
//  Created by 顾晨洁 on 16/8/2.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"
@class AdCell;

@protocol AdCellDataSource <NSObject>

- (NSInteger)numberOfItemsInCell:(AdCell *)cell;
- (NSURL *)iconURLForItemInCell:(AdCell *)cell atIndex:(NSInteger)index;
- (NSString *)titleForItemInCell:(AdCell *)cell atIndex:(NSInteger)index;

@end

@protocol AdCellDelegate <NSObject>

- (void)adCell:(AdCell *)cell didSelecteIconAtIndex:(NSInteger)index;

@end

@interface AdCell : UICollectionViewCell

@property (nonatomic) iCarousel *ic;
@property (nonatomic) UILabel *titleLb;
@property (nonatomic) UIPageControl *pageControl;

@property (nonatomic, weak) id<AdCellDelegate>delegate;
@property (nonatomic, weak) id<AdCellDataSource>dataSource;

- (void)reloadData;

@property (nonatomic) NSTimer *timer;

@end
