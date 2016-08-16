//
//  SearchViewModel.h
//  Project-GameLive
//
//  Created by tarena on 16/8/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "NetManager.h"
#import "SearchModel.h"

@interface SearchViewModel : BaseViewModel

@property (nonatomic, readonly) NSInteger rowNumber;
- (NSURL *)icon:(NSInteger)row;
- (NSString *)title:(NSInteger)row;
- (NSString *)host:(NSInteger)row;
- (NSString *)viewNumber:(NSInteger)row;
- (NSURL *)livePath:(NSInteger)row;


//- (instancetype)initWithSearchText:(NSString *)searchText;
@property (nonatomic) NSString *searchText;
@property (nonatomic) NSMutableArray<SearchItemsModel *> *dataList;
@property (nonatomic) NSInteger index;

//@property (nonatomic) NSString *categoryName;
@property (nonatomic) NSInteger pageCount;

@end
