//
//  TNMeViewController.swift
//  TNCalendar
//
//  Created by merrill on 2017/9/8.
//  Copyright © 2017年 merrill. All rights reserved.
//

import UIKit

class TNMeViewController: TNBaseViewController ,UITableViewDataSource ,UITableViewDelegate {

    var tableView : UITableView?
    var tableHeader : TNMeTableHeader?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupSubViews()
        self.setupTableView()
        self.setTableViewHeader()
        
    }
    
    func setupSubViews() {
        
        self.view.backgroundColor = UIColorFromRGB(rgbValue: 0xEFEFF4)
        self.edgesForExtendedLayout = []
        self.automaticallyAdjustsScrollViewInsets = false
        
        navigationController?.navigationBar.setBackgroundImage(UIImageWithColor(imageColor: UIColor.clear), for: UIBarMetrics.default)

    }
    
    func setupTableView() {
        
        tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.grouped)
        tableView?.frame = CGRect(x: 0, y: -kNaviHeight, width: kScreenWidth, height: kScreenHeight + kNaviHeight)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.register(TNMePublicCell.classForCoder(), forCellReuseIdentifier: TNMePublicCell.cellIdentifier())
        tableView?.register(TNMeInfomationCell.classForCoder(), forCellReuseIdentifier: TNMeInfomationCell.cellIdentifier())
        tableView?.contentInset = UIEdgeInsets.zero
        tableView?.autoresizingMask = [UIViewAutoresizing.flexibleHeight ,UIViewAutoresizing.flexibleWidth]
        self.view.addSubview(tableView!)
        
        if #available(iOS 11.0, *) {
            tableView?.estimatedSectionFooterHeight = 0
            tableView?.estimatedSectionHeaderHeight = 0
            tableView?.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false;
        }
    }
    
    func setTableViewHeader() {
        tableHeader = TNMeTableHeader()
        tableHeader?.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: 200)
        tableHeader?.backgroundColor = UIColor.yellow
        tableView?.tableHeaderView = tableHeader
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 4
        case 3:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 84
        default:
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell
        switch indexPath.section {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: TNMeInfomationCell.cellIdentifier(), for: indexPath)
        default:
            cell = tableView.dequeueReusableCell(withIdentifier: TNMePublicCell.cellIdentifier(), for: indexPath)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let mapViewController = TNMapViewController()
        mapViewController.title = "地图"
        mapViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(mapViewController, animated: true)
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
