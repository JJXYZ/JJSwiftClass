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
    func requestData(_ callBack : @escaping ()->()) {
        
        self.callBack = callBack
        
        DispatchQueue.global(priority: 0).async { () -> Void in
            print("正在网络请求:\(Thread.current)")
            
            DispatchQueue.main.async(execute: { () -> Void in
                callBack()
            })
        }
    }
}
