//
//  SectionHeaderView.m
//  Project-GameLive
//
//  Created by tarena on 16/8/2.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "SectionHeaderView.h"

@implementation SectionHeaderView

- (void)setCellType:(IntroCellType)cellType {
    if (_cellType == cellType) {
        return;
    }
    _cellType = cellType;
    [_rightBtn removeFromSuperview];
    _rightBtn = nil;
    [_rightImage removeFromSuperview];
    _rightImage = nil;
    
    
    [self rightBtn];
    [self rightImage];
}

- (UIImageView *)sideImage {
    if(_sideImage == nil) {
        _sideImage = [[UIImageView alloc] init];
        [self addSubview:_sideImage];
        _sideImage.contentMode = UIViewContentModeScaleAspectFill;
        _sideImage.clipsToBounds = YES;
        _sideImage.image = [UIImage imageNamed:@"栏目标题"];
        [_sideImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.left.equalTo(6);
            make.size.equalTo(CGSizeMake(3, 20));
        }];
    }
    return _sideImage;
}

- (UILabel *)sectionTitleLb {
    if(_sectionTitleLb == nil) {
        _sectionTitleLb = [[UILabel alloc] init];
        [self addSubview:_sectionTitleLb];
        _sectionTitleLb.font = [UIFont systemFontOfSize:16];
        _sectionTitleLb.textAlignment = NSTextAlignmentLeft;
        [_sectionTitleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.sideImage.mas_right).equalTo(5);
            make.centerY.equalTo(0);
            make.width.lessThanOrEqualTo(100);
        }];
        
    }
    return _sectionTitleLb;
}

- (UIButton *)rightBtn {
    if(_rightBtn == nil) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self addSubview:_rightBtn];
        _rightBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _rightBtn.tintColor = [UIColor blackColor];
        //设置btn标题
        //_rightBtn.titleLabel.text = _cellType == IntroCellTypeMore ? @"更多" : @"换一换";
        [_rightBtn setTitle:_cellType == IntroCellTypeMore ? @"更多" : @"换一换" forState:UIControlStateNormal];
        //设置btn点击事件
        [_rightBtn bk_addEventHandler:^(id sender) {
            !_btnClicked?:_btnClicked(_section);
        } forControlEvents:UIControlEventTouchUpInside];
        
        [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-10);
            make.centerY.equalTo(0);
            make.width.equalTo(46);
            
        }];
        
    }
    return _rightBtn;
}

- (UIImageView *)rightImage {
    if(_rightImage == nil) {
        _rightImage = [[UIImageView alloc] init];
        [self addSubview:_rightImage];
        _rightImage.contentMode = UIViewContentModeScaleAspectFill;
        _rightImage.clipsToBounds = YES;
        _rightImage.image = [UIImage imageNamed:_cellType == IntroCellTypeMore ? @"更多" : @"换一换"];
        [_rightImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.rightBtn.mas_left).equalTo(-2);
            make.centerY.equalTo(0);
            make.size.equalTo(CGSizeMake(15, 15));
        }];
    }
    return _rightImage;
}

- (void)setBtnClicked:(void (^)(NSInteger))btnClicked {
    _btnClicked = btnClicked;
}

@end
