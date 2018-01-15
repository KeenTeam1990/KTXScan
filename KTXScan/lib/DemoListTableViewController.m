//
//  NativeTableViewController.m
//  LBXScanDemo
//
//  Created by lbxia on 2017/1/4.
//  Copyright © 2017年 lbx. All rights reserved.
//

#import "DemoListTableViewController.h"
#import "Global.h"
#import "QQLBXScanViewController.h"
#import "StyleDIY.h"

@interface DemoListTableViewController ()<UINavigationControllerDelegate>
@property (nonatomic, strong) NSArray<NSArray*>* arrayItems;
@end

@implementation DemoListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self arrayItems];

}

- (NSArray*)arrayItems
{
    if (!_arrayItems) {
        
        //界面DIY list
        NSArray *array1 = @[
                            @[@"模拟qq扫码界面",@"qqStyle"]
                          
                            ];
        
        
        _arrayItems = @[array1];
    }
    return _arrayItems;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return _arrayItems.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSArray *item = _arrayItems[section];
    return item.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [_arrayItems[indexPath.section][indexPath.row]firstObject];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    QQLBXScanViewController *vc = [QQLBXScanViewController new];
    vc.libraryType = [Global sharedManager].libraryType;
    vc.scanCodeType = [Global sharedManager].scanCodeType;
    vc.style = [StyleDIY qqStyle];
    vc.isVideoZoom = YES;
    [self.navigationController pushViewController:vc animated:YES];

}

@end
