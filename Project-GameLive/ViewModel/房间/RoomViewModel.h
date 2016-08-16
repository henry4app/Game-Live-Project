//
//  RoomViewModel.h
//  Project-GameLive
//
//  Created by tarena on 16/8/15.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "RoomModel.h"
#import "NetManager.h"

@interface RoomViewModel : BaseViewModel

- (NSString *)defaultVideoPath;
- (NSURL *)videoThumb;
- (NSURL *)hostIcon;
- (NSString *)hostName;
- (NSString *)roomTitle;
- (NSString *)view;

@property (nonatomic) NSMutableArray<RoomModel *> *dataList;
@property (nonatomic) NSArray<RoomRoomLinesModel *> *linesList;
@property (nonatomic) NSArray<RoomRankWeekModel *> *rankList;

@property (nonatomic) NSString *uid;
- (instancetype)initWithUid:(NSString *)uid;

@end
