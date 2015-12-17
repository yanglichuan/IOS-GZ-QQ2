//
//  ViewController.m
//  B03-复习block
//
//  Created by Apple on 14/12/22.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    void (^)(void)
    
    //block  匿名函数
//    void (^test)() = ^{
//        NSLog(@"test");
//    };
//    
//    test();
    
    
    
//    NSString *str = @"abc";
//    
//    ^{
//        NSLog(@"-----%@",str);
//    }();
    

//    int (^add)(int,int) = ^(int a,int b){
//        return a + b;
//    };
//    
//    int sum = add(5,6);
//    NSLog(@"%d",sum);
    
    
    [self cal:5 b:6 myblock:^int(int c, int d) {
        return c + d;
    }];
    
    [self cal:5 b:6 myblock:^int(int c, int d) {
        return c * d;
    }];
    
}

- (void)cal:(int)a b:(int)b myblock:(int (^)(int,int))myblock
{
    int s = myblock(a,b);
    NSLog(@"%d",s);
}





@end
