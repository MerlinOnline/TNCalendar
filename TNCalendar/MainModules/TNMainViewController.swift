//
//  TNMainViewController.swift
//  TNCalendar
//
//  Created by merrill on 2017/9/8.
//  Copyright © 2017年 merrill. All rights reserved.
//

import UIKit

class TNMainViewController: TNBaseViewController , UITabBarControllerDelegate {

    var xTabBarController : TNTabBarController?
    var xHomeViewController : TNHomeViewController?
    var xDiscoverViewController : TNDiscoverViewController?
    var xMomentViewController : TNMomentViewController?
    var xMeViewController : TNMeViewController?
    var xChallengeViewController : TNChallengeViewController?
    
    var colorView : TNTabBarBgView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.edgesForExtendedLayout = []
        
        self.setupTabBar()
        self.setupTabBarVC()
        
    }
    
    func setupTabBar() {
        
        xTabBarController = TNTabBarController()
        xTabBarController?.view.frame = self.view.bounds
        xTabBarController?.delegate = self
        self.addChildViewController(xTabBarController!)
        self.view.addSubview((xTabBarController?.view)!)
        
        xTabBarController?.tabBar.backgroundImage = UIImage()
        xTabBarController?.tabBar.shadowImage = UIImage()
        xTabBarController?.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColorFromRGB(rgbValue: 0x222222)], for: UIControlState.normal)
        xTabBarController?.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColorFromRGB(rgbValue: 0x222222)], for: UIControlState.selected)
        
        let blurView = UIVisualEffectView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 49))
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        blurView.effect = blurEffect
        
        colorView = TNTabBarBgView.init(frame: CGRect.init(x: 0, y: -20, width: Int(kScreenWidth), height: kTabBarHeight + 20))
        colorView?.setViewThemeColor(color: UIColor.white)

        xTabBarController?.tabBar.insertSubview(blurView, at: 0)
        xTabBarController?.tabBar.insertSubview(colorView!, at: 1)
        xTabBarController?.tabBar.clipsToBounds = false

        colorView?.layer.shadowColor = UIColorFromRGB(rgbValue: 0xCCCCCC).cgColor
        colorView?.layer.shadowOffset = CGSize(width: 0, height: -2)
        colorView?.layer.shadowOpacity = 0.1
        colorView?.layer.shadowRadius = 2

        
    }
    
    func setupTabBarVC() {

        xMomentViewController = TNMomentViewController()
        xMomentViewController?.title = "动态"
        xMomentViewController?.tabBarItem = UITabBarItem(title: "动态", image: UIImage(named:"icon_tabbar_item_feed_n"), selectedImage: UIImage(named:"icon_tabbar_item_feed_p"))
        xTabBarController?.addChildViewController(TNNavigationController(rootViewController:xMomentViewController!))
        
        xDiscoverViewController = TNDiscoverViewController()
        xDiscoverViewController?.title = "发现"
        xDiscoverViewController?.tabBarItem = UITabBarItem(title: "发现", image: UIImage(named:"icon_tabbar_item_descover_n"), selectedImage: UIImage(named:"icon_tabbar_item_descover_p"))
        xTabBarController?.addChildViewController(TNNavigationController(rootViewController:xDiscoverViewController!))
        
        xHomeViewController = TNHomeViewController()
        xHomeViewController?.title = "打卡"
        xHomeViewController?.tabBarItem = UITabBarItem(title: "打卡", image: UIImage(named:"icon_tabbar_item_punch_n"), selectedImage: UIImage(named:"icon_tabbar_item_punch_p"))
        xTabBarController?.addChildViewController(TNNavigationController(rootViewController:xHomeViewController!))

        xChallengeViewController = TNChallengeViewController()
        xChallengeViewController?.title = "挑战"
        xChallengeViewController?.tabBarItem = UITabBarItem(title: "挑战", image: UIImage(named:"icon_tabbar_item_store_n"), selectedImage: UIImage(named:"icon_tabbar_item_store_p"))
        xTabBarController?.addChildViewController(TNNavigationController(rootViewController:xChallengeViewController!))
        
        xMeViewController = TNMeViewController()
        xMeViewController?.title = ""
        xMeViewController?.tabBarItem = UITabBarItem(title: "我的", image: UIImage(named:"icon_tabbar_item_my_n"), selectedImage: UIImage(named:"icon_tabbar_item_my_p"))
        xTabBarController?.addChildViewController(TNNavigationController(rootViewController:xMeViewController!))
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if tabBarController.selectedIndex == 2 {
            colorView?.setViewThemeColor(color: UIColor.orange)
        }else {
            colorView?.setViewThemeColor(color: UIColor.white)
        }
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
