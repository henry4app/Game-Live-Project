//
//  RoomViewModel.m
//  Project-GameLive
//
//  Created by tarena on 16/8/15.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "RoomViewModel.h"

@implementation RoomViewModel

- (instancetype)initWithUid:(NSString *)uid {
    if (self = [super init]) {
        _uid = uid;
    }
    return self;
}

- (NSMutableArray<RoomModel *> *)dataList {
    if (!_dataList) {
        _dataList = [NSMutableArray new];
    }
    return _dataList;
}

- (NSString *)defaultVideoPath {
    NSInteger lineNumber = self.linesList[0].hls.main_mobile;

    switch (lineNumber) {
        case 0:
            return self.linesList[0].hls.L0.src;
            break;
        case 1:
            return self.linesList[0].hls.L1.src;
            break;
        case 2:
            return self.linesList[0].hls.L2.src;
            break;
        case 3:
            return self.linesList[0].hls.L3.src;
            break;
        case 4:
            return self.linesList[0].hls.L4.src;
            break;
        case 5:
            return self.linesList[0].hls.L5.src;
            break;
        default:
            return self.linesList[0].hls.L0.src;
            break;
    }
}
- (NSURL *)videoThumb {
    return self.dataList.firstObject.thumb.yx_URL;
}
- (NSURL *)hostIcon {
    return self.dataList.firstObject.avatar.yx_URL;
}
- (NSString *)hostName {
    return self.dataList.firstObject.nick;
}
- (NSString *)roomTitle {
    return self.dataList.firstObject.title;
}
- (NSString *)view {
    NSInteger number = self.dataList.firstObject.view;
    if (number > 10000) {
        return [NSString stringWithFormat:@"%.1f万", number / 10000.0];
    } else {
        return [NSString stringWithFormat:@"%ld", number];
    }
}

- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler {
    
    self.dataTask = [NetManager getRoomModel:self.uid completionHandler:^(RoomModel *model, NSError *error) {
        [self.dataList addObject:model];
        self.linesList = self.dataList.firstObject.room_lines;
        !completionHandler?:completionHandler(error);
    }];

}


@end
