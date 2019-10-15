//
//  ViewController.swift
//  XRowView
//
//  Created by ZhangXun on 2019/10/15.
//  Copyright © 2019 ixuna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let rowData = XItemRowData.textRow("普通文本", "有效值")
//        let rowView = XItemRowView.instance(rowData)
//        rowView.offsetY = 100
//        self.view.addSubview(rowView)
        
        
        
//        let itemsView = XGroupItemView.instance(oneRowData())
//        itemsView.offsetY = 100
//        view.addSubview(itemsView)

        let twoItemsView=XTwoItemView.instance(towRowData(), true)
        twoItemsView.offsetY = 100
        view.addSubview(twoItemsView)
    }
    
    func towRowData()->[XItemRowData]{
        let data10 = XItemRowData()
        data10.title="厨房"
        data10.type = .unit
        data10.keyBoardType = UIKeyboardType.numberPad
        data10.placeholder = "请输入"
        data10.unit="个"
        
        let data11 = XItemRowData()
        data11.title="阳台"
        data11.type = .unit
        data11.keyBoardType = UIKeyboardType.numberPad
        data11.placeholder = "请输入"
        data11.unit="个"
        
        let data20 = XItemRowData()
        data20.titleWidth=55
        data20.title="面积"
        data20.issnow=true
        data20.type = .unit
        data20.keyBoardType = UIKeyboardType.decimalPad
        data20.placeholder = "建筑面积"
        data20.valueWidth = 120
        data20.unit="m²"
        
//        var floor0:[String]=[]
//        var floor1:[String]=[]
//        for i in -11..<100{
//            floor0.append("第\(i+1)层")
//        }
//        for i in -11..<100{
//            floor1.append("共\(i+1)层")
//        }
        let data21 = XItemRowData()
        data21.issnow=true
        data21.title="楼层"
        data21.type = .arrow
//        data21.pickerType = .both
//        data21.pickerBothChooseArr=[floor0,floor1]
//        data21.pickerTitle="选择楼层"
//        data21.placeholder = "请选择"
        
        let data30 = XItemRowData()
        data30.issnow=true
        data30.title="装修"
        data30.type = .arrow
//        data30.pickerTitle="选择装修"
//        data30.pickerType = .general
        data30.placeholder = "请选择"
        
        let data31 = XItemRowData()
        data31.issnow=true
        data31.title="朝向"
//        data31.pickerTitle="选择朝向"
        data31.type = .arrow
//        data31.pickerType = .general
        data31.placeholder = "请选择"
        
        let data40 = XItemRowData()
        data40.title="电梯"
        data40.type = .swith
        
        let data41 = XItemRowData()
        data41.title=" "
        data41.type = .text
        data41.placeholder = " "
        return [data10,data11,data20,data21,data30,data31,data40,data41]
    }
    
    func oneRowData()->[[XItemRowData]]{
        let data00 = XItemRowData.textRow("普通文本", "有效值")
        
        let data01 = XItemRowData.arrowRow("修改手机号")
        data01.titleWidth=120
        data01.value = "13693837373"
        data01.icon = "setting_icon_cache"
        
        let data02 = XItemRowData.arrowRow("证件信息")
        data02.icon = "setting_icon_cache"
        
        let data10 = XItemRowData.inputRow("姓名","请输入姓名")
        data10.issnow = true
        
        
        let data11 = XItemRowData.inputRow("身份证","请输入身份证")
        
        let data15 = XItemRowData.inputRow("金额")
        data15.type = .unit
        data15.unit = "元"
        
        let data12 = XItemRowData.arrowRow("性别")
        data12.type = .select
        data12.valueWidth = 90
        data12.pointStyle = .sex
        
        let data13 = XItemRowData.arrowRow("出生年月")
        data13.placeholder="请选择出生年月"
        
        let data14 = XItemRowData.textRow("房产","")
        data14.type = .swith
        
        
        
        let data16 = XItemRowData.inputRow("自定义按钮")
        data16.type = .button
        data16.value = " 点击按钮 "
        data16.valueColor =  UIColor.colorBlue
        data16.valueFont=UIFont.font14
        data16.isBorder = true

        return [[data00, data01], [data10,data11,data15],[data12,data13,data14,data16]]
    }


}

