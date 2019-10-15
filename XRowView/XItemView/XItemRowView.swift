//
//  XItemRowView.swift
//  YouLiZhiYu
//
//  Created by ZhangXun on 2018/7/6.
//  Copyright © 2018年 AD. All rights reserved.
// 1个单元

import UIKit
import SnapKit

enum XItemRowStyle {
    case text //普通文本
    case input //输入文本
    case unit //带单位
    case arrow//尖头
    case swith//开关
    case button//按钮
    case select//选择
}

enum XItemPickerStyle {
    case none //点击事件
    case general //单项选择
    case both //复选
    case triple//三个
    case date//时间到日
    case dateAndTime//到分
}

class XItemRowView: XBaseView {
    typealias InputBeginEventHandler = (_ tag:Int) -> Void
    var inputBeginEventHandler:InputBeginEventHandler?
    
    typealias InputEndEventHandler = (_ tag:Int) -> Void
    var inputEndEventHandler:InputEndEventHandler?
    typealias InputChangeEventHandler = (_ tag:Int) -> Void
    var inputChangeEventHandler:InputChangeEventHandler?
    @IBOutlet weak var unit: UILabel!
    @IBOutlet weak var box: XUnderlineView!
    @IBOutlet weak var arrow: UIImageView!
    @IBOutlet weak var value: UITextField!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var valueBtn: UIButton!
    var isTouch=false
    private var type = XItemRowStyle.text
    private var titleWidth:CGFloat = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        box.isUserInteractionEnabled=false
        value.isUserInteractionEnabled=false
        title.isUserInteractionEnabled = false
        arrow.isHidden=true
        unit.isHidden=true
    }
    
    var data:XItemRowData!

    private func updata(){
        let keyHeadView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: data.inputAccessoryHeight))
        keyHeadView.isUserInteractionEnabled = false
        value.inputAccessoryView = keyHeadView
        valueBtn.isHidden=true
        valueBtn.setTitle(data.value, for: UIControl.State.normal)
        valueBtn.setTitleColor(data.valueColor, for: UIControl.State.normal)
        if data.isValueBorder {
            valueBtn.layer.borderColor = data.valueColor.cgColor
            valueBtn.layer.borderWidth = kLineStroke
            valueBtn.layer.masksToBounds = true
            valueBtn.layer.cornerRadius = 2
        }
        if data.valueWidth != 0 {
            valueBtn.width = data.valueWidth
        }
        title.textColor=data.titleColor
        title.text=data.title
        if !data.icon.isEmpty{
            XRowTool.addIcon(title, data.icon)
        }
        title.font=data.titleFont
