//
//  HttpTool.swift
//  04-闭包的简单使用
//
//  Created by xiaomage on 15/11/29.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

class HttpTool: NSObject {
    
    var callBack : (()->())?
    
    // 闭包的类型:(参数列表)->(返回值)
    // 建议:以后写闭包类型直接:()->()
    func requestData(callBack : ()->()) {
        
        self.callBack = callBack
        
        dispatch_async(dispatch_get_global_queue(0, 0)) { () -> Void in
            print("正在网络请求:\(NSThread.currentThread())")
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                callBack()
            })
        }
    }
}
