//
//  SearchModel.h
//  Project-GameLive
//
//  Created by tarena on 16/8/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SearchDataModel, SearchItemsModel;
@interface SearchModel : NSObject

@property (nonatomic) SearchDataModel *data;

@end

@interface SearchDataModel : NSObject

@property (nonatomic) NSArray<SearchItemsModel *> *items;
@property (nonatomic, assign) NSInteger pageNb;
@property (nonatomic, assign) NSInteger total;

@end

@interface SearchItemsModel : NSObject

@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *category_id;
@property (nonatomic, copy) NSString *category_name;
@property (nonatomic, copy) NSString *category_slug;
@property (nonatomic, assign) BOOL is_shield;
@property (nonatomic, copy) NSString *nick;
@property (nonatomic, copy) NSString *play_status;
@property (nonatomic, copy) NSString *slug;
@property (nonatomic, copy) NSString *thumb;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *view;


@end