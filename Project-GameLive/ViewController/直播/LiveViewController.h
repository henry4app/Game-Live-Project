//
//  LiveViewController.h
//  Project-GameLive
//
//  Created by tarena on 16/7/29.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LiveViewController : UICollectionViewController

- (instancetype)initWithCategoryName:(NSString *)categoryName;
@property (nonatomic, readonly) NSString *categoryName;
@property (nonatomic) NSString *cName;

@end
