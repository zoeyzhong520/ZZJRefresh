//
//  ViewController.m
//  ZZJRefresh
//
//  Created by 仲召俊 on 2017/4/11.
//  Copyright © 2017年 ZZJ. All rights reserved.
//

#import "ViewController.h"
#import "ZZJRefresh.h"
#import "MJRefresh.h"

#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)ZZJRefresh *zzjRefresh;

@property (nonatomic,strong)UITableView *tableView;

@end

@implementation ViewController

//懒加载
//- (UITableView *)tableView {
//    if (!_tableView) {
//        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight-64) style:UITableViewStylePlain];
//        _tableView.delegate = self;
//        _tableView.dataSource = self;
//        [self.view addSubview:_tableView];
//    }
//    return _tableView;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"ZZJRefresh";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight-64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    //ZZJRefresh调用
    _zzjRefresh = [[ZZJRefresh alloc] init];
    
    [_zzjRefresh gifModelRefresh:_tableView refreshType:RefreshTypeDouble firstRefresh:YES timeLabHidden:NO stateLabHidden:NO dropDownBlock:^{
        if ([_tableView.mj_header isRefreshing]) {
            [_tableView.mj_header endRefreshing];
        }
    } upDropBlock:^{
        if ([_tableView.mj_footer isRefreshing]) {
            [_tableView.mj_footer endRefreshing];
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDelegate & UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",indexPath.row];
    return cell;
}

@end
