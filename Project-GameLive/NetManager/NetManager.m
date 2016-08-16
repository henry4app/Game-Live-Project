//
//  NetManager.m
//  Project-GameLive
//
//  Created by tarena on 16/7/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NetManager.h"

@implementation NetManager
//http://www.quanmin.tv/json/play/list%@.json
+ (id)getLiveRoomModel:(NSString *)index completionHandler:(void (^)(LiveRoomModel *, NSError *))completionHandler {
    NSString *path = [NSString stringWithFormat:kLiveRoom,index];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler?:completionHandler([LiveRoomModel parse:responseObj], error);
    }];
}

+ (id)getCategoriesModelWithCompletionHandler:(void (^)(NSArray<CategoriesModel *> *, NSError *))completionHandler {

    return [self GET:kCategories parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler?:completionHandler([CategoriesModel parse:responseObj], error);
    }];
}

+ (id)getGameListModel:(NSString *)category index:(NSString *)index completionHandler:(void (^)(LiveRoomModel *, NSError *))completionHandler {
    
    NSString *path = [NSString stringWithFormat:kGameList, category, index];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        
        !completionHandler?:completionHandler([LiveRoomModel parse:responseObj], error);
    }];
    
}

+ (id)getIndexModelCompletionHandler:(void (^)(RecModel *, NSError *))completionHandler {
    NSString *path = kIndexPage;
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler?:completionHandler([RecModel parse:responseObj], error);
    }];
}

+ (id)getSearchResultWithSearchText:(NSString *)searchText page:(NSString *)page completionHandler:(void (^)(SearchModel *model, NSError *error))completionHandler {
    NSMutableDictionary *params = [NSMutableDictionary new];
    [params setObject:@"site.search" forKey:@"m"];
    [params setObject:@"2" forKey:@"os"];
    [params setObject:@"0" forKey:@"p[categoryId]"];
    [params setObject:searchText forKey:@"p[key]"];
    [params setObject:page forKey:@"p[page]"];
    [params setObject:@"10" forKey:@"p[size]"];
    [params setObject:@"1.3.2" forKey:@"v"];
    return [self POST:@"http://www.quanmin.tv/api/v1" parameters:params completionHandler:^(id responseObj, NSError *error) {
        //NSLog(@"YY modelToJSONString:%@", [responseObj modelToJSONString]);
        !completionHandler?:completionHandler([SearchModel parse:responseObj], error);
    }];
}

+ (id)getRoomModel:(NSString *)uid completionHandler:(void(^)(RoomModel *model, NSError *error))completionHandler {
    NSString *path = [NSString stringWithFormat:KRoom, uid];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler?:completionHandler([RoomModel parse:responseObj], error);
    }];
}

// test
+ (id)testGetSearchResultWithSearchText:(NSString *)searchText completionHandler:(void(^)(NSDictionary *model, NSError *error))completionHandler {
    NSMutableDictionary *params = [NSMutableDictionary new];
    [params setObject:@"site.search" forKey:@"m"];
    [params setObject:@"2" forKey:@"os"];
    [params setObject:@"0" forKey:@"p[categoryId]"];
    [params setObject:searchText forKey:@"p[key]"];
    [params setObject:@"0" forKey:@"p[page]"];
    [params setObject:@"10" forKey:@"p[size]"];
    [params setObject:@"1.3.2" forKey:@"v"];
    return [self POST:@"http://www.quanmin.tv/api/v1" parameters:params completionHandler:^(id responseObj, NSError *error) {

        !completionHandler?:completionHandler(responseObj, error);
    }];

}

@end
