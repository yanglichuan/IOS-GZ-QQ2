//
//  CZFriendGroupHeaderView.m
//  A03-QQ好友列表
//
//  Created by Apple on 14/12/22.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "CZFriendGroupHeaderView.h"
#import "CZFriendGroup.h"
@interface CZFriendGroupHeaderView ()
@property (nonatomic,weak) UIButton *nameView;
@property (nonatomic,weak) UILabel *countView;


@end

@implementation CZFriendGroupHeaderView

//1 创建自定义可重用的headerView
+ (instancetype)headerViewWithTableView:(UITableView *)tableView
{
    static NSString *reuseId = @"group";
    CZFriendGroupHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:reuseId];
    if (headerView == nil) {
        headerView = [[self alloc] initWithReuseIdentifier:reuseId];
    }
    return headerView;
}


//2 创建子控件 没有初始化frame
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        //名称的按钮
        UIButton *nameView = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:nameView];
        self.nameView = nameView;
        
        //按钮的属性
        [self.nameView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.nameView setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        //
        self.nameView.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft; //设置左对齐
        self.nameView.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        self.nameView.titleEdgeInsets =UIEdgeInsetsMake(0, 10, 0, 0);
        //按钮的背景图片
        [self.nameView setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
        [self.nameView setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
        //给按钮注册事件
        [self.nameView addTarget:self action:@selector(nameClick) forControlEvents:UIControlEventTouchUpInside];
        
//        NSLog(@"%@",NSStringFromCGRect(self.bounds));
//        nameView.frame = self.bounds;
//        nameView.backgroundColor = [UIColor redColor];
//        [nameView setTitle:@"123" forState:UIControlStateNormal];
        
        
        //个数的label
        UILabel *countView = [[UILabel alloc] init];
        [self.contentView addSubview:countView];
        self.countView = countView;
        //设置label的属性
        countView.textAlignment = NSTextAlignmentRight;
        countView.font = [UIFont systemFontOfSize:14];
        countView.textColor = [UIColor grayColor];
        
//        countView.frame = CGRectMake(100, 0, 100, 44);
//        countView.backgroundColor = [UIColor redColor];
//        countView.text = @"abc";
    }
    return self;
}


- (void)nameClick
{
    self.nameView.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
}




//往headerView中添加子控件的时候会调用
//当改变了headerView的frame会调用
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.nameView.frame = self.bounds;
   
    CGFloat countX = self.bounds.size.width - 10  - 150;
    self.countView.frame = CGRectMake(countX, 0, 150, 44);

}

//3 给子控件赋值
- (void)setFriendGroup:(CZFriendGroup *)friendGroup
{
    _friendGroup = friendGroup;
    [self.nameView setTitle:friendGroup.name forState:UIControlStateNormal];
    self.countView.text = [NSString stringWithFormat:@"%d/%lu",friendGroup.online,(unsigned long)friendGroup.friends.count];
}

@end
