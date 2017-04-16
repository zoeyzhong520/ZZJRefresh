//
//  ZZJRefresh.h
//  ZZJRefresh
//
//  Created by 仲召俊 on 2017/4/11.
//  Copyright © 2017年 ZZJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, RefreshType) {
    RefreshTypeDropDown = 0,
    RefreshTypeUpDrop = 1,
    RefreshTypeDouble = 2,
};

@interface ZZJRefresh : NSObject

/*正常模式的上拉和下拉刷新*/
- (void)normalModelRefresh:(UITableView *)tableView refreshType:(RefreshType)refreshType firstRefresh:(BOOL)firstRefresh timeLabHidden:(BOOL)timeLabHidden stateLabHidden:(BOOL)stateLabHidden dropDownBlock:(void(^)(void))dropDownBlock upDropBlock:(void(^)(void))upDropBlock;

/*GIF模式的上拉和下拉刷新*/
- (void)gifModelRefresh:(UITableView *)tableView refreshType:(RefreshType)refreshType firstRefresh:(BOOL)firstRefresh timeLabHidden:(BOOL)timeLabHidden stateLabHidden:(BOOL)stateLabHidden dropDownBlock:(void(^)(void))dropDownBlock upDropBlock:(void(^)(void))upDropBlock;

/**/

@end
