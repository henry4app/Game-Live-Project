//
//  LiveCell.m
//  Project-GameLive
//
//  Created by tarena on 16/7/29.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LiveCell.h"

@implementation LiveCell

- (UIImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconIV];
        _iconIV.contentMode = UIViewContentModeScaleAspectFill;
        _iconIV.clipsToBounds = YES;
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
        }];
    }
    return _iconIV;
}

- (UIView *)bottomView {
    if(_bottomView == nil) {
        _bottomView = [[UIView alloc] init];
        [self.contentView addSubview:_bottomView];
        _bottomView.backgroundColor = [UIColor whiteColor];
        [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(26);
            make.left.right.equalTo(0);
            make.top.equalTo(self.iconIV.mas_bottom);
        }];
    }
    return _bottomView;
}

- (UILabel *)titleLabel {
    if(_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        [self.bottomView addSubview:_titleLabel];
        _titleLabel.numberOfLines = 1;
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.centerY.equalTo(0);
            
        }];
    }
    return _titleLabel;
}

- (UIView *)maskView {
    if(_maskView == nil) {
        _maskView = [[UIView alloc] init];
        [self.iconIV addSubview:_maskView];
        _maskView.backgroundColor = kRGB(0, 0, 0, 0.5);
        [_maskView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(20);
            make.left.right.bottom.equalTo(0);
            
        }];
    }
    return _maskView;
}

- (UILabel *)nickLabel {
    if(_nickLabel == nil) {
        _nickLabel = [[UILabel alloc] init];
        [self.maskView addSubview:_nickLabel];
        _nickLabel.textColor = [UIColor whiteColor];
        _nickLabel.font = [UIFont systemFontOfSize:13];
        _nickLabel.textAlignment = NSTextAlignmentLeft;
        [_nickLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nickIconIV.mas_right).equalTo(2);
            make.centerY.equalTo(0);
            make.width.lessThanOrEqualTo(90);
        }];
        
    }
    return _nickLabel;
}

- (UIImageView *)nickIconIV {
    if(_nickIconIV == nil) {
        _nickIconIV = [[UIImageView alloc] init];
        [self.maskView addSubview:_nickIconIV];
        _nickIconIV.contentMode = UIViewContentModeScaleAspectFill;
        _nickIconIV.clipsToBounds = YES;
        _nickIconIV.image = [UIImage imageNamed:@"主播名"];
        //_nickIconIV.backgroundColor = [UIColor redColor];
        [_nickIconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.left.equalTo(2);
            make.size.equalTo(CGSizeMake(12, 12));
        }];
    }
    return _nickIconIV;
}

- (UILabel *)viewLabel {
    if(_viewLabel == nil) {
        _viewLabel = [[UILabel alloc] init];
        [self.maskView addSubview:_viewLabel];
        _viewLabel.textColor = [UIColor whiteColor];
        _viewLabel.font = [UIFont systemFontOfSize:12];
        [_viewLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-5);
            make.centerY.equalTo(0);
            make.width.lessThanOrEqualTo(46);
            
        }];
    }
    return _viewLabel;
}

- (UIImageView *)viewIconIV {
    if(_viewIconIV == nil) {
        _viewIconIV = [[UIImageView alloc] init];
        [self.maskView addSubview:_viewIconIV];
        _viewIconIV.image = [UIImage imageNamed:@"主播名"];
        _viewIconIV.contentMode = UIViewContentModeScaleAspectFill;
        _viewIconIV.clipsToBounds = YES;
        [_viewIconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.right.equalTo(self.viewLabel.mas_left).equalTo(-2);
            make.size.equalTo(CGSizeMake(12, 12));
        }];
    }
    return _viewIconIV;
}


@end
