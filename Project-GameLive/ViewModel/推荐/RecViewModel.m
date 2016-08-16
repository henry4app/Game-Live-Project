//
//  RecViewModel.m
//  Project-GameLive
//
//  Created by tarena on 16/8/2.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "RecViewModel.h"

@implementation RecViewModel


- (NSMutableArray<List *> *)recList {
    if (!_recList) {
        _recList = [NSMutableArray new];
    }
    return _recList;
}

- (NSInteger)sectionNumber {
    return _recList.count;
}

-(NSInteger)rowNumber:(NSInteger)section {
    NSArray<MobileBeauty*> *arr = _sectionArray[section];
    return arr.count;
}

- (NSString *)sectionHeaderName:(NSInteger)section {

    return _recList[section].name;
}

- (NSString *)slug:(NSInteger)section {
    return _recList[section].category_slug;
}



- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler {
    
    self.dataTask = [NetManager getIndexModelCompletionHandler:^(RecModel *model, NSError *error) {
        if (!error) {
            if (requestMode == RequestModeRefresh) {
                [_recList removeAllObjects];
            }
            _recList = model.list.mutableCopy;
            _mobileIndex = model.mobileIndex;
            _mobileStar = model.mobileStar;
            _mobileWebgame = model.mobileWebgame;
            _mobileMinecraft = model.mobileMinecraft;
            _mobileTvgame = model.mobileTvgame;
            _mobileSport = model.mobileSport;
            _mobileRecommendation = model.mobileRecommendation;
            _mobileLol = model.mobileLol;
            _mobileBeauty = model.mobileBeauty;
            _mobileHeartstone = model.mobileHeartstone;
            _mobileBlizzard = model.mobileBlizzard;
            _mobileDota2 = model.mobileDota2;
            _mobileDnf = model.mobileDnf;
            NSArray *arr = [NSArray arrayWithObjects:_mobileIndex, _mobileStar, _mobileRecommendation, _mobileLol, _mobileBeauty, _mobileTvgame, _mobileHeartstone, _mobileDota2, _mobileBlizzard, _mobileDnf, _mobileSport, _mobileMinecraft, _mobileWebgame, nil];
            self.sectionArray = arr;
            //NSLog(@"count:%ld", _mobileLol.count);
            !completionHandler?:completionHandler(error);
        }
        
    }];
}



- (NSString *)title:(NSInteger)section row:(NSInteger)row {
    NSArray<MobileBeauty*> *arr = self.sectionArray[section];
   
    return arr[row].link_object.title;
}

- (NSString *)nick:(NSInteger)section row:(NSInteger)row {
    NSArray<MobileBeauty*> *arr = self.sectionArray[section];
    
    return arr[row].link_object.nick;
}

- (NSURL *)icon:(NSInteger)section row:(NSInteger)row {
    NSArray<MobileBeauty*> *arr = self.sectionArray[section];
    
    return arr[row].link_object.thumb.yx_URL;
}

- (NSString *)view:(NSInteger)section row:(NSInteger)row {
    NSArray<MobileBeauty*> *arr = self.sectionArray[section];
    //NSLog(@"");
    NSInteger number = arr[row].link_object.view.integerValue;
    if (number > 10000) {
        return [NSString stringWithFormat:@"%.1f万", number / 10000.0];
    } else {
        return [NSString stringWithFormat:@"%ld", number];
    }

}

- (NSURL *)liveVideoURL:(NSInteger)section row:(NSInteger)row {
     NSArray<MobileBeauty*> *arr = self.sectionArray[section];
    NSString *path = [NSString stringWithFormat:kLivePath, arr[row].link_object.uid];
    return path.yx_URL;

}

- (NSInteger)ADImageCount {
    return _mobileIndex.count;
}

- (NSMutableArray<NSURL *> *)ADImageArray {
    if (!_ADImageArray) {
        _ADImageArray = [NSMutableArray new];
        
        for (int i = 0; i < _mobileIndex.count; i++) {
            [_ADImageArray addObject:_mobileIndex[i].link_object.thumb.yx_URL];
        }
    }
    return _ADImageArray;
}

- (NSMutableArray<NSString *> *)ADTitleList {
    if (!_ADTitleList) {
        _ADTitleList = [NSMutableArray new];
        for (int i = 0; i < _mobileIndex.count; i++) {
            [_ADTitleList addObject:_mobileIndex[i].link_object.title];
        }
    }
    return _ADTitleList;
}

- (NSURL *)videoURL:(NSInteger)row {
    NSString *path = [NSString stringWithFormat:kLivePath, _mobileIndex[row].link_object.uid];
    return path.yx_URL;
}

- (NSInteger)StarCellItemNumber {
    return _mobileStar.count;
}

- (NSURL *)iconForItem:(NSInteger)index {
    return _mobileStar[index].link_object.avatar.yx_URL;
}

- (NSString *)titleForItem:(NSInteger)index {
    return _mobileStar[index].link_object.nick;
}

- (NSURL *)starVideoURL:(NSInteger)index {
    NSString *path = [NSString stringWithFormat:kLivePath, _mobileStar[index].link_object.uid];
    return path.yx_URL;
}

// 推荐部分
- (void)changeRecommendRandomList {
    _recommendRandomList = nil;
}

- (NSArray<MobileBeauty *> *)recommendRandomList {
    if (!_recommendRandomList) {
        if (_mobileRecommendation.count < 3) {
            _recommendRandomList = _mobileRecommendation;
        } else {
            NSInteger index0 = arc4random() % _mobileRecommendation.count;
            NSInteger index1 = 0;
            do {
                index1 = arc4random() % _mobileRecommendation.count;
            } while (index0 == index1);
            
            _recommendRandomList = @[_mobileRecommendation[index0], _mobileRecommendation[index1]];
        }
    }
    return _recommendRandomList;
}


- (NSInteger)recommendNum {
    return self.recommendRandomList.count;
}
- (NSString *)recommentdTitle:(NSInteger)row {
    return self.recommendRandomList[row].link_object.title;
}
- (NSString *)recommentdNick:(NSInteger)row {
    return self.recommendRandomList[row].link_object.nick;
}
- (NSURL *)recommentdIcon:(NSInteger)row {
    return self.recommendRandomList[row].link_object.thumb.yx_URL;
}
- (NSString *)recommentdView:(NSInteger)row {
    NSInteger number = self.recommendRandomList[row].link_object.view.integerValue;
    if (number > 10000) {
        return [NSString stringWithFormat:@"%.1f万", number / 10000.0];
    } else {
        return [NSString stringWithFormat:@"%ld", number];
    }
}
- (NSURL *)recommentdVideoURL:(NSInteger)row {
    NSString *path = [NSString stringWithFormat:kLivePath, self.recommendRandomList[row].link_object.uid];
    return path.yx_URL;
}




















@end
