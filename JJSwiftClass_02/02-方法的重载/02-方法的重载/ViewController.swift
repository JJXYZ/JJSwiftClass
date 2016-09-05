//
//  ViewController.swift
//  02-方法的重载
//
//  Created by xiaomage on 15/11/29.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

struct MathTool2 {
    func sum(num1 : Int, num2 : Int) -> Int {
        return num1 + num2
    }
    
    func sum(num1 : Double, num2 : Double) -> Double {
        return num1 + num2
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mathTool = MathTool2()
        mathTool.sum(<#T##num1: Int##Int#>, num2: <#T##Int#>)
    }


}

