//
//  MathTool.swift
//  02-方法的重载
//
//  Created by xiaomage on 15/11/29.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

class MathTool {
    func sum(num1 : Int, num2 : Int) -> Int {
        return num1 + num2
    }
    
    func sum(num1 : Int, num2 : Int, num3 : Int) -> Int {
        return num1 + num2 + num3
    }
    
    func sum(num1 : Double, num2 : Double) -> Double {
        return num1 + num2
    }
    
    
    // 方法的重载
    // 1.方法名字相同,但是参数不同,就是方法的重载
    // 2.参数不同:1>参数个数不同 2>参数的类型不同
//    
//    func printInfo(str : String) {
//        
//    }
//    
//    func printInfo(num : Int) {
//        
//    }
    
}
