//: Playground - noun: a place where people can play

import UIKit

/******************************************************/

/*
创建对象
OC:     alloc initWithXXX 方法
Swift:  (xxx:)

调用方法
OC:     [UIColor redColor];
Swift   UIColor.redColor()

枚举
OC:      UIButtonTypeContactAdd
Swift:   UIButtonType.ContactAdd
*/

let view = UIView(frame: CGRectMake(0, 0, 100, 100))
view.backgroundColor = UIColor.redColor()

let btn = UIButton(type: UIButtonType.ContactAdd)
btn.center = CGPoint(x: 50, y: 50)
view.addSubview(btn)