//        if data.subhead.isEmpty{
//            title.text=data.title
//        }else{//添加富文本
//            XRowTool.formatTitle(title, data.title, data.subhead)
//        }
        value.placeholder=data.placeholder
        value.text=data.value
        value.textColor=data.valueColor
        value.keyboardType=data.keyBoardType
        if data.isValueBold {
            value.font=UIFont.boldSystemFont(ofSize: data.valueFont.pointSize)
        }else{
            value.font=data.valueFont
        }
        unit.text=data.unit
        if data.type == .unit{
            unit.sizeToFit()
            box.isUserInteractionEnabled=true
            value.isUserInteractionEnabled=true
            unit.isHidden=false
            unit.snp.makeConstraints { (make) in
                make.centerY.equalTo(box)
                make.right.equalTo(box.snp.right)
                make.width.equalTo(unit.width)
            }
            value.snp.makeConstraints { (make) in
                make.centerY.equalTo(box)
                make.right.equalTo(box.snp.right).offset(-unit.width-3)
                make.left.equalTo(title.snp.right)
            }
        }else if data.type == .swith{
            value.text = " "
            switchView.setData(data)
        }else if data.type == .button{
            value.text = " "
            valueBtn.isHidden=false
            if data.isBorder {
                valueBtn.layer.cornerRadius = 4
                valueBtn.layer.masksToBounds=true
                valueBtn.layer.borderColor = data.valueColor.cgColor
                valueBtn.layer.borderWidth = kLineStroke
            }
        }else if data.type == .select{
            value.text = " "
            selectPointView.setData(data)
            selectPointView.snp.makeConstraints { (make) in
                make.centerY.equalTo(box)
                make.right.equalTo(box.snp.right)
                make.width.equalTo(data.valueWidth)
                make.height.equalTo(data.rowHeight)
            }
        }
        box.isLine=data.isline
        if data.isline {
            box.addLine()
        }else{
            box.clearLine()
        }
        
        
        self.isUserInteractionEnabled=data.isEnabled
        if data.issnow {
            title.addSnow()
        }
        
        if data.valueWidth != 0{
            valueBtn.snp.makeConstraints { (make) in
                make.centerY.equalTo(box)
                make.right.equalTo(box.snp.right)
                make.width.equalTo(data.valueWidth)
            }
        }
        
       
    }
    
    ///更新数据
    func reloadData(_ data:XItemRowData){
        self.data=data
        updata()
    }
    
    ///当前单元的数据获取
    var backData:XItemRowData{
        get{
            data.value=value.text ?? ""
            return data
        }
    }
    
    static func instance(_ data:XItemRowData)->XItemRowView{
        let view=XItemRowView.loadNib()
        view.type=data.type
        view.titleWidth=data.titleWidth
        view.showView()
        view.data=data
        view.keyBoardEvent()
        view.updata()
        view.frame=CGRect(x: 0, y: 0, width: kScreenWidth, height: data.rowHeight)
        return view
    }
    
    func keyBoardEvent(){
//        value.zx.keyBoardEidtor(data.keyBoardType,defaultV:data.inputDefaultValue).endEditingBlock={
//            self.isUserInteractionEnabled=true
//             var str:String = $0
//            if self.type == .input{
//                if str.length > self.data.limitLength && self.data.limitLength != 0{
//                    let index = str.index(str.startIndex, offsetBy: 0)
//                    let endIndex = str.index(str.endIndex, offsetBy: (self.data.limitLength-str.length))
//                    str =  String(str[index ..< endIndex])
//                    self.value.text=str
//                }
//            }
//            self.data.value=str
//            if self.inputEndEventHandler != nil {
//                self.inputEndEventHandler!(self.data.index)
//            }
//        }
//        value.zx.beginEditingBlock = {
//            var str:String = $0
//            if self.inputBeginEventHandler != nil {
//                self.inputBeginEventHandler!(self.data.index)
//            }
//        }
//        value.zx.valuesChangeBlock={
//            var str:String = $0
//            if self.type == .input{
//                if str.length > self.data.limitLength && self.data.limitLength != 0{
//                    let index = str.index(str.startIndex, offsetBy: 0)
//                    let endIndex = str.index(str.endIndex, offsetBy: (self.data.limitLength-str.length))
//                    str =  String(str[index ..< endIndex])
//                    self.value.text=str
//                }
//            }
//            self.data.value=str
//            if self.inputChangeEventHandler != nil {
//                self.inputChangeEventHandler!(self.data.index)
//            }
//        }
    }
    
    func showView(){
        
        title.snp.makeConstraints { (make) in
            make.centerY.equalTo(box)
            make.left.equalTo(box.snp.left)
            make.width.equalTo(self.titleWidth)
        }
        
        title.snp.makeConstraints { (make) in
            make.centerY.equalTo(box)
            make.left.equalTo(box.snp.left)
            make.width.equalTo(self.titleWidth)
        }
        
        switch self.type {
        case .text:
            value.snp.makeConstraints { (make) in
                make.centerY.equalTo(box)
                make.right.equalTo(box.snp.right)
                make.left.equalTo(title.snp.right)
            }
        case .input:
            box.isUserInteractionEnabled=true
            value.isUserInteractionEnabled=true
            value.snp.makeConstraints { (make) in
                make.centerY.equalTo(box)
                make.right.equalTo(box.snp.right)
                make.left.equalTo(title.snp.right)
            }
        case .unit:
            unit.sizeToFit()
        case .arrow:
            arrow.isHidden=false
            isTouch=true
            arrow.snp.makeConstraints { (make) in
                make.centerY.equalTo(box)
                make.right.equalTo(box.snp.right)
            }
            value.snp.makeConstraints { (make) in
                make.centerY.equalTo(box)
                make.right.equalTo(arrow.snp.left).offset(-8)
                make.left.equalTo(title.snp.right)
            }
        case .swith:
            box.isUserInteractionEnabled=true
            switchView.snp.makeConstraints { (make) in
                make.centerY.equalTo(box)
                make.right.equalTo(box.snp.right)
                make.width.equalTo(switchView.width)
                make.height.equalTo(switchView.height)
            }
            break
        case .button:
            value.isHidden=true
            box.isUserInteractionEnabled=true
            valueBtn.isUserInteractionEnabled=true
            valueBtn.snp.makeConstraints { (make) in
                make.centerY.equalTo(box)
                make.right.equalTo(box.snp.right)
            }
            valueBtn.addTarget(self, action: #selector(clickValueEvent), for: UIControl.Event.touchUpInside)
            break
        case .select:
            box.isUserInteractionEnabled=true
//            selectPointView.snp.makeConstraints { (make) in
//                make.centerY.equalTo(box)
//                make.right.equalTo(box.snp.right)
//                make.width.equalTo(selectPointView.width)
//                make.height.equalTo(selectPointView.height)
//            }
        }
    }
    
    @objc private func clickValueEvent(){
        if data.value.isEmpty{return}
        if self.eventHandler != nil {
            self.eventHandler!(self.data.index)
        }
    }
    
    private func touchEvent(){
//        if !isTouch {return}
//        switch data.pickerType {
//        case .none:
//            if self.eventHandler != nil {
//                self.eventHandler!(self.data.index)
//            }
//        case .general: //单选
//            if self.data.pickerGeneralArr.count>0 && self.data.value.isEmpty{
//                self.data.pickerDefaultValue=self.data.pickerGeneralArr[0]
//            }
//            data.pickerTitle="选择\(data.title)"
//            BRStringPickerView.showStringPicker(withTitle: self.data.pickerTitle, dataSource: self.data.pickerGeneralArr, defaultSelValue:self.data.pickerDefaultValue, isAutoSelect:false){ value in
//                if self.data.pickerHint.isEmpty{
//                    let data = value as! String
//                    self.data.pickerDefaultValue=data
//                    self.data.value=data
//                    self.data.pickerSelected=[data]
//                    self.reloadData(self.data)
//                    if self.eventHandler != nil {
//                        self.eventHandler!(self.data.index)
//                    }
//                }else{
//                    XClewApi.showAlert(title: "提示", message: self.data.pickerHint)
//                    XClewApi.instance.findEvent(closure: { (index) in
//                        if(index==1){//确定
//                            let data = value as! String
//                            self.data.pickerDefaultValue=data
//                            self.data.value=data
//                            self.data.pickerSelected=[data]
//                            self.reloadData(self.data)
//                            if self.eventHandler != nil {
//                                self.eventHandler!(self.data.index)
//                            }
//                        }
//                    })
//                }
//
//            }
//        case .both: //双选
//            if self.data.pickerBothChooseArr.count>0 && self.data.pickerDefaultArrValue==[]{
//                self.data.pickerDefaultArrValue=self.data.pickerBothChooseArr[0]
//            }
//            BRStringPickerView.showStringPicker(withTitle: self.data.pickerTitle, dataSource: self.data.pickerBothChooseArr, defaultSelValue:self.data.pickerDefaultArrValue, isAutoSelect:false){ value in
//                self.data.pickerSelected=value as! [String]
//                self.data.pickerDefaultArrValue=self.data.pickerSelected
//                var valueStr=""
//                for i in 0..<self.data.pickerSelected.count{
//                    valueStr += self.data.pickerSelected[i]
//                }
//                self.data.value=valueStr
//                self.reloadData(self.data)
//                if self.eventHandler != nil {
//                    self.eventHandler!(self.data.index)
//                }
//            }
//        case .triple:
//            BRAddressPickerView.showAddressPicker(withDefaultSelected: [0,0,0], dataSource: self.data.pickerBothChooseArr as! [Any], isAutoSelect: false, resultBlock: { (selectAddressArr:[Any]?) in
//                print(selectAddressArr!)
//            })
//        case .date:
//            BRDatePickerView.showDatePicker(withTitle: self.data.pickerTitle, dateType: .date, defaultSelValue: self.data.pickerDefaultValue, minDateStr: self.data.minDate, maxDateStr: self.data.maxData, isAutoSelect: false) { [weak self] value in
//                self?.data.value=value!
//                self?.data.pickerDefaultValue=(self?.data.value)!
//                self?.data.pickerSelected=[self?.data.value] as! [String]
//                self?.reloadData((self?.data)!)
//                if self?.eventHandler != nil {
//                    self?.eventHandler!((self?.data.index)!)
//                }
//            }
//        case .dateAndTime:
//            BRDatePickerView.showDatePicker(withTitle: self.data.pickerTitle, dateType: .dateAndTime, defaultSelValue: self.data.pickerDefaultValue, minDateStr: self.data.minDate, maxDateStr: self.data.maxData, isAutoSelect: false) { [weak self] value in
//                self?.data.value=value!
//                self?.data.pickerDefaultValue=(self?.data.value)!
//                self?.data.pickerSelected=[self?.data.value] as! [String]
//                self?.reloadData((self?.data)!)
//                if self?.eventHandler != nil {
//                    self?.eventHandler!((self?.data.index)!)
//                }
//            }
//        }
    }
    
    public lazy var selectPointView : XSelectPointView = {
        let view = XSelectPointView.instance()
        view.frame=CGRect(x: 0, y: 0, width: view.width, height: view.height)
        box.addSubview(view)
        view.eventHandler = {(tag) in
            self.data.id = tag //1是 0否
            self.reloadData(self.data)
            if self.eventHandler != nil {
                self.eventHandler!(self.data.index)
            }
        }
        return view
    }()
    
    public lazy var switchView : XSwitchView = {
        let view = XSwitchView.instance()
        view.frame=CGRect(x: 0, y: 0, width: view.width, height: view.height)
        box.addSubview(view)
        return view
    }()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isTouch == true {
            self.backgroundColor = .colorTouch
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2) {
            self.backgroundColor=UIColor.white
        }
        touchEvent()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isTouch == true {
            self.backgroundColor = .colorTouch
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.backgroundColor=UIColor.white
    }
    
}
