//
//  CZFriendGroup.h
//  A03-QQ好友列表
//
//  Created by Apple on 14/12/22.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZFriendGroup : NSObject
/**
 *  分组名称
 */
@property (nonatomic,copy) NSString *name;
/**
 *  <#Description#>
 */
@property (nonatomic,assign) int online;

@property (nonatomic,strong) NSArray *friends;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)friendGroupWithDic:(NSDictionary *)dic;

+ (NSArray *)friendGroupsList;
@end
