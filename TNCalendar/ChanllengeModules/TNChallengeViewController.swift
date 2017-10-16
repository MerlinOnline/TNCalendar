//
//  TNChallengeViewController.swift
//  TNCalendar
//
//  Created by merrill on 2017/10/16.
//  Copyright © 2017年 merrill. All rights reserved.
//

import UIKit

class TNChallengeViewController: TNBaseViewController ,UITableViewDelegate , UITableViewDataSource {

    var tableView : UITableView?
    let cellIdentifier = "CELL_IDENTIFIER_KEY"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupSubViews()
        self.setupTableView()
    }
    
    func setupSubViews() {
        
        self.view.backgroundColor = UIColorFromRGB(rgbValue: 0xEFEFF4)
        self.edgesForExtendedLayout = []
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    func setupTableView() {
        
        tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.grouped)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: cellIdentifier)
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
        
        tableView?.addPullToRefreshWithAction {
            OperationQueue().addOperation {
                sleep(2)
                OperationQueue.main.addOperation {
                    self.tableView?.stopPullToRefresh()
                }
            }
            
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = "区间 section:\(indexPath.section + 1) 行 row: \(indexPath.row + 1)"
        cell.imageView?.image = UIImageWithColor(imageColor: UIColorFromRGB(rgbValue: 0x4CD964))
        
        return cell
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
