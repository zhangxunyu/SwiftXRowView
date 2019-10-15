//
//  XMidRowView.swift
//  YouLiZhiYu
//
//  Created by ZhangXun on 2018/9/14.
//  Copyright © 2018年 AD. All rights reserved.
//

import UIKit

class XMidRowView: XBaseView {
    @IBOutlet weak var title: UILabel!
    
    var data:XRowData!{
        didSet{
            title.text = data.title
            title.font = data.titleFont
            title.textColor =  data.titleColor
            backgroundColor = data.bgColor
            alpha = data.bgAlpha
        }
    }
    
    static func instance(_ data:XRowData)->XMidRowView{
        let view = XMidRowView.loadNib()
        view.data=data
        view.frame=CGRect(x: 0, y: 0, width: kScreenWidth, height: data.rowHeight)
        return view
    }
}
