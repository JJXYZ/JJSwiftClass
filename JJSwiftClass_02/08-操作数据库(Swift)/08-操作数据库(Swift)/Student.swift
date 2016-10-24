//
//  Student.swift
//  08-操作数据库(Swift)
//
//  Created by xiaomage on 15/11/29.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import Foundation

class Student: NSObject {
    var name : String?
    var age : Int = 0
    
    init(name : String, age : Int) {
        self.name = name
        self.age = age
    }
    
    init(dict : [String : AnyObject]) {
        super.init()
        self.setValuesForKeys(dict)
    }
    
    func insertStudent() {
        // 1.封装插入的SQL
        let insertSQL = "INSERT INTO t_student (name, age) VALUES ('\(name!)',\(age));"
        
        // 2.执行SQL
        if SQLiteManager.shareInstance().execSQL(insertSQL) {
            print("插入数据成功")
        }
    }
    
    class func loadData() -> [Student]? {
        // 1.封装查询语句
        let querySQL = "SELECT name, age FROM t_student;";
        
        // 2.执行查询语句
        let dictArray = SQLiteManager.shareInstance().querySQL(querySQL)
        
        // 3.判断数组如果有值,则遍历,并且转成模型对象,放入另外一个数组中
        if let tempDictArray = dictArray {
            var tempArray = [Student]()
            for dict in tempDictArray {
                tempArray.append(Student(dict: dict))
            }
            
            return tempArray
        }
        
        return nil
    }
}
