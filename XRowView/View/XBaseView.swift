//
//  XBaseView.swift
//  MangoManager
//
//  Created by A鱼 on 2018/1/9.
//  Copyright © 2018年 AD. All rights reserved.
//

import UIKit

class XBaseView: UIView, Nibloadable {
    
    typealias EventHandler = (_ tag:Int) -> Void
    var eventHandler:EventHandler?
    
//    var currVc:XBaseController!
    var isLayout=false
    
    
    var offsetY:CGFloat=0{
        didSet{
            frame=CGRect(x: self.x, y: originY+offsetY, width: self.width, height: self.height)
        }
    }
    var originY:CGFloat=0{
        didSet{
            frame=CGRect(x: self.x, y: originY+offsetY, width: self.width, height: self.height)
        }
    }
    
    
    open func autoLayout(_ time:Double=0){
        var last:XBaseView!
        UIView.animate(withDuration: time, animations: {
            self.subviews.forEach({
                if $0.isKind(of: XBaseView.self) {
                    if last != nil {
                        ($0 as! XBaseView).originY=last.bottom
                    }else{
                        ($0 as! XBaseView).originY=0
                    }
                    last=($0 as! XBaseView)
                }
            })
            if self.subviews.count>0{
                self.frame=CGRect(x: 0, y: self.y, width: kScreenWidth, height: (self.subviews.last?.bottom)!)
            }
        })
//        if currVc != nil {
//            currVc.viewDidLayoutSubviews()
//        }
    }
    
    override func layoutSubviews() {
        if !isLayout {return}
        autoLayout()
        super.layoutSubviews()
    }
    
    
    
}
