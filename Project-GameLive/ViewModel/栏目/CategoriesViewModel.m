//
//  CategoriesViewModel.m
//  Project-GameLive
//
//  Created by 顾晨洁 on 16/7/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "CategoriesViewModel.h"

@interface CategoriesViewModel ()
@property (nonatomic) NSString *cachePath;
@end

@implementation CategoriesViewModel

kCodingDesc

- (NSString *)cachePath {
    if (!_cachePath) {
        NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
        _cachePath = [docPath stringByAppendingPathComponent:@"CategoriesViewModel"];
    }
    return _cachePath;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        id obj = [NSKeyedUnarchiver unarchiveObjectWithFile:self.cachePath];
        if (obj) {
            self = obj;
        }
    }
    return self;
}



- (NSInteger)rowNumber {
    return self.dataList.count;
}

- (NSURL *)icon:(NSInteger)row {
    return self.dataList[row].image.yx_URL;
}

- (NSString *)title:(NSInteger)row {
    return self.dataList[row].name;
}

- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler {
    self.dataTask = [NetManager getCategoriesModelWithCompletionHandler:^(NSArray<CategoriesModel *> *model, NSError *error) {
        if (!error) {

            self.dataList = model;
            [NSKeyedArchiver archiveRootObject:self toFile:_cachePath];

        }
        !completionHandler?:completionHandler(error);
    }];
}

- (NSString *)slug:(NSInteger)row {
    return self.dataList[row].slug;
}

- (NSString *)cName:(NSInteger)row {
    return self.dataList[row].name;
}

@end
