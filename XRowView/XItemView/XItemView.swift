//
//  XItemView.swift
//  YouLiZhiYu
//
//  Created by ZhangXun on 2018/7/6.
//  Copyright © 2018年 AD. All rights reserved.
//  一个块

import UIKit

class XItemView: XBaseView {
    typealias InputBeginEventHandler = (_ tag:Int) -> Void
    var inputBeginEventHandler:InputBeginEventHandler?
    typealias InputEndEventHandler = (_ tag:Int) -> Void
    var inputEndEventHandler:InputEndEventHandler?
    typealias InputChangeEventHandler = (_ tag:Int) -> Void
    var inputChangeEventHandler:InputChangeEventHandler?
    var isLast=false //最后一行是否显示底部线条
    var data:[XItemRowData]=[]
    
    static func instance(_ data:[XItemRowData], _ isLast:Bool=false)->XItemView{
        let view = XItemView()
        view.isLast=isLast
        view.data=data
        view.showView()
        view.autoLayout()
        return view
    }
    
    private func showView(){
        for i in 0..<data.count{
            let ele = data[i]
            if i == (data.count-1){//最后一行不显示线条
                ele.isline=isLast
            }
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
        }
    }
    
    ///重新加载数据
    func reloadData(_ data:[XItemRowData]=[]){
        var curData=data
        if curData.count==0{
            curData=self.data
        }else{
            self.data=curData
        }
        var i=0
        self.subviews.forEach {
            ($0 as! XItemRowView).reloadData(self.data[i])
            self.data[i].index=i
            i = i+1
        }
    }
    
    ///刷新当前row数据
    func reloadRowData(_ index:Int){
        let rowView = self.subviews[index] as! XItemRowView
        rowView.reloadData(self.data[index])
    }
    
    ///当前块的数据获取
    func backData()->[XItemRowData]{
        var data:[XItemRowData]=[]
        self.subviews.forEach {
            data.append(($0 as! XItemRowView).backData)
        }
        return data
    }
}
