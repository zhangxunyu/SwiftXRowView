//
//  XItemRowData.swift
//  YouLiZhiYu
//
//  Created by ZhangXun on 2018/7/6.
//  Copyright © 2018年 AD. All rights reserved.
//

import UIKit

class XItemRowData:XRowData {
     var pointStyle:XPointSelectStyle = .judge
    var type:XItemRowStyle =  .text
    var limitLength:Int = 0
    var titleWidth:CGFloat=95
    var value:String = ""//值
    var isBorder = false
    var valueWidth:CGFloat=0
    var valueFont:UIFont = .font14
    var valueColor:UIColor = .color000
    var isValueBorder = false //边框
    var isValueBold = false
    var placeholder:String=""//提示
    var unit: String=""//单位
    var isline:Bool=true //是否显示下线
    var index:Int = 0 //当前编号
    var icon:String = ""//title图标
    var keyBoardType = UIKeyboardType.default
    var minDate:String = "" //最小时间
    var maxData:String = "" //最大时间
    var pickerType:XItemPickerStyle = .none //键盘样式
    var pickerGeneralArr:[String] = [] //键盘数据 单选用
    var pickerBothChooseArr:[[String]] = [] //键盘数据 复选用
    var pickerTitle:String = ""
    var pickerDefaultValue:String = ""
    var pickerHint:String = ""  //出现picker前提示的内容
    var pickerDefaultArrValue:[String] = []
    var pickerSelected:[String]=[]
    
    
    //text row
    static func textRow(_ title:String, _ value:String)->XItemRowData{
        let data = XItemRowData()
        data.title = title
        data.value=value
        return data
    }
    
    //输入row
    static func inputRow(_ title:String, _ placeholder:String="请输入")->XItemRowData{
        let data = XItemRowData()
        data.type = .input
        data.title = title
        data.placeholder = placeholder
        return data
    }
    
    //输入row(必填)
    static func snowInputRow(_ title:String, _ placeholder:String="请输入")->XItemRowData{
        let data = XItemRowData.inputRow(title, placeholder)
        data.issnow = true
        return data
    }
    
    //选择row
    static func arrowRow(_ title:String, _ placeholder:String="请选择")->XItemRowData{
        let data = XItemRowData()
        data.type = .arrow
        data.title = title
        data.placeholder = placeholder
        return data
    }
    
    //选择row (必选)
    static func snowArrowRow(_ title:String, _ placeholder:String="请选择")->XItemRowData{
        let data = arrowRow(title, placeholder)
        data.issnow = true
        return data
    }
    
    //选择带picker控件row
    static func pickerRow(_ title:String, _ placeholder:String="请选择")->XItemRowData{
        let data = arrowRow(title, placeholder)
        data.pickerType = .general
        return data
    }
    
    //选择带picker控件row (必选)
    static func snowPickerRow(_ title:String, _ placeholder:String="请选择")->XItemRowData{
        let data = pickerRow(title, placeholder)
        data.issnow=true
        return data
    }
}
