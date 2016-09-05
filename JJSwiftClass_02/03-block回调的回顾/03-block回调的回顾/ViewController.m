//
//  ViewController.m
//  03-block回调的回顾
//
//  Created by xiaomage on 15/11/29.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "ViewController.h"
#import "HttpTool.h"

@interface ViewController ()

/** 网络请求的对象 */
@property (nonatomic, strong) HttpTool *httpTool;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.httpTool = [[HttpTool alloc] init];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    __weak ViewController *weakSelf = self;
    
    [self.httpTool requestData:^{
        NSLog(@"获取到数据");
        NSLog(@"更新界面:%@", [NSThread currentThread]);
        
        weakSelf.view.backgroundColor = [UIColor purpleColor];
    }];
}

- (void)dealloc
{
    NSLog(@"ViewController----dealloc");
}

@end
