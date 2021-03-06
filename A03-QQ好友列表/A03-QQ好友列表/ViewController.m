//
//  ViewController.m
//  A03-QQ好友列表
//
//  Created by Apple on 14/12/22.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "CZFriend.h"
#import "CZFriendGroup.h"
#import "CZFriendGroupHeaderView.h"
@interface ViewController ()
@property (nonatomic,strong) NSArray *friendGroups;
@end

@implementation ViewController
//1 懒加载
- (NSArray *)friendGroups
{
    if (_friendGroups == nil) {
        _friendGroups = [CZFriendGroup friendGroupsList];
    }
    return _friendGroups;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //2 测试数据
    
}

#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.friendGroups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return [self.friendGroups[section] friends].count;
    CZFriendGroup *friendGroup = self.friendGroups[section];
    return friendGroup.friends.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1 创建cell
    static NSString *reuseId = @"friend";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseId];
    }
    
    //2 设置子控件的值
    CZFriendGroup *friendGroup = self.friendGroups[indexPath.section];
    CZFriend *friend = friendGroup.friends[indexPath.row];
    
    cell.textLabel.text = friend.name;
    cell.detailTextLabel.text = friend.intro;
    cell.imageView.image = [UIImage imageNamed:friend.icon];
    //会员
    cell.textLabel.textColor = friend.isVip ? [UIColor redColor] : [UIColor blackColor];
    
    //3 返回
    return cell;
}

//返回组标题
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    CZFriendGroup *friendGroup = self.friendGroups[section];
//    return friendGroup.name;
//}

//
//#pragma mark - 代理方法
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    //1 创建自定义的可重用的headerView
////    static NSString *reuseId = @"group";
////    UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:reuseId];
//   
//    
//    
//    //2 设置子控件的值
//    
//    //3 返回
//}











@end
