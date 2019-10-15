//
//  UIKit+Extension.swift
//
//  Created by ZhangXun on 2018/4/23.
//

import UIKit
import CoreText

protocol RegisterCellFromNib {}
protocol Nibloadable {}


extension UIButton {
    //导航栏按钮样式
    func navButtonType(_ title:String){
        self.setTitle(title, for: UIControl.State.normal)
        self.titleLabel?.font = .font15
        self.setTitleColor(UIColor.color666, for: UIControl.State.normal)
        self.sizeToFit()
    }
    //导航栏按钮
    static func navButton(_ title:String)->UIButton{
        let btn = UIButton()
        btn.navButtonType(title)
        return btn
    }
}

//XIB加载view
extension Nibloadable where Self : UIView{
    static func loadNib(_ nibNmae :String? = nil) -> Self{
        return Bundle.main.loadNibNamed(nibNmae ?? "\(self)", owner: nil, options: nil)?.first as! Self
    }
}

extension UIView {
    func clearAll(){
        self.subviews.forEach({
            $0.removeFromSuperview()
        })
    }
}

extension RegisterCellFromNib {
    static var identifier: String { return "\(self)" }
    static var nib: UINib? { return UINib(nibName: "\(self)", bundle: nil) }
}

// MARK:extension UITableView
extension UITableView {
    /// 注册 cell 的方法
    func x_registerCell<T: UITableViewCell>(cell: T.Type) where T: RegisterCellFromNib {
        if let nib = T.nib { register(nib, forCellReuseIdentifier: T.identifier) }
        else { register(cell, forCellReuseIdentifier: T.identifier) }
    }
    
    /// 从缓存池池出队已经存在的 cell
    func x_dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T where T: RegisterCellFromNib {
        return dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as! T
    }
}

// MARK:extension UIFont
extension UIFont {
    
    static var font9:UIFont{
        return UIFont.systemFont(ofSize: 9)
    }
    
    static var font10:UIFont{
        return UIFont.systemFont(ofSize: 10)
    }
    
    static var font11:UIFont{
        return UIFont.systemFont(ofSize: 11)
    }
    
    static var font12:UIFont{
        return UIFont.systemFont(ofSize: 12)
    }
    
    static var font13:UIFont{
        return UIFont.systemFont(ofSize: 13)
    }
    
    static var font14:UIFont{
        return UIFont.systemFont(ofSize: 14)
    }
    
    static var font15:UIFont{
        return UIFont.systemFont(ofSize: 15)
    }
    
    static var font16:UIFont{
        return UIFont.systemFont(ofSize: 16)
    }
    
    static var font17:UIFont{
        return UIFont.systemFont(ofSize: 17)
    }
    
    static var font18:UIFont{
        return UIFont.systemFont(ofSize: 18)
    }
    
    static var font19:UIFont{
        return UIFont.systemFont(ofSize: 19)
    }
    
    static var font20:UIFont{
        return UIFont.systemFont(ofSize: 20)
    }
    
    static var font21:UIFont{
        return UIFont.systemFont(ofSize: 21)
    }
    
    static var font22:UIFont{
        return UIFont.systemFont(ofSize: 22)
    }
    
    static var font23:UIFont{
        return UIFont.systemFont(ofSize: 23)
    }
    
    static var font24:UIFont{
        return UIFont.systemFont(ofSize: 24)
    }
    
    static var font25:UIFont{
        return UIFont.systemFont(ofSize: 25)
    }
    
}

