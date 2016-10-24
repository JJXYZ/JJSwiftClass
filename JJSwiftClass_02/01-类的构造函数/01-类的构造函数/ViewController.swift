//
//  ViewController.swift
//  01-类的构造函数
//
//  Created by xiaomage on 15/11/29.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /*
        let p = Person()
        p.name = "why"
        p.age = 18
        */
        
        // let p = Person(name: "yz", age: 20)
        
        let dict = ["name" : "lmj", "age" : "25"]
        let p = Person(dict: dict as [String : AnyObject])
        
        print("name:\(p.name!), age:\(p.age)")
    }
}

