//
//  LiveViewModel.m
//  Project-GameLive
//
//  Created by tarena on 16/7/29.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LiveViewModel.h"

@implementation LiveViewModel

- (NSMutableArray<LiveRoomDataModel *> *)dataList {
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

- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler {
    
    
    NSInteger tmpIndex = 0;
    NSString *tmpPath = [NSString stringWithFormat:@""];
    
    
    
    if (requestMode == RequestModeMore) {

        tmpIndex = self.index + 1;
        if (tmpIndex == self.pageCount) {
            NSLog(@"到头了");
            self.index += 1;
            !completionHandler?:completionHandler(nil);
            return;
        }
        //NSLog(@"test1");
        tmpPath = [NSString stringWithFormat:@"_%ld", tmpIndex];

    }
    
    //NSLog(@"test2");
    if (self.categoryName) {
        self.dataTask = [NetManager getGameListModel:self.categoryName index:tmpPath completionHandler:^(LiveRoomModel *model, NSError *error) {
            if (!error) {
                if (requestMode == RequestModeRefresh) {
                    [self.dataList removeAllObjects];
                }
                [self.dataList addObjectsFromArray:model.data];
                self.pageCount = model.pageCount;
                NSLog(@"pagecount:%ld", self.pageCount);
                self.index = tmpIndex;
                
                
            }
            !completionHandler?:completionHandler(error);
        }];
    } else {
    
        self.dataTask = [NetManager getLiveRoomModel:tmpPath completionHandler:^(LiveRoomModel *model, NSError *error) {
            if (!error) {
                if (requestMode == RequestModeRefresh) {
                    [self.dataList removeAllObjects];
                }
                [self.dataList addObjectsFromArray:model.data];
                self.pageCount = model.pageCount;
                NSLog(@"pagecount:%ld", self.pageCount);
                self.index = tmpIndex;
                
                
            }
            !completionHandler?:completionHandler(error);
        }];
    }
    //NSLog(@"test3");
}

- (NSURL *)livePath:(NSInteger)row {
    NSString *path = [NSString stringWithFormat:kLivePath, self.dataList[row].uid];
    return path.yx_URL;
}

- (NSString *)uid:(NSInteger)row {
    return self.dataList[row].uid;
}

@end
