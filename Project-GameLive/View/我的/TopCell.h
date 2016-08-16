//
//  TopCell.h
//  Project-GameLive
//
//  Created by tarena on 16/8/8.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopCell : UIView

@property (nonatomic) UIImageView *bgIV;
@property (nonatomic) UIView *bottomView;
@property (nonatomic) UIImageView *headIV;
@property (nonatomic) UIView *separatorView;
@property (nonatomic) UIButton *loginBtn;
@property (nonatomic) UIButton *regBtn;
@property (nonatomic) UIButton *liveBtn;
@property (nonatomic) NSMutableArray<UIView *> *itemViewList;
@property (nonatomic) UIImageView *itemIconIV;
@property (nonatomic) UILabel *itemLabel;



@end
