//
//  XItemPickerData.swift
//  YouLiZhiYu
//
//  Created by ZhangXun on 2018/10/26.
//  Copyright © 2018年 AD. All rights reserved.
//

import UIKit

class XItemPickerData: XItemRowData {
    //选择带picker控件row
    static func pickerRow1(_ title:String, _ placeholder:String="请选择")->XItemPickerData{
        let data = arrowRow(title, placeholder) as! XItemPickerData
        data.pickerType = .general
        return data
    }
    
    //选择带picker控件row (必选)
    static func snowPickerRow1(_ title:String, _ placeholder:String="请选择")->XItemPickerData{
        let data = pickerRow1(title, placeholder)
        data.issnow=true
        return data
    }

}


