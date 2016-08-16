//
//  StarCell.h
//  Project-GameLive
//
//  Created by tarena on 16/8/3.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"
@class StarCell;
@protocol StarCellDataSource <NSObject>

- (NSInteger)numberOfItemsInStarCell:(StarCell *)cell;
- (NSURL *)starCell:(StarCell *)cell iconURLAtIndex:(NSInteger)index;
- (NSString *)starCell:(StarCell *)cell titleAtIndex:(NSInteger)index;

@end

@protocol StarCellDelegate <NSObject>

- (void)starCell:(StarCell *)cell didSelectedIndex:(NSInteger)index;

@end

@interface StarCell : UICollectionViewCell

@property (nonatomic) iCarousel *ic;
@property (nonatomic, weak) id<StarCellDataSource>dataSource;
@property (nonatomic, weak) id<StarCellDelegate>delegate;

- (void)reloadData;



@end
