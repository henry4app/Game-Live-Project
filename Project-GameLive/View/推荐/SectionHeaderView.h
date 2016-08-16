//
//  SectionHeaderView.h
//  Project-GameLive
//
//  Created by tarena on 16/8/2.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, IntroCellType) {
    IntroCellTypeUnknown,
    IntroCellTypeMore, //更多
    IntroCellTypeChange, //换一换
};


@interface SectionHeaderView : UICollectionReusableView

@property (nonatomic) UIImageView *sideImage;
@property (nonatomic) UILabel *sectionTitleLb;
@property (nonatomic) UIButton *rightBtn;
@property (nonatomic) UIImageView *rightImage;

@property (nonatomic) IntroCellType cellType;
@property (nonatomic, copy) void(^btnClicked)(NSInteger section);
@property (nonatomic) NSInteger section;



@end
