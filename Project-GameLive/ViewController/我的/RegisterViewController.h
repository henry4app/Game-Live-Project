//
//  RegisterViewController.h
//  Project-GameLive
//
//  Created by tarena on 16/8/9.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ReturnUserBlock)(NSString *username);

@interface RegisterViewController : UIViewController

@property (nonatomic, copy) ReturnUserBlock returnUserBlock;
@property (nonatomic, copy) void(^Block)(NSString *username);

- (void)returnUserName:(ReturnUserBlock)block;

@end
