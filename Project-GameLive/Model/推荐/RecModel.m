//
//  RecModel.m
//  Project-GameLive
//
//  Created by tarena on 16/8/1.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "RecModel.h"

@implementation RecModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"mobileWebgame":[MobileBeauty class],
             @"mobileMinecraft":[MobileBeauty class],
             @"mobileTvgame":[MobileBeauty class],
             @"mobileSport":[MobileBeauty class],
             @"mobileStar":[MobileBeauty class],
             @"mobileRecommendation":[MobileBeauty class],
             @"mobileLol":[MobileBeauty class],
             @"mobileBeauty":[MobileBeauty class],
             @"mobileHeartstone":[MobileBeauty class],
             @"mobileBlizzard":[MobileBeauty class],
             @"mobileDota2":[MobileBeauty class],
             @"mobileDnf":[MobileBeauty class],
             @"mobileIndex":[MobileBeauty class],
             @"list":[List class]};
}

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{@"mobileWebgame":@"moblie-webgame",
             @"mobileMinecraft":@"moblie-minecraft",
             @"mobileTvgame":@"mobile-tvgame",
             @"mobileSport":@"moblie-sport",
             @"mobileStar":@"mobile-star",
             @"mobileRecommendation":@"mobile-recommendation",
             @"mobileIndex":@"mobile-index",
             @"mobileLol":@"mobile-lol",
             @"mobileBeauty":@"mobile-beauty",
             @"mobileHeartstone":@"mobile-heartstone",
             @"mobileBlizzard":@"moblie-blizzard",
             @"mobileDota2":@"mobile-dota2",
             @"mobileDnf":@"moblie-dnf"};
}

@end

@implementation MobileBeauty


@end

@implementation LinkObject



@end

@implementation List



@end