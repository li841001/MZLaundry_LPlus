//
//  Constants.swift
//  MZLaundry
//
//  Created by 李 jia on 15/10/12.
//  Copyright © 2015年 l+. All rights reserved.
//

import UIKit

struct AppFonts {
    static let HEITI_TC = "STHeitiTC-Light"
}
//扩展UIColor
extension UIColor {
    class func MZOrange() -> UIColor {
        let color = UIColor(red: 255.0 / 255.0, green: 77.0 / 255.0, blue: 15.0 / 255.0, alpha: 1.0)
        return color
    }
    
    class func MZBlueZhuyao() -> UIColor {
        let color = UIColor(red: 40.0 / 255.0, green: 204.0 / 255.0, blue: 252.0 / 255.0, alpha: 1.0)
        return color
    }
    
    class func MZBlueFuzhu() -> UIColor {
        let color = UIColor(red: 148.0 / 255.0, green: 231.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
        return color
    }
    
    class func MZBlueFenxian() -> UIColor {
        let color = UIColor(red: 120.0 / 255.0, green: 188.0 / 255.0, blue: 244.0 / 255.0, alpha: 1.0)
        return color
    }
    
    class func MZGoardblackgroud() -> UIColor {
        let color = UIColor(red: 241.0 / 255.0, green: 241.0 / 255.0, blue: 241.0 / 255.0, alpha: 1.0)
        return color
    }
    
    class func MZGoardBorder() -> UIColor {
        let color = UIColor(red: 211.0 / 255.0, green: 211.0 / 255.0, blue: 211.0 / 255.0, alpha: 1.0)
        return color
    }
    class func MZGoarldView() -> UIColor {
        let color = UIColor(red: 188.0 / 255.0, green: 189.0 / 255.0, blue: 195.0 / 255.0, alpha: 1.0)
        return color
    }
    
    class func MZGoarldFuzhu() -> UIColor {
        let color = UIColor(red: 88.0 / 255.0, green: 88.0 / 255.0, blue: 88.0 / 255.0, alpha: 1.0)
        return color
    }
    
    class func MZGoarldMain() -> UIColor {
        let color = UIColor(red: 30.0 / 255.0, green: 30.0 / 255.0, blue: 30.0 / 255.0, alpha: 1.0)
        return color
    }
    
}

//定义屏幕的宽高以及长宽比
struct Screen {
    static let ScreenSize = UIScreen.mainScreen().bounds
    static let autoSizeScaleX: CGFloat = UIScreen.mainScreen().bounds.width / 320
    static let autoSizeScaleY: CGFloat = UIScreen.mainScreen().bounds.height / 568
}

