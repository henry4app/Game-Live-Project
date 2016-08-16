//
//  MiddleCell.m
//  Project-GameLive
//
//  Created by tarena on 16/8/8.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "MiddleCell.h"

@implementation MiddleCell

- (UIImageView *)cellIconIV {
    if(_cellIconIV == nil) {
        _cellIconIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_cellIconIV];
        _cellIconIV.contentMode = UIViewContentModeScaleAspectFill;
        _cellIconIV.clipsToBounds = YES;
        [_cellIconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.size.equalTo(CGSizeMake(18, 18));
            make.left.equalTo(12);
        }];
    }
    return _cellIconIV;
}

- (UILabel *)title {
    if(_title == nil) {
        _title = [[UILabel alloc] init];
        [self.contentView addSubview:_title];
        _title.font = [UIFont systemFontOfSize:16];
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.left.equalTo(self.cellIconIV.mas_right).equalTo(10);
        }];
    }
    return _title;
}


- (UILabel *)descLabel {
    if(_descLabel == nil) {
        _descLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_descLabel];
        _descLabel.textColor = [UIColor lightGrayColor];
        _descLabel.font = [UIFont systemFontOfSize:14];
        _descLabel.textAlignment = NSTextAlignmentRight;
        [_descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.right.equalTo(-10);
            
        }];
    }
    return _descLabel;
}

@end
