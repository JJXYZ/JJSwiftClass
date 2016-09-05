//
//  ViewController.swift
//  08-操作数据库(Swift)
//
//  Created by xiaomage on 15/11/29.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        let stu = Student(name: "why", age: 18)
//        stu.insertStudent()
        // deleteData()
        let array = Student.loadData()
        print(array)
    }
    
    func deleteData() {
        // 1.封装删除的SQL
        let deleteSQL = "DELETE FROM t_student WHERE id = 1;"
        
        // 2.执行sql
        if SQLiteManager.shareInstance().execSQL(deleteSQL) {
            print("删除成功")
        }
    }
}

