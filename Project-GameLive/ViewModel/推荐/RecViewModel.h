//
//  RecViewModel.h
//  Project-GameLive
//
//  Created by tarena on 16/8/2.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "RecModel.h"
#import "NetManager.h"

@interface RecViewModel : BaseViewModel
// Section Generals
@property (nonatomic) NSMutableArray<List *> *recList;

@property (nonatomic, readonly) NSInteger sectionNumber;
- (NSInteger)rowNumber:(NSInteger)section;
- (NSString *)sectionHeaderName:(NSInteger)section;
- (NSString *)slug:(NSInteger)section;
@property (nonatomic) NSArray *sectionArray;

@property (nonatomic) NSArray<MobileBeauty*> *mobileIndex;
@property (nonatomic) NSArray<MobileBeauty*> *mobileStar;
@property (nonatomic) NSArray<MobileBeauty*> *mobileWebgame;
@property (nonatomic) NSArray<MobileBeauty*> *mobileMinecraft;
@property (nonatomic) NSArray<MobileBeauty*> *mobileTvgame;
@property (nonatomic) NSArray<MobileBeauty*> *mobileSport;
@property (nonatomic) NSArray<MobileBeauty*> *mobileRecommendation;
@property (nonatomic) NSArray<MobileBeauty*> *mobileLol;
@property (nonatomic) NSArray<MobileBeauty*> *mobileBeauty;
@property (nonatomic) NSArray<MobileBeauty*> *mobileHeartstone;
@property (nonatomic) NSArray<MobileBeauty*> *mobileBlizzard;
@property (nonatomic) NSArray<MobileBeauty*> *mobileDota2;
@property (nonatomic) NSArray<MobileBeauty*> *mobileDnf;

// Rec Cell
@property (nonatomic) NSInteger recommendNum;
- (NSString *)recommentdTitle:(NSInteger)row;
- (NSString *)recommentdNick:(NSInteger)row;
- (NSURL *)recommentdIcon:(NSInteger)row;
- (NSString *)recommentdView:(NSInteger)row;
- (NSURL *)recommentdVideoURL:(NSInteger)row;

// 换一换
@property (nonatomic) NSArray<MobileBeauty *> *recommendRandomList;
- (void)changeRecommendRandomList;

// Other Cell
- (NSString *)title:(NSInteger)section row:(NSInteger)row;
- (NSString *)nick:(NSInteger)section row:(NSInteger)row;
- (NSURL *)icon:(NSInteger)section row:(NSInteger)row;
- (NSString *)view:(NSInteger)section row:(NSInteger)row;
- (NSURL *)liveVideoURL:(NSInteger)section row:(NSInteger)row;

// AD Detail
@property (nonatomic, readonly) NSInteger ADImageCount;
@property (nonatomic) NSMutableArray<NSURL *> *ADImageArray;
@property (nonatomic) NSMutableArray<NSString *> *ADTitleList;
- (NSURL *)videoURL:(NSInteger)row;


// Star Cell
@property (nonatomic, readonly) NSInteger StarCellItemNumber;
- (NSURL *)iconForItem:(NSInteger)index;
- (NSString *)titleForItem:(NSInteger)index;
- (NSURL *)starVideoURL:(NSInteger)index;


@end
