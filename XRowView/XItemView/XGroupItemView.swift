//
//  XGroupItemView.swift
//  YouLiZhiYu
//
//  Created by ZhangXun on 2018/7/6.
//  Copyright © 2018年 AD. All rights reserved.
//  分组

import UIKit

class XGroupItemView: XBaseView {
    var data:[[XItemRowData]]=[]
    typealias InputBeginEventHandler = (_ section:Int, _ row:Int) -> Void
    var inputBeginEventHandler:InputBeginEventHandler?
    typealias InputEndEventHandler = (_ section:Int, _ row:Int) -> Void
    var inputEndEventHandler:InputEndEventHandler?
    typealias InputChangeEventHandler = (_ section:Int, _ row:Int) -> Void
    var inputChangeEventHandler:InputChangeEventHandler?
    typealias GroupEventHandler = (_ section:Int, _ row:Int) -> Void
    var groupEventHandler:GroupEventHandler?
    var section:CGFloat=10
    
    static func instance(_ data:[[XItemRowData]])->XGroupItemView{
        let view = XGroupItemView()
        view.data=data
        view.showView()
        view.autoLayout()
        return view
    }
    
     func showView(){
        for i in 0..<data.count{
            let ele = data[i]
            let itemsView =  XItemView.instance(ele)
            itemsView.inputBeginEventHandler = {(index) in
                if self.inputBeginEventHandler != nil {
                    self.inputBeginEventHandler!(i, index)
                }
            }
            itemsView.inputEndEventHandler = {(index) in
                if self.inputEndEventHandler != nil {
                    self.inputEndEventHandler!(i, index)
                }
            }
            itemsView.inputChangeEventHandler = {(index) in
                if self.inputChangeEventHandler != nil {
                    self.inputChangeEventHandler!(i, index)
                }
            }
            itemsView.eventHandler = {(index) in
                if self.groupEventHandler != nil{
                    self.groupEventHandler!(i, index)
                }
            }
            if i > 0{
                itemsView.offsetY=section
            }
            self.addSubview(itemsView)
        }
    }
    
    ///重新加载数据
    func reloadData(_ data:[[XItemRowData]]=[]){
        var curData = data
        if curData.isEmpty {
            curData=self.data
        }else{
            self.data=curData
        }
        var i=0
        self.subviews.forEach {
            ($0 as! XItemView).reloadData(self.data[i])
            i = i+1
        }
    }
    
    ///刷新当前row数据
    func reloadRowData(_ section:Int, _ row:Int){
        (self.subviews[section] as! XItemView).reloadRowData(row)
    }
    
    ///当前组的数据获取
    func backData()->[[XItemRowData]]{
        var data:[[XItemRowData]]=[]
        self.subviews.forEach {
            data.append(($0 as! XItemView).backData())
        }
        return data
    }
    
}
