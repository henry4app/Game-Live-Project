//
//  SearchResultController.m
//  Project-GameLive
//
//  Created by tarena on 16/8/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "SearchResultController.h"
#import "LiveCell.h"
#import "SearchViewModel.h"
@import AVKit;
@import AVFoundation;
@interface SearchResultController ()<UISearchBarDelegate, UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate>
@property (nonatomic) UISearchBar *searchBar;
@property (nonatomic) UIImageView *backgroundImg;
@property (nonatomic) SearchViewModel *viewModel;
@property (nonatomic) UITapGestureRecognizer *tapGR;

@end

@implementation SearchResultController

#pragma mark <SearchBarDelegate>
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"Search Btn clicked");
    self.viewModel.searchText = searchBar.text;
    NSLog(@"searchbar text: %@", searchBar.text);
    
    [self.viewModel getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
        [self.collectionView reloadData];
    }];
    
    __weak typeof(self)weakSelf = self;
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

    [self.collectionView removeGestureRecognizer:self.tapGR];
    [self.backgroundImg removeFromSuperview];
    [searchBar resignFirstResponder];
}



#pragma mark lazy load

- (SearchViewModel *)viewModel {
    if(_viewModel == nil) {
        _viewModel = [SearchViewModel new];
    }
    return _viewModel;
}


- (UISearchBar *)searchBar {
    if(_searchBar == nil) {
        // 520 * 60
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 260, 30)];
        _searchBar.delegate = self;
        _searchBar.placeholder = @"请输入搜索内容";
        
    }
    return _searchBar;
}

- (UIImageView *)backgroundImg {
    if(_backgroundImg == nil) {
        _backgroundImg = [[UIImageView alloc] init];
        [self.collectionView addSubview:_backgroundImg];
        _backgroundImg.contentMode = UIViewContentModeScaleAspectFill;
        _backgroundImg.clipsToBounds = YES;
        [_backgroundImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(0);
            make.size.equalTo(CGSizeMake(200, 200));
        }];
        [_backgroundImg setImage:[UIImage imageNamed:@"搜索无结果"]];
    }
    return _backgroundImg;
}

- (instancetype)init {
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.minimumLineSpacing = 20;
    layout.minimumInteritemSpacing = 6;
    layout.sectionInset = UIEdgeInsetsMake(6, 6, 20, 6);
    CGFloat width = (kScreenW - 3 * 6) / 2;
    CGFloat height = width * 197 / 347 + 26;
    layout.itemSize = CGSizeMake((long)width, height);

    if (self = [super initWithCollectionViewLayout:layout]) {
       
    }
    return self;
}


#pragma mark view life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self backgroundImg];
    self.collectionView.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1];
    self.navigationItem.titleView = self.searchBar;
    
    // 点击空白地方退出键盘
    self.tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self.collectionView addGestureRecognizer:self.tapGR];
    
    // Left Btn
    [TRFactory addBackItemForVC:self];
    
    // Search Btn
    [TRFactory addSearchItemForVC:self clickedHanlder:^{
        NSLog(@"Search Btn clicked");
        //移除背景图
        [self.backgroundImg removeFromSuperview];
        //移除触摸手势，否则无法点击CollectionItem
        [self.collectionView removeGestureRecognizer:self.tapGR];
        self.viewModel.searchText = self.searchBar.text;
        
        
        [self.viewModel getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
            [self.collectionView reloadData];
        }];
        
        __weak typeof(self)weakSelf = self;
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
        
        [self.searchBar resignFirstResponder];
    }];
    
    // Register cell classes
    [self.collectionView registerClass:[LiveCell class] forCellWithReuseIdentifier:@"SearchResultCell"];
    
    // SearchBar获得焦点
    [self.searchBar becomeFirstResponder];

}


- (void)tap:(UITapGestureRecognizer *)gr {
    [self.searchBar resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    NSLog(@"rowCount: %ld", self.viewModel.rowNumber);
    return self.viewModel.rowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LiveCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SearchResultCell" forIndexPath:indexPath];
    
    // Configure the cell
    [cell.iconIV setImageWithURL:[self.viewModel icon:indexPath.row] placeholder:[UIImage imageNamed:@"直播"]];
    cell.titleLabel.text = [self.viewModel title:indexPath.row];
    cell.nickLabel.text = [self.viewModel host:indexPath.row];
    cell.viewLabel.text = [self.viewModel viewNumber:indexPath.row];

    
    return cell;
}

#pragma mark <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    AVPlayerViewController *vc = [[AVPlayerViewController alloc] init];
    vc.player = [AVPlayer playerWithURL:[self.viewModel livePath:indexPath.row]];
    NSLog(@"%@", [self.viewModel livePath:indexPath.row]);
    [vc.player play];
    [self presentViewController:vc animated:YES completion:nil];
}




@end
