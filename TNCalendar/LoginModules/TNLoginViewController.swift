//
//  TNLoginViewController.swift
//  TNCalendar
//
//  Created by merrill on 2017/9/29.
//  Copyright © 2017年 merrill. All rights reserved.
//

import UIKit

class TNLoginViewController: TNBaseViewController {
    
    var bananaImageView : UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupBgImageViewUI()
        self.setupSubViewUI()
        
    }

    func setupBgImageViewUI() {
        
        var bgImage = UIImage.init(named: "login_bg_icon_6")
        if IS_Iphone_4 {
            bgImage = UIImage.init(named: "login_bg_icon_4")
        }else if IS_Iphone_5 {
            bgImage = UIImage.init(named: "login_bg_icon_5")
        }else if IS_Iphone_6P {
            bgImage = UIImage.init(named: "login_bg_icon_6p")
        }
        
        let bgImageView = UIImageView.init(frame: self.view.bounds)
        bgImageView.image = bgImage;
        bgImageView.contentMode = UIViewContentMode.scaleAspectFill
        self.view.addSubview(bgImageView)
        
        bananaImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 49*kScreenScale + kNaviHeight, width: 249*kScreenScale, height: 82*kScreenScale))
        bananaImageView?.center = CGPoint.init(x: kScreenWidth/2, y: (bananaImageView?.center.y)!)
        bananaImageView?.image = UIImage.init(named: "login_img_logo")
        self.view.addSubview(bananaImageView!)
    }
    
    func setupSubViewUI() {
        
        
        let leftButton = UIButton.init(type: UIButtonType.custom)
        leftButton.titleLabel?.font = UIFont.systemFont(ofSize: 14*kScreenScale)
        leftButton.setTitleColor(UIColorFromRGB(rgbValue: 0x222222), for: UIControlState.normal)
        leftButton.setTitle("手机号码登录", for: UIControlState.normal)
        leftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        leftButton.addTarget(self, action:#selector(clickLeftButton), for: UIControlEvents.touchUpInside)
        self.view.addSubview(leftButton)
        leftButton.sizeToFit()
        leftButton.frame = CGRect.init(x: 15, y: 22, width: leftButton.bounds.size.width, height: leftButton.bounds.size.height)
        leftButton.center = CGPoint.init(x: leftButton.center.x, y: kNaviCenterY)
        
        let rightButton = UIButton.init(type: UIButtonType.custom)
        rightButton.titleLabel?.font = UIFont.systemFont(ofSize: 14*kScreenScale)
        rightButton.setTitleColor(UIColorFromRGB(rgbValue: 0x222222), for: UIControlState.normal)
        rightButton.setTitle("试用一下", for: UIControlState.normal)
        rightButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.right
        self.view.addSubview(rightButton)
        rightButton.sizeToFit()
        rightButton.frame = CGRect.init(x: kScreenWidth - rightButton.bounds.size.width - 15, y: 22, width: rightButton.bounds.size.width, height: rightButton.bounds.size.height)
        rightButton.center = CGPoint.init(x: rightButton.center.x, y: kNaviCenterY)
        
        let wechatButton = UIButton.init(type: UIButtonType.custom)
        wechatButton.setBackgroundImage(UIImageWithColor(imageColor: UIColorFromRGB(rgbValue: 0x8DC320)), for: UIControlState.normal)
        wechatButton.layer.masksToBounds = true
        wechatButton.layer.cornerRadius = 24*kScreenScale
        wechatButton.titleLabel?.font = UIFont.systemFont(ofSize: 18*kScreenScale)
        wechatButton.setTitleColor(UIColorFromRGB(rgbValue: 0xFFFFFF), for: UIControlState.normal)
        wechatButton.setTitle("微信登录", for: UIControlState.normal)
        wechatButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        wechatButton.contentVerticalAlignment   = UIControlContentVerticalAlignment.center
        wechatButton.setImage(UIImage.init(named: "login_ic_wechat"), for: UIControlState.normal)
        wechatButton.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0)
        wechatButton.addTarget(self, action: #selector(loginEntroHome), for: UIControlEvents.touchUpInside)
        self.view.addSubview(wechatButton)
        wechatButton.frame = CGRect.init(x: 35*kScreenScale, y: (bananaImageView?.frame.maxY)! + 84*kScreenScale, width: kScreenWidth - 70*kScreenScale, height: 48*kScreenScale)
        
        let weiboButton = UIButton.init(type: UIButtonType.custom)
        weiboButton.setBackgroundImage(UIImageWithColor(imageColor: UIColorFromRGB(rgbValue: 0xDD5F06)), for: UIControlState.normal)
        weiboButton.layer.masksToBounds = true
        weiboButton.layer.cornerRadius = 24*kScreenScale
        weiboButton.titleLabel?.font = UIFont.systemFont(ofSize: 13*kScreenScale)
        weiboButton.setTitleColor(UIColorFromRGB(rgbValue: 0xFFFFFF), for: UIControlState.normal)
        weiboButton.setTitle("微博登录", for: UIControlState.normal)
        weiboButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        weiboButton.contentVerticalAlignment   = UIControlContentVerticalAlignment.center
        weiboButton.setImage(UIImage.init(named: "login_ic_weibo"), for: UIControlState.normal)
        weiboButton.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0)
        self.view.addSubview(weiboButton)
        weiboButton.frame = CGRect.init(x: 35*kScreenScale, y: wechatButton.frame.maxY + 19*kScreenScale, width: (kScreenWidth - 95*kScreenScale)/2, height: 48*kScreenScale)
        
        let qqButton = UIButton.init(type: UIButtonType.custom)
        qqButton.setBackgroundImage(UIImageWithColor(imageColor: UIColorFromRGB(rgbValue: 0x04A7DD)), for: UIControlState.normal) 
        qqButton.layer.masksToBounds = true
        qqButton.layer.cornerRadius = 24*kScreenScale
        qqButton.titleLabel?.font = UIFont.systemFont(ofSize: 13*kScreenScale)
        qqButton.setTitleColor(UIColorFromRGB(rgbValue: 0xFFFFFF), for: UIControlState.normal)
        qqButton.setTitle("QQ登录", for: UIControlState.normal)
        qqButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
        qqButton.contentVerticalAlignment   = UIControlContentVerticalAlignment.center
        qqButton.setImage(UIImage.init(named: "login_ic_QQ"), for: UIControlState.normal)
        qqButton.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0)
        self.view.addSubview(qqButton)
        qqButton.frame = CGRect.init(x: weiboButton.frame.maxX + 25*kScreenScale, y: wechatButton.frame.maxY + 19*kScreenScale, width: (kScreenWidth - 95*kScreenScale)/2, height: 48*kScreenScale)
        
        let explainLabel = UILabel.init(frame: CGRect.init(x: 0, y: kScreenHeight - 100, width: kScreenWidth, height: 16*kScreenScale))
        explainLabel.textColor = UIColorFromRGB(rgbValue: 0x48484D)
        explainLabel.textAlignment = NSTextAlignment.center
        explainLabel.font = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(explainLabel)
        explainLabel.text = "注册或登录即同意香蕉打卡“服务条款”"
        
    }
    
    func clickLeftButton()  {
        let phoneLoginVC = TNPhoneLoginViewController()
        phoneLoginVC.title = "登录"
        self.navigationController?.navigationBar.setBackgroundImage(UIImageWithColor(imageColor: UIColorFromRGB(rgbValue: 0xF3D800)), for: UIBarMetrics.default)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: nil, style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        self.navigationController?.pushViewController(phoneLoginVC, animated: true)
    }
    
    func loginEntroHome() {
        UIApplication.shared.delegate?.window??.rootViewController = TNMainViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
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
