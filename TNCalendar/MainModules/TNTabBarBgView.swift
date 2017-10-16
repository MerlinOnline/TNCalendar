//
//  TNTabBarBgView.swift
//  TNCalendar
//
//  Created by merrill on 2017/10/16.
//  Copyright © 2017年 merrill. All rights reserved.
//

import UIKit

class TNTabBarBgView: UIView {

    var themeColor : UIColor?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clear
        themeColor = UIColor.white
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    public func setViewThemeColor( color : UIColor) {
        if color == themeColor {
            return;
        }
        
        themeColor = color
        self.setNeedsDisplay()

    }
    
    override func draw(_ rect: CGRect) {
        let color = themeColor!
        color.set()
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 20))
        path.addLine(to: CGPoint(x: frame.size.width/2 - 20, y: 20))
        path.lineWidth = 3
        path.lineCapStyle = CGLineCap.round
        path.lineJoinStyle = CGLineJoin.round
        path.addQuadCurve(to: CGPoint(x: frame.size.width/2 + 20, y: 20), controlPoint: CGPoint(x: frame.size.width/2, y: 4))
        path.addLine(to: CGPoint(x: frame.size.width, y: 20))
        path.addLine(to: CGPoint(x: frame.size.width, y: frame.size.height))
        path.addLine(to: CGPoint(x: 0, y: frame.size.height))
        path.fill()
        
    }
}
