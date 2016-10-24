//
//  Person.swift
//  01-类的构造函数
//
//  Created by xiaomage on 15/11/29.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

class Person: NSObject {
    // var name : Optional<String>
    var name : String?
    var age : Int = 0
    
    override init() {
        // 重写之后是否需要调用super.init()
        // 可以不调用,如果没有主动调用,那么系统会默认调用
    }
    
    // 自定义构造函数,初始化时直接传入名字和年龄
    init(name : String, age : Int) {
        self.name = name
        self.age = age
    }
    
    // 自定义构造函数,初始化时传入的字典
    // init (dict : Dictionary<String, AnyObject>)
//    init (dict : [String : AnyObject]) {
//        // 从AnyObject转成String/Int类型, as!/?
//        // 如果Swift转OC类型时,使用 as
//        name = dict["name"] as? String
//        age = dict["age"] as! Int
//    }
    
    init (dict : [String : AnyObject]) {
        // 从AnyObject转成String/Int类型, as!/?
        // 如果Swift转OC类型时,使用 as
        
        // 如果通过KVC字典转模型,必须先调用super.init()
        super.init()
        self.setValuesForKeys(dict)
    }
}
