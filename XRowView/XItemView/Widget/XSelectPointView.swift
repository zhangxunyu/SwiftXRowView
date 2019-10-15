//
//  XSelectPointView.swift
//  YouLiZhiYu
//
//  Created by ZhangXun on 2018/10/31.
//  Copyright © 2018年 AD. All rights reserved.
//

import UIKit

enum XPointSelectStyle {
    case sex //性别 男女
    case judge //判定 是否
    case degree //一般 紧急
    case ownercom//个人id=1公司id=0
    case hire//收租方式
}

class XSelectPointView: XBaseView {

    @IBOutlet weak var select1: UIButton!
    @IBOutlet weak var select2: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func btnEvent(_ sender: UIButton) {
        if sender.tag == 1{//是
            select1.isSelected=true
            select2.isSelected=false
        }else{//0否
            select2.isSelected=true
            select1.isSelected=false
        }
        if eventHandler != nil {
            eventHandler!(sender.tag)
        }
    }
    
    static func instance()->XSelectPointView{
        let view = XSelectPointView.loadNib()
        view.frame=CGRect(x: 0, y: 0, width: 105, height: 14)
        return view
    }
    
    func setData(_ data:XItemRowData){
        let style=data.pointStyle
        let id = data.id
        if id == 0{//否
            select2.isSelected=true
            select1.isSelected=false
        }else{//是
            select2.isSelected=false
            select1.isSelected=true
        }
        var str0=""
        var str1=""
        switch style {
        case .sex:
            str0="男"
            str1="女"
        case .judge:
            str0="是"
            str1="否"
        case .degree:
            str0="一般"
            str1="紧急"
        case .ownercom:
            str0="个人"
            str1="企业"
        case .hire:
            str0="按天计费"
            str1="按月计费"
        }
        select1.setTitle(str0, for: UIControl.State.normal)
//        select1.layoutButton(with: MKButtonEdgeInsetsStyle.left, imageTitleSpace: 2)
        select2.setTitle(str1, for: UIControl.State.normal)
//        select2.layoutButton(with: MKButtonEdgeInsetsStyle.left, imageTitleSpace: 2)
        setLabColor(data)
    }
    
    func setLabColor(_ data:XItemRowData){
        select1.setTitleColor(data.valueColor, for: UIControl.State.normal)
        select2.setTitleColor(data.valueColor, for: UIControl.State.normal)
    }

}
