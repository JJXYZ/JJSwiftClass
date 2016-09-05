//
//  ViewController.swift
//  05-Swift中的懒加载
//
//  Created by xiaomage on 15/11/29.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 1>数据用到时再加载
    // 2>数据只会加载
    lazy var names : [String] = {
        
        // () -> [String] in
        
        print("加载数据")
        return ["why", "yz", "lmj", "lnj"]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print(names)
        print(names)
        print(names)
    }

}

