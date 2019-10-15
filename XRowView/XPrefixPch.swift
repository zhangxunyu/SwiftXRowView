//
//  xPrefixPch.swift
//  MangoManager
//
//  Created by FD on 2017/5/8.
//  Copyright © 2017年 AD. All rights reserved.
//

import Foundation
import UIKit

/**设备*/
let IS_IPAD:Bool = (UIDevice.current.userInterfaceIdiom==UIUserInterfaceIdiom.pad)
let IS_IPHONE:Bool = (UIDevice.current.userInterfaceIdiom==UIUserInterfaceIdiom.phone)
let IS_IPHONE4:Bool = (kScreenHeight<568.0 && IS_IPHONE)
let IS_IPHONE5:Bool = (kScreenHeight==568.0 && IS_IPHONE)
let IS_IPHONE6:Bool = (kScreenHeight==667.0 && IS_IPHONE)
let IS_IPHONEP:Bool = (kScreenHeight==736.0 && IS_IPHONE)
let IS_IPHONEX:Bool = (kScreenHeight>=812.0 && IS_IPHONE)
let SystemVersion = UIDevice.current.systemVersion
let IS_IOS11 = (Float((SystemVersion as NSString).substring(with: NSMakeRange(0, 2)))! >= 11)
let kScreenWidth:CGFloat = UIScreen.main.bounds.width
let kScreenHeight:CGFloat = UIScreen.main.bounds.height
let kStatusHeight:CGFloat = CGFloat(UIApplication.shared.statusBarFrame.height)
let kHomeHeight:CGFloat = IS_IPHONEX ? 34 : 0
let kTabHeight:CGFloat = 49
let kTabHomeHeight:CGFloat = kTabHeight+kHomeHeight
let kNavHeight:CGFloat = 44
let kStatusNavHeight = kStatusHeight+kNavHeight
let kNavbarHeight:CGFloat = 64
let kTitleHeight:CGFloat = 40
let kCellHeight:CGFloat = 44
let kTwoRowHeight:CGFloat = 65
let kSectionHeight:CGFloat = 35
let kSubmitBtnHeight: CGFloat = 50

/**间距*/
let kHugInner:CGFloat = 30
let kSupInner:CGFloat = 25
let kBigInner:CGFloat = 20
let kMidInner:CGFloat = 15
let kSmlInner:CGFloat = 10
let kMinInner:CGFloat = 5
/**边线粗细*/
let kLineStroke:CGFloat = 0.6

/**色值*/
let k00Color = UIColor.color000
let k33Color = UIColor.color333
let k66Color = UIColor.color666
let k99Color = UIColor.color999
let kd6Color = UIColor.colord6
let kOrangeColor = UIColor.colorOrange
let kWhiteColor = UIColor.colorWhite
let kRedColor = UIColor.colorRed
let kGreenColor = UIColor.colorGreen
let kBlueColor = UIColor.colorBlue
let kNavBlueColor = UIColor(r: 47, g: 140, b: 250, alpha: 0.91)
let kLineColor = UIColor.colorLine
let kTouchColor = UIColor.colorTouch
let kBgColor  = UIColor.colorBg
let kd0Color = UIColor.colord0
let kCyanBgColor = UIColor.hexColor("34cf71")
/**字体*/
let kFont9 = UIFont.font9
let kFont10 = UIFont.font10
let kFont11 = UIFont.font11
let kFont12 = UIFont.font12
let kFont13 = UIFont.font13
let kFont14 = UIFont.font14
let kFont15 = UIFont.font15
let kFont16 = UIFont.font16
let kFont17 = UIFont.font17
let kFont18 = UIFont.font18
let kFont19 = UIFont.font19
let kFont20 = UIFont.font20
let kFont21 = UIFont.font21
let kFont22 = UIFont.font22
let kFont23 = UIFont.font23
let kFont24 = UIFont.font24
let kFont25 = UIFont.font25

func ZXAddLabel(title t:String, color c:UIColor, size s:CGFloat)->UILabel {
    return UILabel.newLabel(t,c,UIFont.systemFont(ofSize: s))
}


