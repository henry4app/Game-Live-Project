//
//  LiveRoomModel.m
//  Project-GameLive
//
//  Created by tarena on 16/7/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LiveRoomModel.h"

@implementation LiveRoomModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"data":[LiveRoomDataModel class]};
}

@end
@implementation LiveRoomRecommendModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"data":[LiveRoomRecommendDataModel class]};
}

@end


@implementation LiveRoomRecommendDataModel

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{@"ID":@"id"};
}

@end


@implementation Link_Object

@end


@implementation LiveRoomDataModel

@end


