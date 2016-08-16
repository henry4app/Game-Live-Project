//
//  IntroViewController.m
//  Project-GameLive
//
//  Created by tarena on 16/7/29.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "IntroViewController.h"
#import "SectionHeaderView.h"
#import "RecViewModel.h"
#import "LiveCell.h"
#import "AdCell.h"
#import "StarCell.h"
#import "LiveViewController.h"
#import "SearchResultController.h"
#import "RoomViewController.h"

@import AVFoundation;
@import AVKit;
@interface IntroViewController ()<UICollectionViewDelegateFlowLayout, AdCellDataSource, AdCellDelegate, StarCellDataSource, StarCellDelegate>
@property (nonatomic) RecViewModel *viewModel;


@end

@implementation IntroViewController

#pragma mark StarCell Delegate
- (NSInteger)numberOfItemsInStarCell:(StarCell *)cell {
    return self.viewModel.StarCellItemNumber;
}

- (NSURL *)starCell:(StarCell *)cell iconURLAtIndex:(NSInteger)index {
    return [self.viewModel iconForItem:index];
}

- (NSString *)starCell:(StarCell *)cell titleAtIndex:(NSInteger)index {
    return [self.viewModel titleForItem:index];
}

- (void)starCell:(StarCell *)cell didSelectedIndex:(NSInteger)index {
    AVPlayerViewController *vc = [AVPlayerViewController new];
    vc.player = [AVPlayer playerWithURL:[self.viewModel starVideoURL:index]];
    [self presentViewController:vc animated:YES completion:nil];
    [vc.player play];
}

#pragma mark AdCell Delegate
- (NSInteger)numberOfItemsInCell:(AdCell *)cell {
    return self.viewModel.ADImageCount;
}

- (NSURL *)iconURLForItemInCell:(AdCell *)cell atIndex:(NSInteger)index {
    return self.viewModel.ADImageArray[index];
}

- (void)adCell:(AdCell *)cell didSelecteIconAtIndex:(NSInteger)index {
    AVPlayerViewController *vc = [AVPlayerViewController new];
    vc.player = [AVPlayer playerWithURL:[self.viewModel videoURL:index]];
    [self presentViewController:vc animated:YES completion:nil];
    [vc.player play];
}

- (NSString *)titleForItemInCell:(AdCell *)cell atIndex:(NSInteger)index {
    return self.viewModel.ADTitleList[index];
}

#pragma mark lazy load

- (RecViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [RecViewModel new];
    }
    return _viewModel;
}


