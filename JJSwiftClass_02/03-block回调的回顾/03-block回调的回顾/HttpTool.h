//
//  HttpTool.h
//  03-block回调的回顾
//
//  Created by xiaomage on 15/11/29.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpTool : NSObject

- (void)requestData:(void(^)())callBack;

@end
