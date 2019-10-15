//
//  XRowTool.swift
//  YouLiZhiYu
//
//  Created by ZhangXun on 2018/11/9.
//  Copyright © 2018年 AD. All rights reserved.
//

import UIKit

class XRowTool {
    //添加图片
    static func addIcon(_ lab:UILabel, _ image:String){
        let labAttr = NSMutableAttributedString()//初始化
        let textAttach:NSTextAttachment=NSTextAttachment()
        textAttach.image=UIImage.init(named: image)
        textAttach.bounds = CGRect(x: 0, y: -4, width: 20, height: 20)
        let imgAtt = NSAttributedString(attachment: textAttach)
        let borderAtt : NSAttributedString = NSAttributedString(string: "1",attributes: [.foregroundColor : UIColor.clear])
        let textAtt : NSAttributedString = NSAttributedString(string: lab.text ?? "",attributes: [.foregroundColor : lab.textColor])
        labAttr.append(imgAtt)
        labAttr.append(borderAtt)
        labAttr.append(textAtt)
        lab.attributedText=labAttr
        lab.sizeToFit()
    }
    
    static func formatTitle(_ lab:UILabel, _ str1:String, _ str2:String){
        let rowAttr = NSMutableAttributedString()//初始化
        let rowStr1 : NSAttributedString = NSAttributedString(string: str1)
        let rowStr2 : NSAttributedString = NSAttributedString(string: str2, attributes: [.foregroundColor : UIColor.color999, .font:UIFont.font12])
        rowAttr.append(rowStr1)
        rowAttr.append(rowStr2)
        lab.attributedText = rowAttr
    }
}
