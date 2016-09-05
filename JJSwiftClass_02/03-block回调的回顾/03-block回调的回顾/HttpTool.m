//
//  HttpTool.m
//  03-block回调的回顾
//
//  Created by xiaomage on 15/11/29.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "HttpTool.h"

@interface HttpTool ()

/** 回调block */
@property (nonatomic, copy) void(^callBack)();

@end

@implementation HttpTool

- (void)requestData:(void (^)())callBack
{
    self.callBack = callBack;
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        NSLog(@"正在进行网络请求:%@",[NSThread currentThread]);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            callBack();
        });
    });
}

@end
