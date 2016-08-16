//
//  RoomViewController.h
//  Project-GameLive
//
//  Created by tarena on 16/8/15.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RoomViewController : UIViewController

- (instancetype)initWithUid:(NSString *)uid;

@property (nonatomic) NSString *uid;

@end
