//
//  RecModel.h
//  Project-GameLive
//
//  Created by tarena on 16/8/1.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MobileBeauty,LinkObject,List;
@interface RecModel : NSObject

@property (nonatomic, strong) NSArray<List *> *list;

//mobile-index
@property (nonatomic, strong) NSArray<MobileBeauty *> *mobileIndex;

//mobile-star
@property (nonatomic, strong) NSArray<MobileBeauty *> *mobileStar;

//moblie-webgame
@property (nonatomic, strong) NSArray<MobileBeauty *> *mobileWebgame;
//moblie-minecraft
@property (nonatomic, strong) NSArray<MobileBeauty *> *mobileMinecraft;
//mobile-tvgame
@property (nonatomic, strong) NSArray<MobileBeauty *> *mobileTvgame;
//moblie-sport
@property (nonatomic, strong) NSArray<MobileBeauty *> *mobileSport;
//mobile-recommendation
@property (nonatomic, strong) NSArray<MobileBeauty *> *mobileRecommendation;
//mobile-lol
@property (nonatomic, strong) NSArray<MobileBeauty *> *mobileLol;
// mobile-beauty -> mobileBeauty
@property (nonatomic, strong) NSArray<MobileBeauty *> *mobileBeauty;
//mobile-heartstone
@property (nonatomic, strong) NSArray<MobileBeauty *> *mobileHeartstone;
//moblie-blizzard
@property (nonatomic, strong) NSArray<MobileBeauty *> *mobileBlizzard;
//mobile-dota2
@property (nonatomic, strong) NSArray<MobileBeauty *> *mobileDota2;
//moblie-dnf
@property (nonatomic, strong) NSArray<MobileBeauty *> *mobileDnf;


@end



@interface MobileBeauty : NSObject

@property (nonatomic, strong) LinkObject *link_object;

@end

@interface LinkObject : NSObject

@property (nonatomic, copy) NSString *default_image;

@property (nonatomic, copy) NSString *slug;

@property (nonatomic, copy) NSString *weight;

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *category_name;

@property (nonatomic, assign) BOOL hidden;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, copy) NSString *category_slug;

@property (nonatomic, copy) NSString *recommend_image;

@property (nonatomic, copy) NSString *play_at;

@property (nonatomic, copy) NSString *app_shuffling_image;

@property (nonatomic, copy) NSString *level;

@property (nonatomic, copy) NSString *grade;

@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, copy) NSString *announcement;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *nick;

@property (nonatomic, copy) NSString *create_at;

@property (nonatomic, copy) NSString *start_time;

@property (nonatomic, copy) NSString *view;

@property (nonatomic, copy) NSString *video_quality;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *category_id;

@property (nonatomic, copy) NSString *follow;

@end



@interface List : NSObject

@property (nonatomic, copy) NSString *slug;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *category_slug;

@end


