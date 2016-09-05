//
//  SQLiteManager.swift
//  08-操作数据库(Swift)
//
//  Created by xiaomage on 15/11/29.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

class SQLiteManager: NSObject {
    
    // MARK:- 设计单例对象
    // 1.创建类的实例变量
    // let是线程安全
    static let instance = SQLiteManager()
    
    // 2.对外提供获取单例的接口
    // 定义类方法class func 方法名称() -> 返回值
    class func shareInstance() -> SQLiteManager  {
        return instance
    }
    
    
    // MARK:- 对数据库的操作
    
    // 定义数据库的变量
    var db : COpaquePointer = nil
    
    func openDB() -> Bool {
        // 1.获取文件的路径+文件名称
        let filePath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).first
        let file = (filePath! as NSString).stringByAppendingPathComponent("test.sqlite")
        let cFile = (file.cStringUsingEncoding(NSUTF8StringEncoding))!
        
        // print(filePath)
        
        // 2.打开数据库
        if sqlite3_open(cFile, &db) != SQLITE_OK {
            print("打开数据库失败")
            return false
        }
        
        // 3.创建表
        return createTable()
    }
    
    func createTable() -> Bool {
        // 1.封装创建表的SQL语句
        let createTableSQL = "CREATE TABLE IF NOT EXISTS 't_student' ( 'id' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,'name' TEXT,'age' INTEGER);";
        
        // 2.执行SQL语句
        return execSQL(createTableSQL)
    }
    
    func execSQL(sql : String) -> Bool {
        // 1.将sql语句转成c语言字符串
        let cSQL = (sql.cStringUsingEncoding(NSUTF8StringEncoding))!
        
        return sqlite3_exec(db, cSQL, nil, nil, nil) == SQLITE_OK
    }
    
    
    func querySQL(querySQL : String) -> [[String : AnyObject]]? {
        // 定义游标对象
        var stmt : COpaquePointer = nil
        
        // 将查询语句转成C语言的字符串
        let cQuerySQL = (querySQL.cStringUsingEncoding(NSUTF8StringEncoding))!
        
        // 查询的准备工作
        if sqlite3_prepare_v2(db, cQuerySQL, -1, &stmt, nil) != SQLITE_OK {
            print("没有准备好")
            return nil
        }
        
        // 准备好
        var tempArray = [[String : AnyObject]]()
        while sqlite3_step(stmt) == SQLITE_ROW {
            // 1.获取列的个数
            let count = sqlite3_column_count(stmt)
            
            // 2.遍历某一个列数据
            var dict = [String : AnyObject]();
            for i in 0..<count {
                let cKey = sqlite3_column_name(stmt, i)
                let key = String(CString: cKey, encoding: NSUTF8StringEncoding)
                
                let cValue = UnsafePointer<Int8>(sqlite3_column_text(stmt, i))
                let value = String(CString: cValue, encoding: NSUTF8StringEncoding)
                
                dict[key!] = value!
            }
            
            // 3.将字典放入数组中
            tempArray.append(dict)
        }
        
        return tempArray
    }
}
