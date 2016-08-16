//
//  RoomModel.m
//  Project-GameLive
//
//  Created by tarena on 16/8/15.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "RoomModel.h"

@implementation RoomModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"rank_curr":[RoomRankWeekModel class],
             @"room_lines":[RoomRoomLinesModel class],
             @"rank_week":[RoomRankWeekModel class],
             @"rank_total":[RoomRankWeekModel class],};
}


@end

@implementation RoomLiveModel

@end


@implementation RoomLiveWsModel

@end


@implementation RoomLiveWsHlsModel

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{@"L0":@"0",
             @"L1":@"1",
             @"L2":@"2",
             @"L3":@"3",
             @"L4":@"4",
             @"L5":@"5"};
}

@end


@implementation RoomLiveWsHls3Model

@end


@implementation RoomLiveWsHls4Model

@end


@implementation RoomLiveWsHls5Model

@end


@implementation RoomRoomLinesModel

@end



@implementation RoomRankWeekModel

@end


