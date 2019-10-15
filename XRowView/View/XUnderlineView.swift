//
//  XUnderlineView.swift
//  YouLiZhiYu
//
//  Created by ZhangXun on 2018/3/28.
//  Copyright © 2018年 AD. All rights reserved.
//  绘制一个view的下划线

import UIKit

class XUnderlineView: XBaseView {
    var color:UIColor=UIColor.colorLine
    var lineShape:CAShapeLayer!
    var isLine=true
    var border:CGFloat = 0
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addBottomLine()
    }
    
    func clearLine (){
        if self.lineShape != nil {
            lineShape.strokeColor=UIColor.clear.cgColor
        }
    }
    
    func addLine (){
        
        if self.lineShape != nil {
            lineShape.strokeColor = color.cgColor
        }
    }
    
    func addBottomLine(){
        clearLine()
        let lineWidth:CGFloat = kLineStroke
        //创建路径
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint.init(x: border, y: self.frame.size.height))
        linePath.addLine(to: CGPoint.init(x: self.frame.size.width-border, y: self.frame.size.height))
        lineShape = CAShapeLayer()
        lineShape.frame = CGRect.init(x: 0, y: 0, width: 350, height: 400)
        lineShape.lineWidth = lineWidth
        lineShape.lineJoin = CAShapeLayerLineJoin.miter
        lineShape.lineCap = CAShapeLayerLineCap.square
        if isLine {
            lineShape.strokeColor = color.cgColor
        }else{
            lineShape.strokeColor = UIColor.clear.cgColor
        }
        lineShape.path = linePath.cgPath
        lineShape.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(lineShape)
    }
}

