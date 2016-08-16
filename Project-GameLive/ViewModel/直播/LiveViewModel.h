//
//  LiveViewModel.h
//  Project-GameLive
//
//  Created by tarena on 16/7/29.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "NetManager.h"
#import "LiveRoomModel.h"
@interface LiveViewModel : BaseViewModel

@property (nonatomic, readonly) NSInteger rowNumber;
- (NSURL *)icon:(NSInteger)row;
- (NSString *)title:(NSInteger)row;
- (NSString *)host:(NSInteger)row;
- (NSString *)viewNumber:(NSInteger)row;
- (NSURL *)livePath:(NSInteger)row;
- (NSString *)uid:(NSInteger)row;

@property (nonatomic) NSMutableArray<LiveRoomDataModel *> *dataList;
@property (nonatomic) NSInteger index;

@property (nonatomic) NSString *categoryName;
@property (nonatomic) NSInteger pageCount;

@end
