//
//  TopCell.m
//  Project-GameLive
//
//  Created by tarena on 16/8/8.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TopCell.h"

@implementation TopCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self regBtn];
        [self loginBtn];
        [self separatorView];
        [self bgIV];
        [self itemViewList];
        [self bottomView];
        [self liveBtn];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    self.separatorView.backgroundColor = [UIColor whiteColor];
}
/*****上半部分*******/

- (UIImageView *)bgIV {
    if(_bgIV == nil) {
        _bgIV = [[UIImageView alloc] init];
        [self addSubview:_bgIV];
        _bgIV.contentMode = UIViewContentModeScaleAspectFill;
        _bgIV.clipsToBounds = YES;
        _bgIV.image = [UIImage imageNamed:@"ios个人中心背景"];
        _bgIV.userInteractionEnabled = YES;
        [_bgIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
            // 750 * 454
            make.size.equalTo(CGSizeMake(kScreenW, kScreenW * 390 / 750));
        }];
    }
    return _bgIV;
}

- (UIImageView *)headIV {
    if(_headIV == nil) {
        _headIV = [[UIImageView alloc] init];
        [self.bgIV addSubview:_headIV];
        _headIV.contentMode = UIViewContentModeScaleAspectFill;
        _headIV.clipsToBounds = YES;
        _headIV.layer.cornerRadius = 40;
        _headIV.layer.masksToBounds = YES;
        _headIV.layer.borderWidth = 3;
        _headIV.layer.borderColor = kRGB(251, 197, 117, 1).CGColor;
        _headIV.image = [UIImage imageNamed:@"个人中心默认头像"];
        _headIV.userInteractionEnabled = YES;
        [_headIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(0);
            make.size.equalTo(CGSizeMake(80, 80));
        }];
    }
    return _headIV;
}

- (UIView *)separatorView {
    if(_separatorView == nil) {
        _separatorView = [[UIView alloc] init];
        [self.bgIV addSubview:_separatorView];
        _separatorView.backgroundColor = [UIColor whiteColor];
        [_separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(2, 16));
            make.centerX.equalTo(0);
            make.top.equalTo(self.headIV.mas_bottom).equalTo(14);
        }];
    }
    return _separatorView;
}

- (UIButton *)loginBtn {
    if(_loginBtn == nil) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.bgIV addSubview:_loginBtn];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        _loginBtn.tintColor = [UIColor whiteColor];
        _loginBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.separatorView.mas_left).equalTo(-5);
            make.size.equalTo(CGSizeMake(60, 30));
            make.centerY.equalTo(self.separatorView);
        }];
    }
    return _loginBtn;
}

- (UIButton *)regBtn {
    if(_regBtn == nil) {
        _regBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.bgIV addSubview:_regBtn];
        [_regBtn setTitle:@"注册" forState:UIControlStateNormal];
        _regBtn.tintColor = [UIColor whiteColor];
        _regBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [_regBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.separatorView.mas_right).equalTo(5);
            make.size.equalTo(CGSizeMake(60, 30));
            make.centerY.equalTo(self.separatorView);
        }];
        
    }
    return _regBtn;
}

- (UIButton *)liveBtn {
    if(_liveBtn == nil) {
        _liveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_liveBtn];
        _liveBtn.backgroundColor = kRGB(22, 91, 254, 1);
        _liveBtn.tintColor = [UIColor whiteColor];
        [_liveBtn setTitle:@"我要直播" forState:UIControlStateNormal];
        _liveBtn.layer.cornerRadius = 16;
        _liveBtn.layer.masksToBounds = YES;
        _liveBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_liveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.bottom.equalTo(self.bgIV.mas_bottom).equalTo(15);
            make.size.equalTo(CGSizeMake(190, 30));
        }];
    }
    return _liveBtn;
}

/*****下半部分*******/

- (UIView *)bottomView {
    if(_bottomView == nil) {
        _bottomView = [[UIView alloc] init];
        [self addSubview:_bottomView];
        _bottomView.backgroundColor = [UIColor whiteColor];
        [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.top.equalTo(self.bgIV.mas_bottom);
            make.size.equalTo(CGSizeMake(kScreenW, kScreenW * 186 / 750));
        }];
    }
    return _bottomView;
}

- (NSMutableArray<UIView *> *)itemViewList {
    if (_itemViewList == nil) {
        _itemViewList = [NSMutableArray new];
        UIView *lastView = nil;
        for (int i = 0; i < 4; i++) {
            UIView *itemView = [UIView new];
            [_itemViewList addObject:itemView];
            itemView.userInteractionEnabled = YES;
            
            [self.bottomView addSubview:itemView];
            [itemView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(0);
                make.height.equalTo(itemView.mas_width);
                if (i == 0) {
                    make.left.equalTo(5);
                } else {
                    make.left.equalTo(lastView.mas_right).equalTo(10);
                    make.width.equalTo(lastView);
                    if (i == 3) {
                        make.right.equalTo(-5);
                    }
                }
            }];

            lastView = itemView;
            
            UIImageView *itemIcon = [UIImageView new];
            [itemView addSubview:itemIcon];
            itemIcon.contentMode = UIViewContentModeScaleAspectFill;
            itemIcon.clipsToBounds = YES;
            [itemIcon mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.equalTo(CGSizeMake(28, 28));
                make.top.equalTo(20);
                make.centerX.equalTo(0);
                if (i == 0) {
                    itemIcon.image = [UIImage imageNamed:@"观看历史"];
                }
                if (i == 1) {
                    itemIcon.image = [UIImage imageNamed:@"我的关注"];
                }
                if (i == 2) {
                    itemIcon.image = [UIImage imageNamed:@"鱼丸任务"];
                }
                if (i == 3) {
                    itemIcon.image = [UIImage imageNamed:@"鱼翅充值"];
                }
            }];
            
            UILabel *itemLabel = [UILabel new];
            [itemView addSubview:itemLabel];
            itemLabel.font = [UIFont systemFontOfSize:14];
            itemLabel.textColor = kRGB(71, 77, 87, 1);
            [itemView addSubview:itemLabel];
            [itemLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(0);
                make.bottom.equalTo(-5);
                if (i == 0) {
                    itemLabel.text = @"观看历史";
                }
                if (i == 1) {
                    itemLabel.text = @"关注管理";
                }
                if (i == 2) {
                    itemLabel.text = @"鱼丸任务";
                }
                if (i == 3) {
                    itemLabel.text = @"鱼翅充值";
                }

            }];
            
        }
    }
    return _itemViewList;
}




@end
