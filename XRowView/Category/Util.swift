//
//  Util.swift
//  MangoManager
//
//  Created by AD on 2018/1/4.
//  Copyright © 2018年 AD. All rights reserved.
//

import Foundation
import UIKit

@objc extension UIView {
    
    var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    var centerX: CGFloat {
        get {
            return self.center.x
        }
        set {
            var center = self.center
            center.x = newValue
            self.center = center
        }
    }
    var centerY: CGFloat {
        get {
            return self.center.y
        }
        set {
            var center = self.center
            center.y = newValue
            self.center = center
        }
    }
    var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
    var size: CGSize {
        get {
            return self.frame.size
        }
        set {
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
    }
    
    var top: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame = CGRect(x: self.left, y: newValue, width: self.width, height: self.height)
        }
    }
    var left: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame = CGRect(x: newValue, y: self.top, width: self.width, height: self.height)
        }
    }
    var bottom: CGFloat {
        get {
            return self.y + self.height
        }
        set {
            self.frame = CGRect(x: self.left, y: newValue - self.height, width: self.width, height: self.height)
        }
    }
    var right: CGFloat {
        get {
            return self.x + self.width
        }
        set {
            self.frame = CGRect(x: newValue - self.width, y: self.top, width: self.width, height: self.height)
        }
    }
    
}

extension CGRect {
    var center: CGPoint {
        return CGPoint(x: midX, y: midY)
    }
    var bounds: CGRect {
        return CGRect(origin: .zero, size: size)
    }
//    init(center: CGPoint, size: CGSize) {
//        self.origin = center - size / 2
//        self.size = size
//    }
}
extension CGPoint {
    func translate(_ dx: CGFloat, dy: CGFloat) -> CGPoint {
        return CGPoint(x: self.x+dx, y: self.y+dy)
    }
    
    func transform(_ t: CGAffineTransform) -> CGPoint {
        return self.applying(t)
    }
    
    func distance(_ b: CGPoint) -> CGFloat {
        return sqrt(pow(self.x-b.x, 2)+pow(self.y-b.y, 2))
    }
}
func +(left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}
func += (left: inout CGPoint, right: CGPoint) {
    left.x += right.x
    left.y += right.y
}
func -(left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x - right.x, y: left.y - right.y)
}
func /(left: CGPoint, right: CGFloat) -> CGPoint {
    return CGPoint(x: left.x/right, y: left.y/right)
}
func *(left: CGPoint, right: CGFloat) -> CGPoint {
    return CGPoint(x: left.x*right, y: left.y*right)
}
func *(left: CGFloat, right: CGPoint) -> CGPoint {
    return right * left
}
func *(left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x*right.x, y: left.y*right.y)
}
prefix func -(point: CGPoint) -> CGPoint {
    return CGPoint.zero - point
}
func /(left: CGSize, right: CGFloat) -> CGSize {
    return CGSize(width: left.width/right, height: left.height/right)
}
func -(left: CGPoint, right: CGSize) -> CGPoint {
    return CGPoint(x: left.x - right.width, y: left.y - right.height)
}

prefix func -(inset: UIEdgeInsets) -> UIEdgeInsets {
    return UIEdgeInsets(top: -inset.top, left: -inset.left, bottom: -inset.bottom, right: -inset.right)
}
