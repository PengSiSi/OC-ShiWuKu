//
//  WSelectPhotoPickerGroupViewController.m
//  WNSelectPhoto
//
//  Created by 王楠 on 15/5/21.
//  Copyright (c) 2015年 王楠. All rights reserved.
//


#define CELL_ROW 4
#define CELL_MARGIN 5
#define CELL_LINE_MARGIN 5

#import "WSelectPhotoPickerGroupViewController.h"
#import "WSelectPhotoPickerCollectionView.h"
#import "WSelectPhotoPickerDatas.h"
#import "WSelectPhotoPickerGroupViewController.h"
#import "WSelectPhotoPickerGroup.h"
#import "WSelectPhotoPickerGroupTableViewCell.h"
#import "WSelectPhotoPickerAssetsViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface WSelectPhotoPickerGroupViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic , weak) WSelectPhotoPickerAssetsViewController *collectionVc;

@property (nonatomic , weak) UITableView *tableView;
@property (nonatomic , strong) NSArray *groups;

@end
@implementation WSelectPhotoPickerGroupViewController
- (UITableView *)tableView{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.tableFooterView = [[UIView alloc] init];
        tableView.translatesAutoresizingMaskIntoConstraints = NO;
        [tableView registerClass:[WSelectPhotoPickerGroupTableViewCell class] forCellReuseIdentifier:@"cell"];
        tableView.delegate = self;
        [self.view addSubview:tableView];
        self.tableView = tableView;
        
        NSDictionary *views = NSDictionaryOfVariableBindings(tableView);
        
        NSString *heightVfl = @"V:|-0-[tableView]-0-|";
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:heightVfl options:0 metrics:nil views:views]];
        NSString *widthVfl = @"H:|-0-[tableView]-0-|";
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:widthVfl options:0 metrics:nil views:views]];
        
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self tableView];
    
    // 设置按钮
    [self setupButtons];
    
    // 获取图片
    [self getImgs];
    
    self.title = @"照片";
    
}

- (void) setupButtons{
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    
    self.navigationItem.rightBarButtonItem = barItem;
}

#pragma mark - <UITableViewDataSource>
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.groups.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WSelectPhotoPickerGroupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[WSelectPhotoPickerGroupTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.group = self.groups[indexPath.row];
    
    return cell;
    
}

#pragma mark 跳转到控制器里面的内容
- (void) jump2StatusVc{
    // 如果是相册
    WSelectPhotoPickerGroup *gp = nil;
    for (WSelectPhotoPickerGroup *group in self.groups) {
        if ((self.status == PickerViewShowStatusCameraRoll || self.status == PickerViewShowStatusVideo) && ([group.groupName isEqualToString:@"Camera Roll"] || [group.groupName isEqualToString:@"相机胶卷"])) {
            gp = group;
            break;
        }else if (self.status == PickerViewShowStatusSavePhotos && ([group.groupName isEqualToString:@"Saved Photos"] || [group.groupName isEqualToString:@"保存相册"])){
            gp = group;
            break;
        }else if (self.status == PickerViewShowStatusPhotoStream &&  ([group.groupName isEqualToString:@"Stream"] || [group.groupName isEqualToString:@"我的照片流"])){
            gp = group;
            break;
        }
    }
    
    if (!gp) return ;
    
    WSelectPhotoPickerAssetsViewController *assetsVc = [[WSelectPhotoPickerAssetsViewController alloc] init];
    assetsVc.selectPickerAssets = self.selectAsstes;
    assetsVc.assetsGroup = gp;
    assetsVc.groupVc = self;
    assetsVc.minCount = self.minCount;
    [self.navigationController pushViewController:assetsVc animated:NO];
}

#pragma mark -<UITableViewDelegate>
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    WSelectPhotoPickerGroup *group = self.groups[indexPath.row];
    WSelectPhotoPickerAssetsViewController *assetsVc = [[WSelectPhotoPickerAssetsViewController alloc] init];
    assetsVc.selectPickerAssets = self.selectAsstes;
    assetsVc.groupVc = self;
    assetsVc.assetsGroup = group;
    assetsVc.minCount = self.minCount;
    [self.navigationController pushViewController:assetsVc animated:YES];
}

#pragma mark -<Images Datas>

-(void)getImgs{
    WSelectPhotoPickerDatas *datas = [WSelectPhotoPickerDatas defaultPicker];
    
    __weak typeof(self) weakSelf = self;
    
    if (self.status == PickerViewShowStatusVideo){
        // 获取所有的图片URLs
        [datas getAllGroupWithVideos:^(NSArray *groups) {
            self.groups = groups;
            if (self.status) {
                [self jump2StatusVc];
            }
            
            weakSelf.tableView.dataSource = self;
            [weakSelf.tableView reloadData];
            
        }];
        
    }else{
        
        // 获取所有的图片URLs
        [datas getAllGroupWithPhotos:^(NSArray *groups) {
            
            self.groups = groups;
            if (self.status) {
                [self jump2StatusVc];
            }
            
            weakSelf.tableView.dataSource = self;
            [weakSelf.tableView reloadData];
            
        }];
        
    }
}


#pragma mark -<Navigation Actions>
- (void) back{
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end