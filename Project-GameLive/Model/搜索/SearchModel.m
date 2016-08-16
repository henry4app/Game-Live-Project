//
//  SearchModel.m
//  Project-GameLive
//
//  Created by tarena on 16/8/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "SearchModel.h"

@implementation SearchModel



@end


@implementation SearchDataModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"items":[SearchItemsModel class]};
}

@end

@implementation SearchItemsModel



@end