//
//  ViewController.swift
//  04-闭包的简单使用
//
//  Created by xiaomage on 15/11/29.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var httpTool : HttpTool = HttpTool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        /*
        给闭包赋值:
        {
            (参数) -> (返回值) in
            // 代码块
        }
        */
        
        // 闭包赋值写法一:
        /*
        httpTool.requestData ({ () -> () in
            print("已经请求到网络数据");
            print("更新界面:\(NSThread.currentThread())")
        })
        
        // 闭包赋值写法二:函数的括号可以写在{}前面
        httpTool.requestData () { () -> () in
            print("已经请求到网络数据");
            print("更新界面:\(NSThread.currentThread())")
        }
        
        // MARK:- 这两种写法成为尾随闭包
        
        // 闭包赋值写法三:如果闭包是函数的最后一个参数,则()可以省略
        httpTool.requestData { () -> () in
            print("已经请求到网络数据");
            print("更新界面:\(NSThread.currentThread())")
        }
        */
        // 闭包赋值写法四:最常用写法
        // 如果该闭包没有参数,也没有返回值, `()->() in`可以省略
        
        
        // 解决循环引用的方式一:
        /*
        weak var weakSelf : ViewController? = self
        
        httpTool.requestData {
            print("已经请求到网络数据");
            print("更新界面:\(NSThread.currentThread())")
            
            weakSelf!.view.backgroundColor = UIColor.orangeColor()
        }
        */

        // 解决循环引用的方式二:
        // 该方式不能省略赋值时的:() -> () in
        /*
        httpTool.requestData { [weak self] () -> () in
            print("已经请求到网络数据");
            print("更新界面:\(NSThread.currentThread())")
            
            self!.view.backgroundColor = UIColor.orangeColor()
        }
        */

        // 解决循环引用的方式三:
        // 该方式不能省略赋值时的:() -> () in
        //  unowned
        /*
        __weak:当弱指针指向的对象销毁时,指针自动指向nil
        __unsafe_unretained:当不安全指针指向的对象销毁时,指针依然指向之前的内存地址(野指针)
        */
        httpTool.requestData { [unowned self] () -> () in
            print("已经请求到网络数据");
            print("更新界面:\(Thread.current)")
            
            self.view.backgroundColor = UIColor.orange
        }
    }
    
    // Swift中没有dealloc方法
    // 析构函数:相当于OC中dealloc.也是对象销毁时会调用函数
    deinit {
        print("ViewController----deinit")
    }
}