#pragma mark view lify cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *logoView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 90, 40)];
    logoView.image = [UIImage imageNamed:@"logo"];
    logoView.contentMode = UIViewContentModeScaleAspectFill;
    logoView.clipsToBounds = YES;
    UIBarButtonItem *logo = [[UIBarButtonItem alloc] initWithCustomView:logoView];
    self.navigationItem.leftBarButtonItem = logo;
    
    
    //搜索按钮工厂方法
    [TRFactory addSearchItemForVC:self clickedHanlder:^{
        NSLog(@"Search Btn clicked");
        SearchResultController *vc = [SearchResultController new];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        self.hidesBottomBarWhenPushed = NO;

    }];
    
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1];
    
    // Register cell classes
    [self.collectionView registerClass:[LiveCell class] forCellWithReuseIdentifier:@"Section Cell"];
    [self.collectionView registerClass:[AdCell class] forCellWithReuseIdentifier:@"AD Cell"];
    [self.collectionView registerClass:[StarCell class] forCellWithReuseIdentifier:@"Star Cell"];
    
    //注册section header
    [self.collectionView registerClass:[SectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header"];
   
    __weak typeof(self)weakSelf = self;
    [self.collectionView addHeaderRefresh:^{
        [weakSelf.viewModel getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
         
            [weakSelf.collectionView reloadData];
            
            [weakSelf.collectionView endHeaderRefresh];
        }];
        
    }];
    [self.collectionView beginHeaderRefresh];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    AVPlayerViewController *vc = [AVPlayerViewController new];
    vc.player = [AVPlayer playerWithURL:[self.viewModel liveVideoURL:indexPath.section row:indexPath.row]];
    [self presentViewController:vc animated:YES completion:nil];
    [vc.player play];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return self.viewModel.sectionNumber;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    if (section == 0 || section == 1) {
        return 1;
    } else if (section == 2) {
        return self.viewModel.recommendNum;
    } else {
        return [self.viewModel rowNumber:section];
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        AdCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AD Cell" forIndexPath:indexPath];
        //cell.contentView.backgroundColor = [UIColor orangeColor];
        cell.delegate = self;
        cell.dataSource = self;
        [cell reloadData];
        return cell;
    } else if (indexPath.section == 1) {
        StarCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Star Cell" forIndexPath:indexPath];
        //cell.contentView.backgroundColor = [UIColor yellowColor];
        cell.delegate = self;
        cell.dataSource = self;
        [cell reloadData];
        return cell;
    } else if (indexPath.section == 2) {
        LiveCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Section Cell" forIndexPath:indexPath];
        cell.titleLabel.text = [self.viewModel recommentdTitle:indexPath.row];
        [cell.iconIV setImageWithURL:[self.viewModel recommentdIcon:indexPath.row] placeholder:[UIImage imageNamed:@"主播正在赶来"]];
        cell.nickLabel.text = [self.viewModel recommentdNick:indexPath.row];
        cell.viewLabel.text = [self.viewModel recommentdView:indexPath.row];

        return cell;
    }
    
    
        LiveCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Section Cell" forIndexPath:indexPath];
        cell.titleLabel.text = [self.viewModel title:indexPath.section row:indexPath.row];
        [cell.iconIV setImageWithURL:[self.viewModel icon:indexPath.section row:indexPath.row] placeholder:[UIImage imageNamed:@"主播正在赶来"]];
        cell.nickLabel.text = [self.viewModel nick:indexPath.section row:indexPath.row];
        cell.viewLabel.text = [self.viewModel view:indexPath.section row:indexPath.row];
        
        //cell.contentView.backgroundColor = [UIColor blueColor];
        
        
        return cell;
    
    
    
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        SectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"Header" forIndexPath:indexPath];
    
        if (indexPath.section == 2) {
            headerView.sectionTitleLb.text = @"推荐";
            headerView.cellType = IntroCellTypeChange;
            headerView.btnClicked = ^(NSInteger section) {
                NSLog(@"换一换");
                [self.viewModel changeRecommendRandomList];
                [collectionView reloadSections:[NSIndexSet indexSetWithIndex:2]];
            };
        }
        if (indexPath.section > 2) {
            headerView.cellType = IntroCellTypeMore;
            headerView.sectionTitleLb.text = [self.viewModel sectionHeaderName:indexPath.section];
            headerView.section = indexPath.section;
            headerView.btnClicked = ^(NSInteger section) {
                NSLog(@"更多");
                LiveViewController *vc = [[LiveViewController alloc] initWithCategoryName:[self.viewModel slug:section]];
                vc.cName = [self.viewModel sectionHeaderName:section];
                self.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
                self.hidesBottomBarWhenPushed = NO;

            };
            
        }
        return headerView;
        
    }
    return nil;
}



- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return CGSizeMake(kScreenW, (long)kScreenW * 417 / 750); //750 * 417
    } else if (indexPath.section == 1) {
        return CGSizeMake(kScreenW, (long)kScreenW * 220 / 750); // 750 * 220
    } else {
        CGFloat width = (kScreenW - 3 * 6) / 2;
        CGFloat height = width * 204 / 352 + 26;
        return CGSizeMake(width, height);
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    if (section > 1) {
        return UIEdgeInsetsMake(6, 6, 6, 6);
    }
    return UIEdgeInsetsZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
   
    if (section > 1) {
        return CGSizeMake(kScreenW, 40);
    }
    return CGSizeZero;
}



@end
