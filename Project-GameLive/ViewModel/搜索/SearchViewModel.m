//
//  SearchViewModel.m
//  Project-GameLive
//
//  Created by tarena on 16/8/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "SearchViewModel.h"

@implementation SearchViewModel

//- (instancetype)initWithSearchText:(NSString *)searchText {
//    if (self = [super init]) {
//        _searchText = searchText;
//    }
//    return self;
//}

- (NSMutableArray<SearchItemsModel *> *)dataList {
    if (!_dataList) {
        _dataList = [NSMutableArray new];
    }
    return _dataList;
}

- (NSInteger)rowNumber {
    return self.dataList.count;
}

- (NSURL *)icon:(NSInteger)row {
    return self.dataList[row].thumb.yx_URL;
}

- (NSString *)title:(NSInteger)row {
    return self.dataList[row].title;
}

- (NSString *)host:(NSInteger)row {
    return self.dataList[row].nick;
}

- (NSString *)viewNumber:(NSInteger)row {
    NSInteger number = self.dataList[row].view.integerValue;
    if (number > 10000) {
        return [NSString stringWithFormat:@"%.1f万", number / 10000.0];
    } else {
        return [NSString stringWithFormat:@"%ld", number];
    }
}

- (NSURL *)livePath:(NSInteger)row {
    NSString *path = [NSString stringWithFormat:kLivePath, self.dataList[row].uid];
    return path.yx_URL;
}

- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler {
    NSInteger tmpIndex = 0;
    if (requestMode == RequestModeMore) {
        tmpIndex = self.index + 1;
        if (tmpIndex == self.pageCount) {
            NSLog(@"已经全部加载完毕");
            self.index += 1;
            !completionHandler?:completionHandler(nil);
            return;
        }
    }
    
    self.dataTask = [NetManager getSearchResultWithSearchText:self.searchText page:[NSString stringWithFormat:@"%ld", tmpIndex] completionHandler:^(SearchModel *model, NSError *error) {
        if (!error) {
            if (requestMode == RequestModeRefresh) {
                [self.dataList removeAllObjects];
            }
        
            [self.dataList addObjectsFromArray:model.data.items];
            self.pageCount = model.data.pageNb;
            NSLog(@"pageCount: %ld", self.pageCount);
            self.index = tmpIndex;
            
        }
        !completionHandler?:completionHandler(error);
        
    }];
}


@end
