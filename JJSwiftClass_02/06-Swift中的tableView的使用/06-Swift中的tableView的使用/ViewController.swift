//
//  ViewController.swift
//  06-Swift中的tableView的使用
//
//  Created by xiaomage on 15/11/29.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 添加一个tableView
        let tableView = UITableView()
        tableView.frame = self.view.bounds
        self.view.addSubview(tableView)
        
        // 设置数据源
        tableView.dataSource = self
        
        // 设置代理
        tableView.delegate = self
    }
    
}

// 相当于OC中的category
// extension只能扩充方法
extension ViewController : UITableViewDataSource, UITableViewDelegate {
    // MARK:- tableView数据源方法
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let ID = "Cell"
        
        // 从缓冲池中取出cell
        var cell = tableView.dequeueReusableCell(withIdentifier: ID)
        
        // 判断是否为nil,如果为nil,则创建
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: ID)
        }
        
        cell?.textLabel?.text = "测试数据\((indexPath as NSIndexPath).row)"
        
        return cell!
    }
    
    // MARK:- tableView代理方法
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("点击了\((indexPath as NSIndexPath).row)")
    }
}

