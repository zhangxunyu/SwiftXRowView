//
//  XSwitchView.swift
//  YouLiZhiYu
//
//  Created by ZhangXun on 2018/11/9.
//  Copyright © 2018年 AD. All rights reserved.
//

import UIKit

class XSwitchView: XBaseView {

    @IBOutlet weak var btn: UIButton!
    var data:XItemRowData!
    static func instance()->XSwitchView{
        let view = XSwitchView.loadNib()
        view.frame=CGRect(x: 0, y: 0, width: 50, height: 25)
        return view
    }
    
    func setData(_ data:XItemRowData){
        self.data = data
//        id  1 开 0 关
        if data.id == 0{
            btn.isSelected = false
        }else{
            btn.isSelected = true
        }
    }
    
    @IBAction func btnEvent(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            self.data.id = 1
        }else{
            self.data.id = 0
        }
    }
    
}
