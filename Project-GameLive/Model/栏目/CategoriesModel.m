//
//  CategoriesModel.m
//  Project-GameLive
//
//  Created by tarena on 16/7/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "CategoriesModel.h"

@implementation CategoriesModel

kCodingDesc

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{@"ID":@"id"};
}

@end



