//
//  CategoriesViewController.m
//  Project-GameLive
//
//  Created by 顾晨洁 on 16/7/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "CategoriesViewController.h"
#import "CategoriesCell.h"
#import "CategoriesViewModel.h"
#import "NetManager.h"
#import "LiveViewController.h"
#import "SearchResultController.h"

@interface CategoriesViewController ()
@property (nonatomic) CategoriesViewModel *viewModel;
@end

@implementation CategoriesViewController

- (CategoriesViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [CategoriesViewModel new];
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
    
    self.collectionView.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1];

    // Register cell classes
    [self.collectionView registerClass:[CategoriesCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
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



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.viewModel.rowNumber;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CategoriesCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    [cell.iconIV setImageWithURL:[self.viewModel icon:indexPath.row] placeholder:nil];
    cell.titleLabel.text = [self.viewModel title:indexPath.row];

    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    LiveViewController *vc = [[LiveViewController alloc] initWithCategoryName:[self.viewModel slug:indexPath.row]];
    vc.cName = [self.viewModel cName:indexPath.row];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

@end
