//
//  LiveViewController.m
//  Project-GameLive
//
//  Created by tarena on 16/7/29.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LiveViewController.h"
#import "NetManager.h"
#import "LiveCell.h"
#import "LiveViewModel.h"
#import "SearchResultController.h"
#import "RoomViewController.h"

@import AVKit;
@import AVFoundation;
@interface LiveViewController ()
@property (nonatomic) LiveViewModel *viewModel;

@end

@implementation LiveViewController



- (instancetype)initWithCategoryName:(NSString *)categoryName {
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 6;
    layout.sectionInset = UIEdgeInsetsMake(6, 6, 6, 6);
    CGFloat width = (kScreenW - 3 * 6) / 2;
    CGFloat height = width * 197 / 347 + 26;
    layout.itemSize = CGSizeMake((long)width, height);
    
    if (self = [super initWithCollectionViewLayout:layout]) {
        _categoryName = categoryName;
    }
    return self;
}

- (LiveViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [LiveViewModel new];
    }
    return _viewModel;
}


static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //搜索按钮工厂方法
    [TRFactory addSearchItemForVC:self clickedHanlder:^{
        NSLog(@"Search Btn clicked");
        SearchResultController *vc = [SearchResultController new];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        self.hidesBottomBarWhenPushed = NO;
        
    }];
    
    if (self.cName) {
        self.navigationItem.title = self.cName;
        self.viewModel.categoryName = self.categoryName;
        [TRFactory addBackItemForVC:self];
    } else {
        self.navigationItem.title = @"直播";
        self.viewModel.categoryName = nil;
    }
    
    // Register cell classes
    [self.collectionView registerClass:[LiveCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.collectionView.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1];
    
    __weak typeof(self)weakSelf = self;
//    [self.collectionView addHeaderRefresh:^{
//        [weakSelf.viewModel getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
//
//            [weakSelf.collectionView reloadData];
//            [weakSelf.collectionView endHeaderRefresh];
//        }];
//    }];
    
    [self.collectionView addGifHeaderRefresh:^{
        [weakSelf.viewModel getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
            
            [weakSelf.collectionView reloadData];
            [weakSelf.collectionView endHeaderRefresh];
        }];
    }];
    
    
    [self.collectionView beginHeaderRefresh];
    

    [self.collectionView addFooterRefresh:^{
        [weakSelf.viewModel getDataWithMode:RequestModeMore completionHandler:^(NSError *error) {

            if (self.viewModel.index  == self.viewModel.pageCount) {
                [weakSelf.collectionView noticeNoMoreData];
                return;
            }
            [weakSelf.collectionView reloadData];
            [weakSelf.collectionView endFooterRefresh];
            
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.viewModel.rowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LiveCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    [cell.iconIV setImageWithURL:[self.viewModel icon:indexPath.row] placeholder:[UIImage imageNamed:@"直播"]];
    cell.titleLabel.text = [self.viewModel title:indexPath.row];
    cell.nickLabel.text = [self.viewModel host:indexPath.row];
    cell.viewLabel.text = [self.viewModel viewNumber:indexPath.row];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    AVPlayerViewController *vc = [[AVPlayerViewController alloc] init];
//    vc.player = [AVPlayer playerWithURL:[self.viewModel livePath:indexPath.row]];
//    NSLog(@"%@", [self.viewModel livePath:indexPath.row]);
//    [vc.player play];
    
    RoomViewController *vc = [[RoomViewController alloc] initWithUid:[self.viewModel uid:indexPath.row]];
   
    [self presentViewController:vc animated:YES completion:nil];
}

@end























