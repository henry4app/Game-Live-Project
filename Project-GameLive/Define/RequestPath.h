//
//  RequestPath.h
//  TRProject
//
//  Created by yingxin on 16/7/19.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#ifndef RequestPath_h
#define RequestPath_h

//存放请求路径
// 直播房间列表
#define kLiveRoom @"http://www.quanmin.tv/json/play/list%@.json"

// 栏目列表
#define kCategories @"http://www.quanmin.tv/json/categories/list.json"

// 游戏列表
#define kGameList @"http://www.quanmin.tv/json/categories/%@/list%@.json"

// 直播地址
#define kLivePath @"http://hls.quanmin.tv/live/%@/playlist.m3u8"

//首页
#define kIndexPage @"http://www.quanmin.tv/json/page/app-index/info.json"

// 房间页面
#define KRoom @"http://www.quanmin.tv/json/rooms/%@/info.json"

#endif /* RequestPath_h */