// MARK:extension UIColor
extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1.0) {
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
    }

    convenience init(c: CGFloat,  alpha: CGFloat = 1.0) {
        self.init(red: c/255.0, green: c/255.0, blue: c/255.0, alpha: alpha)
    }
    
    func getRGB() -> (CGFloat,CGFloat,CGFloat) {
        var r : CGFloat = 0
        var g : CGFloat = 0
        var b : CGFloat = 0
        if self.getRed(&r, green: &g, blue: &b, alpha: nil){
            return (r * 255,g * 255,b * 255)
        }
        guard let cmps = cgColor.components else {
            fatalError("请使用RGB创建UIColor")
        }
        return(cmps[0] * 255,cmps[1] * 255,cmps[2] * 255)
    }
    
    @nonobjc public static func hexColor(_ value: UInt32) -> UIColor {
        let r = CGFloat((value & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((value & 0xFF00) >> 8) / 255.0
        let b = CGFloat((value & 0xFF)) / 255.0
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
    
    @nonobjc public static func hexColor(_ value: String) -> UIColor {
        let scanner:Scanner = Scanner(string:value)
        var valueRGB:UInt32 = 0
        if scanner.scanHexInt32(&valueRGB) == false {
            return UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        }else{
            return UIColor(red: CGFloat((valueRGB & 0xFF0000)>>16)/255.0, green: CGFloat((valueRGB & 0x00FF00)>>8)/255.0, blue:CGFloat(valueRGB & 0x0000FF)/255.0, alpha: CGFloat(1.0))
        }
    }
    @nonobjc public static func hexColor(_ value: String, alpha: CGFloat) -> UIColor {
        let scanner:Scanner = Scanner(string:value)
        var valueRGB:UInt32 = 0
        if scanner.scanHexInt32(&valueRGB) == false {
            return UIColor(red: 0, green: 0, blue: 0, alpha: alpha)
        }else{
            return UIColor(red: CGFloat((valueRGB & 0xFF0000)>>16)/255.0, green: CGFloat((valueRGB & 0x00FF00)>>8)/255.0, blue:CGFloat(valueRGB & 0x0000FF)/255.0, alpha: alpha)
        }
    }
    class var randColor: UIColor {
        get {
            let red = CGFloat(arc4random()%256)/255.0
            let green = CGFloat(arc4random()%256)/255.0
            let blue = CGFloat(arc4random()%256)/255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
    
    static var color000:UIColor{
        return .hexColor("000000")
    }
    
    static var color333:UIColor{
        return .hexColor("333333")
    }
    
    static var color666:UIColor{
        return .hexColor("666666")
    }
    
    static var color999:UIColor{
        return .hexColor("999999")
    }
    
    static var colord6:UIColor{
        return .hexColor("d6d6d6")
    }
    
    static var colord2:UIColor{
        return .hexColor("d2d2d2")
    }
    
    static var colorOrange:UIColor{
        return .hexColor("fdb42c")
    }
    
    static var colorWhite:UIColor{
        return .hexColor("ffffff")
    }
    
    static var colorRed:UIColor{
        return .hexColor("ff0000")
    }
    
    static var colorGreen:UIColor{
        return .hexColor("09bb07")
//        return .hexColor("34cf71")
    }
    
    static var colorBlue:UIColor{
        return .hexColor("2f8cff")
    }
    
    static var colord0:UIColor{
        return .hexColor("d0d0d0")
    }
    ///线条颜色
    static var colorLine:UIColor{
        return .hexColor("e4e4e4")
    }
    
    ///触摸颜色
    static var colorTouch:UIColor{
        return .hexColor("e5e5e5")
    }
    
    ///背景颜色
    static var colorBg:UIColor{
        return .hexColor("f3f5fa")
    }
}


extension UIImage {
    
    static func imageColor(_ color: String) -> UIImage{
        return UIImage.init(color: UIColor.hexColor(color))!
    }
    
    static func imageColor(_ color: UIColor) -> UIImage{
        return UIImage.init(color: color)!
    }
    
    public convenience init?(color: UIColor, size: CGSize? = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size!)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
    
//    public convenience init?(colorString: String, size: CGSize? = CGSize(width: 1, height: 1)) {
//        let rect = CGRect(origin: CGPoint.zero, size: size!)
//        let co = UIColor(colorString)
//        co.setFill()
//        UIRectFill(rect)
//        let image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        
//        guard let cgImage = image?.cgImage else { return nil }
//        self.init(cgImage: cgImage)
//        
//    }
    
    public static func pixel(ofColor color: UIColor) -> UIImage {
        let pixel = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        
        UIGraphicsBeginImageContext(pixel.size)
        defer { UIGraphicsEndImageContext() }
        
        guard let context = UIGraphicsGetCurrentContext() else { return UIImage() }
        
        context.setFillColor(color.cgColor)
        context.fill(pixel)
        
        return UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
    }
    
    public func largestCenteredSquareImage() -> UIImage {
        let scale = self.scale
        
        let originalWidth  = self.size.width * scale
        let originalHeight = self.size.height * scale
        
        let edge: CGFloat
        if originalWidth > originalHeight {
            edge = originalHeight
        } else {
            edge = originalWidth
        }
        
        let posX = (originalWidth  - edge) / 2.0
        let posY = (originalHeight - edge) / 2.0
        
        let cropSquare = CGRect(x: posX, y: posY, width: edge, height: edge)
        
        let imageRef = self.cgImage?.cropping(to: cropSquare)!
        
        return UIImage(cgImage: imageRef!, scale: scale, orientation: self.imageOrientation)
    }
    public func resizeToTargetSize(_ targetSize: CGSize) -> UIImage {
        let size = self.size
        
        let widthRatio  = targetSize.width  / self.size.width
        let heightRatio = targetSize.height / self.size.height
        
        let scale = UIScreen.main.scale
        let newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: scale * floor(size.width * heightRatio), height: scale * floor(size.height * heightRatio))
        } else {
            newSize = CGSize(width: scale * floor(size.width * widthRatio), height: scale * floor(size.height * widthRatio))
        }
        
        let rect = CGRect(x: 0, y: 0, width: floor(newSize.width), height: floor(newSize.height))
        
        //println("size: \(size), newSize: \(newSize), rect: \(rect)")
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    public static func convertLayerToImage(_ layer: CALayer) -> UIImage? {
        let s = layer.bounds.size
        UIGraphicsBeginImageContextWithOptions(s, true, UIScreen.main.scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

extension UILabel{
    ///新的label
    static func newLabel(_ value:String="", _ color:UIColor=UIColor.black, _ font:UIFont=UIFont.font12)->UILabel{
        let label = UILabel()
        label.text=value
        label.textColor=color
        label.font=font
        return label
    }
    ///带*的label
    static func newSnowLabel(_ value:String="", _ color:UIColor=UIColor.black, _ font:UIFont=UIFont.font12)->UILabel{
        let label = self.newLabel(value, color, font)
        let str1="*"
        let rowAttr = NSMutableAttributedString()//初始化
        let rowStr1 : NSAttributedString = NSAttributedString(string: str1,attributes: [.foregroundColor : UIColor.colorRed])
        let rowStr2 : NSAttributedString = NSAttributedString(string: value)
        rowAttr.append(rowStr1)
        rowAttr.append(rowStr2)
        label.attributedText = rowAttr
        return label
    }
    
    ///添加*的label
    static func addSnow(_ label:UILabel){
        let str1="*"
        let rowAttr = NSMutableAttributedString()//初始化
        let rowStr1 : NSAttributedString = NSAttributedString(string: str1,attributes: [.foregroundColor : UIColor.colorRed])
        let rowStr2 : NSAttributedString = NSAttributedString(string: label.text ?? "")
        rowAttr.append(rowStr1)
        rowAttr.append(rowStr2)
        label.attributedText = rowAttr
    }
    
    //添加图片
    func addImage(_ image:String){
        let labAttr = NSMutableAttributedString()//初始化
        let textAttach:NSTextAttachment=NSTextAttachment()
        textAttach.image=UIImage.init(named: image)
        textAttach.bounds = CGRect(x: 0, y: -3, width: 13, height: 13)
        let textAtt0 : NSAttributedString = NSAttributedString(string: " \(self.text ?? "")",attributes: [.foregroundColor : self.textColor])
        let imgAtt = NSAttributedString(attachment: textAttach)
        labAttr.append(imgAtt)
        labAttr.append(textAtt0)
        self.attributedText=labAttr
        self.sizeToFit()
    }
    
    func addSnow(){
        UILabel.addSnow(self)
    }
    
    ///tab显示内容Label
    func tabContentLabel(_ str0:String="", _ str1:String="", _ str2:String=""){
        let rowAttr = NSMutableAttributedString()//初始化
        let rowStr0 : NSAttributedString = NSAttributedString(string: str0,attributes: [.foregroundColor : UIColor.color333])
        let rowStr1 : NSAttributedString = NSAttributedString(string: str1,attributes: [.foregroundColor : UIColor.colorRed, .font:UIFont.boldSystemFont(ofSize: 18)])
        let rowStr2 : NSAttributedString = NSAttributedString(string: str2,attributes: [.foregroundColor : UIColor.color666, .font:UIFont.systemFont(ofSize: 12)])
        rowAttr.append(rowStr0)
        rowAttr.append(rowStr1)
        rowAttr.append(rowStr2)
        self.attributedText = rowAttr
    }
    
    ///添加•的label
    static func addCircle(_ label:UILabel, _ color:UIColor=UIColor.colorRed){
        //        let label = self.newLabel(value, color, font)
        let str1="• "
        let rowAttr = NSMutableAttributedString()//初始化
        let rowStr1 : NSAttributedString = NSAttributedString(string: str1,attributes: [.foregroundColor : color])
        let rowStr2 : NSAttributedString = NSAttributedString(string: label.text ?? "")
        rowAttr.append(rowStr1)
        rowAttr.append(rowStr2)
        label.attributedText = rowAttr
    }
}

//MARK: - UIDevice延展
//https://www.theiphonewiki.com/wiki/Models#iPhone
public extension UIDevice {
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        switch identifier {
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":               return "iPhone 4"
        case "iPhone4,1":                                         return "iPhone 4s"
        case "iPhone5,1":                                         return "iPhone 5"
        case "iPhone5,2":                                         return "iPhone 5 (GSM+CDMA)"
        case "iPhone5,3":                                         return "iPhone 5c (GSM)"
        case "iPhone5,4":                                         return "iPhone 5c (GSM+CDMA)"
        case "iPhone6,1":                                         return "iPhone 5s (GSM)"
        case "iPhone6,2":                                         return "iPhone 5s (GSM+CDMA)"
        case "iPhone7,2":                                         return "iPhone 6"
        case "iPhone7,1":                                         return "iPhone 6 Plus"
        case "iPhone8,1":                                         return "iPhone 6s"
        case "iPhone8,2":                                         return "iPhone 6s Plus"
        case "iPhone8,4":                                         return "iPhone SE"
        case "iPhone9,1", "iPhone9,3":                         return "iPhone 7"
        case "iPhone9,2", "iPhone9,4":                         return "iPhone 7Plus"
        case "iPhone10,1","iPhone10,4":                           return "iPhone 8"
        case "iPhone10,2","iPhone10,5":                           return "iPhone 8 Plus"
        case "iPhone10,3","iPhone10,6":                           return "iPhone X"
        case "iPhone11,2":                                          return "iPhone XS"
        case "iPhone11,4","iPhone11,6":                           return "iPhone XSMAX"
        case "iPhone11,8":                                   return "iPhone XR"
        case "i386", "x86_64":                                    return "Simulator"
        default:  return identifier
        }
        
    }
    
}


class PaddingLabel: UILabel {
    
    var textInsets: UIEdgeInsets = .zero
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textInsets))
    }
    
    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        let insets = textInsets
        var rect = super.textRect(forBounds: bounds.inset(by: insets),
                                  limitedToNumberOfLines: numberOfLines)
        
        rect.origin.x -= insets.left
        rect.origin.y -= insets.top
        rect.size.width += (insets.left + insets.right)
        rect.size.height += (insets.top + insets.bottom)
        return rect
    }
    
}
