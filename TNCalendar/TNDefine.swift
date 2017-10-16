//
//  TNDefine.swift
//  TNCalendar
//
//  Created by merrill on 2017/9/8.
//  Copyright © 2017年 merrill. All rights reserved.
//

import Alamofire
import Refresher
import GearRefreshControl

import UIKit

class TNDefine: NSObject {
    
}


public let kScreenWidth  = UIScreen.main.bounds.size.width
public let kScreenHeight = UIScreen.main.bounds.size.height
public let kScreenScale  = UIScreen.main.bounds.size.width/375.0
public let kNaviHeight   = UIApplication.shared.statusBarFrame.size.height + 44
public let kNaviCenterY  = UIApplication.shared.statusBarFrame.size.height + 22
public let kTabBarHeight  = IS_Iphone_X ? 49 + 34 : 49;


public let IS_Iphone_4  = kScreenHeight == 480 ? true : false
public let IS_Iphone_5  = kScreenHeight == 568 ? true : false
public let IS_Iphone_6  = kScreenHeight == 667 ? true : false
public let IS_Iphone_6P = kScreenHeight == 960 ? true : false
public let IS_Iphone_X  = kScreenHeight == 812 ? true : false

public func UIColorFromRGB(rgbValue: UInt) -> UIColor {
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

public func UIColorFromRGBA(rgbValue: UInt , alphaVaue : UInt) -> UIColor {
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(alphaVaue)
    )
}

public func UIImageWithColor(imageColor : UIColor) -> UIImage{
    var image = UIImage()
    let rect = CGRect(origin: CGPoint(x:0,y:0), size: CGSize(width: 1.0, height: 1.0))
    UIGraphicsBeginImageContext(rect.size);
    let context = UIGraphicsGetCurrentContext()
    context!.setFillColor(imageColor.cgColor);
    context!.fill(rect);
    image = UIGraphicsGetImageFromCurrentImageContext()!;
    UIGraphicsEndImageContext();
    
    return image
}





