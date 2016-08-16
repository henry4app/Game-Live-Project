//
//  RoomModel.h
//  Project-GameLive
//
//  Created by tarena on 16/8/15.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RoomLiveModel,RoomLiveWsModel,RoomLiveWsHlsModel,RoomLiveWsHls3Model,RoomLiveWsHls4Model,RoomLiveWsHls5Model,RoomRoomLinesModel,RoomRankWeekModel;
@interface RoomModel : NSObject


@property (nonatomic, copy) NSString *slug;

@property (nonatomic, assign) NSInteger weight;

@property (nonatomic, copy) NSString *last_play_at;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) BOOL play_status;

@property (nonatomic, copy) NSString *category_name;

@property (nonatomic, strong) RoomLiveModel *live;

@property (nonatomic, assign) BOOL hidden;

@property (nonatomic, assign) BOOL forbid_status;

@property (nonatomic, strong) NSArray<RoomRankWeekModel *> *rank_curr;

@property (nonatomic, strong) NSArray *admins;

@property (nonatomic, strong) NSArray *hot_word;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, strong) NSArray<RoomRoomLinesModel *> *room_lines;

@property (nonatomic, strong) NSArray<RoomRankWeekModel *> *rank_week;

@property (nonatomic, assign) BOOL is_star;

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, copy) NSString *announcement;

@property (nonatomic, copy) NSString *nick;

@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, strong) NSArray *notice;

@property (nonatomic, strong) NSArray<RoomRankWeekModel *> *rank_total;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, assign) NSInteger view;

@property (nonatomic, copy) NSString *video_quality;

@property (nonatomic, assign) BOOL warn;

@property (nonatomic, assign) NSInteger category_id;

@property (nonatomic, assign) NSInteger follow;


@end
@interface RoomLiveModel : NSObject

@property (nonatomic, strong) RoomLiveWsModel *ws;

@end

@interface RoomLiveWsModel : NSObject

@property (nonatomic, copy) NSString *def_mobile;

@property (nonatomic, strong) RoomLiveWsHlsModel *hls;

@property (nonatomic, copy) NSString *def_pc;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger v;

@property (nonatomic, strong) RoomLiveWsHlsModel *flv;

@end

@interface RoomLiveWsHlsModel : NSObject

@property (nonatomic, strong) RoomLiveWsHls3Model *L0;

@property (nonatomic, strong) RoomLiveWsHls5Model *L1;

@property (nonatomic, strong) RoomLiveWsHls4Model *L2;
// 3 -> L3 (标清)
@property (nonatomic, strong) RoomLiveWsHls3Model *L3;
// 5 -> L5 (超清)
@property (nonatomic, strong) RoomLiveWsHls5Model *L5;
// 4 -> L4 (高清)
@property (nonatomic, strong) RoomLiveWsHls4Model *L4;

@property (nonatomic, assign) NSInteger main_pc;

@property (nonatomic, assign) NSInteger main_mobile;

@end

@interface RoomLiveWsHls3Model : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *src;

@end

@interface RoomLiveWsHls4Model : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *src;

@end

@interface RoomLiveWsHls5Model : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *src;

@end


@interface RoomRoomLinesModel : NSObject

@property (nonatomic, copy) NSString *def_mobile;

@property (nonatomic, strong) RoomLiveWsHlsModel *hls;

@property (nonatomic, copy) NSString *def_pc;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger v;

@property (nonatomic, strong) RoomLiveWsHlsModel *flv;

@end



@interface RoomRankWeekModel : NSObject

@property (nonatomic, copy) NSString *change;

@property (nonatomic, assign) NSInteger score;

@property (nonatomic, copy) NSString *send_nick;

@property (nonatomic, assign) NSInteger send_uid;

@property (nonatomic, copy) NSString *rank;

@property (nonatomic, copy) NSString *icon_url;

@property (nonatomic, copy) NSString *icon;

@end

