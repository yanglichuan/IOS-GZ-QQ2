//
//  CZFriendGroupHeaderView.h
//  A03-QQ好友列表
//
//  Created by Apple on 14/12/22.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CZFriendGroup;
@interface CZFriendGroupHeaderView : UITableViewHeaderFooterView
@property (nonatomic,strong) CZFriendGroup *friendGroup;

+ (instancetype)headerViewWithTableView:(UITableView *)tableView;
@end
