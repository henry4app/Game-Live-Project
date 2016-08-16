//
//  NetManager.h
//  Project-GameLive
//
//  Created by tarena on 16/7/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BaseNetworking.h"
#import "LiveRoomModel.h"
#import "CategoriesModel.h"
#import "RecModel.h"
#import "SearchModel.h"
#import "RoomModel.h"

@interface NetManager : BaseNetworking

+ (id)getLiveRoomModel:(NSString *)index completionHandler:(void(^)(LiveRoomModel *model, NSError *error))completionHandler;

+ (id)getCategoriesModelWithCompletionHandler:(void(^)(NSArray<CategoriesModel *> *model, NSError *error))completionHandler;

+ (id)getGameListModel:(NSString *)category index:(NSString *)index completionHandler:(void(^)(LiveRoomModel *model, NSError *error))completionHandler;

+ (id)getIndexModelCompletionHandler:(void(^)(RecModel *model, NSError *error))completionHandler;

+ (id)getSearchResultWithSearchText:(NSString *)searchText page:(NSString *)page completionHandler:(void(^)(SearchModel *model, NSError *error))completionHandler;

+ (id)getRoomModel:(NSString *)uid completionHandler:(void(^)(RoomModel *model, NSError *error))completionHandler;

/***********test************/
// test
+ (id)testGetSearchResultWithSearchText:(NSString *)searchText completionHandler:(void(^)(NSDictionary *model, NSError *error))completionHandler;

@end
