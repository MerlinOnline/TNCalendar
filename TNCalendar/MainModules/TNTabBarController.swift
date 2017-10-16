//
//  TNTabBarController.swift
//  TNCalendar
//
//  Created by merrill on 2017/9/8.
//  Copyright © 2017年 merrill. All rights reserved.
//

import UIKit

class TNTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        self.tabBar.isTranslucent = false
        self.tabBar.tintColor = UIColorFromRGB(rgbValue:0x222222)      // 选中色
        self.tabBar.barTintColor = UIColorFromRGB(rgbValue: 0xEFEFF4)  // 背景色
        self.edgesForExtendedLayout = []
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
