//
//  XTwoItemView.swift
//  YouLiZhiYu
//
//  Created by ZhangXun on 2018/7/9.
//  Copyright © 2018年 AD. All rights reserved.
//  1行显示2条  最后1行单个显示整行

import UIKit

class XTwoItemView: XBaseView {
    typealias InputBeginEventHandler = (_ tag:Int) -> Void
    var inputBeginEventHandler:InputBeginEventHandler?
    typealias InputEndEventHandler = (_ tag:Int) -> Void
    var inputEndEventHandler:InputEndEventHandler?
    typealias InputChangeEventHandler = (_ tag:Int) -> Void
    var inputChangeEventHandler:InputChangeEventHandler?
    var lastView:XItemRowView!
    var botView:XItemRowView!
    var isLast=false //最后一行是否显示底部线条
    var data:[XItemRowData]=[] {
        didSet{
            let totRow = data.count / 2 //总行数
            for i in 0..<data.count{
                let line = i % 2
                let ele = data[i]
                ele.isline=false
                ele.index=i
                let itemView = XItemRowView.instance(ele)
                itemView.inputBeginEventHandler = {(tag) in
                    if self.inputBeginEventHandler != nil {
                        self.inputBeginEventHandler!(tag)
                    }
                }
                itemView.inputEndEventHandler = {(tag) in
                    if self.inputEndEventHandler != nil {
                        self.inputEndEventHandler!(tag)
                    }
                }
                itemView.inputChangeEventHandler = {(tag) in
                    if self.inputChangeEventHandler != nil {
                        self.inputChangeEventHandler!(tag)
                    }
                }
                itemView.eventHandler = {(tag) in
                    if self.eventHandler != nil{
                        self.eventHandler!(tag)
                    }
                }
                self.addSubview(itemView)
                let curRow = Int((i+1) / 2) //当前行
                if lastView == nil {
                    if line == 1{//右边的
                        itemView.frame=CGRect(x: kScreenWidth/2, y: 0, width: kScreenWidth/2, height: itemView.height)
                        let botLine = UIView()
                        itemView.addSubview(botLine)
                        botLine.backgroundColor=UIColor.colorBg
                        botLine.frame=CGRect(x: 0, y: itemView.height-kLineStroke, width: itemView.width-kMidInner, height: kLineStroke)
                        if curRow == totRow{
//                            botLine.isHidden = !self.isLast
                        }
                    }else{//左边的
                        let botLine = UIView()
                        itemView.addSubview(botLine)
                        botLine.backgroundColor=UIColor.colorBg
                        botLine.frame=CGRect(x: kMidInner, y: itemView.height-kLineStroke, width: itemView.width-kMidInner, height: kLineStroke)
                        let midLine = UIView()
                        itemView.addSubview(midLine)
                        midLine.backgroundColor=UIColor.colorBg
                        let midHeight:CGFloat=15
                        midLine.frame=CGRect(x: kScreenWidth/2-kLineStroke, y: (itemView.height-midHeight)/2, width: kLineStroke, height: midHeight)
                        if i == data.count-1{//最后一个显示整行
                            itemView.frame=CGRect(x: 0, y: 0, width: kScreenWidth, height: itemView.height)
                            midLine.isHidden=true
                            botLine.isHidden=true
                        }else{
                            itemView.frame=CGRect(x: 0, y: 0, width: kScreenWidth/2, height: itemView.height)
                        }
                    }
                    
                }else{
                    if line == 1{//右边的
                        itemView.frame=CGRect(x: kScreenWidth/2, y: lastView.bottom, width: kScreenWidth/2, height: itemView.height)
                        let botLine = UIView()
                        itemView.addSubview(botLine)
                        botLine.backgroundColor=UIColor.colorBg
                        botLine.frame=CGRect(x: 0, y: itemView.height-kLineStroke, width: itemView.width-kMidInner, height: kLineStroke)
                        if curRow == totRow{
//                            botLine.isHidden = !self.isLast
                        }
                    }else{//左边的
                        let botLine = UIView()
                        itemView.addSubview(botLine)
                        botLine.backgroundColor=UIColor.colorBg
                        botLine.frame=CGRect(x: kMidInner, y: itemView.height-kLineStroke, width: itemView.width-kMidInner, height: kLineStroke)
                        
                        let midLine = UIView()
                        itemView.addSubview(midLine)
                        midLine.backgroundColor=UIColor.colorBg
                        let midHeight:CGFloat=15
//                        midLine.frame=CGRect(x: itemView.width-kLineStroke, y: (itemView.height-midHeight)/2, width: kLineStroke, height: midHeight)
                        midLine.frame=CGRect(x: kScreenWidth/2-kLineStroke, y: (itemView.height-midHeight)/2, width: kLineStroke, height: midHeight)
                        if i == data.count-1{//最后一个显示整行
                            itemView.frame=CGRect(x: 0, y: lastView.bottom, width: kScreenWidth, height: itemView.height)
                            midLine.isHidden=true
                             botLine.isHidden=true
                        }else{
                            itemView.frame=CGRect(x: 0, y: lastView.bottom, width: kScreenWidth/2, height: itemView.height)
                        }
                    }
                    
                }
                if line == 1{
                    lastView=itemView
                }
                botView=itemView
            }
        }
    }
    
    ///重新加载数据
    func reloadData(_ data:[XItemRowData]){
        var i=0
        self.subviews.forEach {
            ($0 as! XItemRowView).reloadData(data[i])
            data[i].index=i
            i = i+1
        }
    }
    
    ///刷新当前row数据
    func reloadRowData(_ index:Int){
        let rowView = self.subviews[index] as! XItemRowView
        rowView.reloadData(self.data[index])
    }
    
    var currentRowData:XItemRowData!{
        didSet{
            let rowView = self.subviews[currentRowData.index] as! XItemRowView
            rowView.reloadData(currentRowData)
        }
    }
    
    ///当前块的数据获取
    func backData()->[XItemRowData]{
        var data:[XItemRowData]=[]
        self.subviews.forEach {
            data.append(($0 as! XItemRowView).backData)
        }
        return data
    }
    
    static func instance(_ data:[XItemRowData], _ isLast:Bool=false)->XTwoItemView{
        let view = XTwoItemView()
        view.isLast = isLast
        view.data=data
        if view.botView != nil{
            view.frame=CGRect(x: 0, y: 0, width: kScreenWidth, height: view.botView.bottom)
        }
        return view
    }
    
}
