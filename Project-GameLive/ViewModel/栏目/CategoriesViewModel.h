//
//  CategoriesViewModel.h
//  Project-GameLive
//
//  Created by 顾晨洁 on 16/7/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "NetManager.h"
#import "CategoriesModel.h"
@interface CategoriesViewModel : BaseViewModel

@property (nonatomic) NSInteger rowNumber;
- (NSURL *)icon:(NSInteger)row;
- (NSString *)title:(NSInteger)row;

@property (nonatomic) NSArray<CategoriesModel *> *dataList;

- (NSString *)slug:(NSInteger)row;
- (NSString *)cName:(NSInteger)row;

@end
