//
//  XRowData.swift
//  YouLiZhiYu
//
//  Created by ZhangXun on 2018/9/14.
//  Copyright © 2018年 AD. All rights reserved.
//  基本类属性

import UIKit

class XRowData {
    var id:Int = 0
    var title: String = ""//标题
    var subhead:String =  ""//副标题
    var titleFont:UIFont = .font15
    var titleColor:UIColor = .color000
    var issnow:Bool=false //标注符
    var isEnabled:Bool=true
    var bgColor:UIColor = UIColor.white
    var rowHeight:CGFloat=44//高度
    var bgAlpha:CGFloat = 1
    var inputAccessoryHeight:CGFloat = 0 //添加键盘高度
    var inputDefaultValue:String = "0" //数字输入框默认值

    static func instance(title:String,titleColor:UIColor,titleFont:UIFont,bgColor:UIColor)->XRowData{
        let data = XRowData()
        data.title=title
        data.bgColor = bgColor
        data.titleColor = titleColor
        data.titleFont = titleFont
        return data
    }
}
