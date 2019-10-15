//
//  XTwoLineView.swift
//  YouLiZhiYu
//
//  Created by ZhangXun on 2018/7/10.
//  Copyright © 2018年 AD. All rights reserved.
//  显示一行2列

/*用法
var arr:[XItemRowData]=[]
for _ in 0..<13{
    let data = XItemRowData()
    data.title="电视机"
    data.titleFont = .font12
    data.valueFont = .font12
    data.value="2323".float2RmbStr
    data.valueColor=UIColor.colorRed
    arr.append(data)
}
let view = XTwoLineView.instance(arr)
*/

import UIKit

class XTwoLineView: XBaseView {
    var border:CGFloat=0 //上下边距
    var lastView:XItemRowView!
    let itemHeight:CGFloat=15
    var data:[XItemRowData]=[] {
        didSet{
            for i in 0..<data.count{
                let line = i % 2
                let ele = data[i]
                ele.isline=false
                let itemView = XItemRowView.instance(ele)
                self.addSubview(itemView)
                
                if lastView == nil {
                    if line == 1{//右边的
                        itemView.frame=CGRect(x: kScreenWidth/2, y: self.border, width: kScreenWidth/2, height: itemHeight)
                    }else{//左边的
                        itemView.frame=CGRect(x: 0, y:  self.border, width: kScreenWidth/2, height: itemHeight)
                    }
                }else{
                    if line == 1{//右边的
                        itemView.frame=CGRect(x: kScreenWidth/2, y: lastView.bottom, width: kScreenWidth/2, height: itemHeight)
                    }else{//左边的
                        itemView.frame=CGRect(x: 0, y: lastView.bottom, width: kScreenWidth/2, height: itemHeight)
                    }
                    
                }
                if line == 1{
                    lastView=itemView
                }
                
            }
        }
    }

    static func instance(_ data:[XItemRowData], _ border:CGFloat=10)->XTwoLineView{
        let view = XTwoLineView()
        view.backgroundColor = .white
        view.border=border
        view.data=data
        let height = CGFloat((Double(data.count)/2.00).rounded()) * view.itemHeight+border*2
        view.frame=CGRect(x: 0, y: 0, width: kScreenWidth, height: height)
        let midLine = UIView()
        view.addSubview(midLine)
        midLine.backgroundColor=UIColor.colorBg
        midLine.frame=CGRect(x: kScreenWidth/2, y: border, width: kLineStroke, height: view.height-border*2)
        return view
    }
}
