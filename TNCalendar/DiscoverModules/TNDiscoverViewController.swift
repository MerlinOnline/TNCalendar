//
//  TNDiscoverViewController.swift
//  TNCalendar
//
//  Created by merrill on 2017/9/8.
//  Copyright © 2017年 merrill. All rights reserved.
//

import UIKit

class TNDiscoverViewController: TNBaseViewController ,UICollectionViewDelegate , UICollectionViewDataSource {

    var collectionView : UICollectionView?
    var flowLayout : UICollectionViewFlowLayout?
    
    let itemIdentifier = "ITEM_IDENTIFIER_KEY"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupSubViews()
        self.setupCollectionView()
    }
    
    func setupSubViews() {
        
        self.view.backgroundColor = UIColorFromRGB(rgbValue: 0xEFEFF4)
        self.edgesForExtendedLayout = []
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    func setupCollectionView() {
        
        flowLayout = UICollectionViewFlowLayout()
        flowLayout?.itemSize = CGSize.init(width: kScreenWidth - 20, height: 200);
        flowLayout?.scrollDirection = UICollectionViewScrollDirection.vertical;
        flowLayout?.minimumLineSpacing = 10;
        flowLayout?.minimumInteritemSpacing = 10;
        flowLayout?.sectionInset = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)

        collectionView = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: flowLayout!)
        collectionView?.backgroundColor = UIColorFromRGB(rgbValue: 0xEFEFF4)
        collectionView?.delegate = self;
        collectionView?.dataSource = self;
        collectionView?.scrollsToTop = false;
        collectionView?.showsVerticalScrollIndicator = false;
        collectionView?.showsHorizontalScrollIndicator = false;
        collectionView?.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: itemIdentifier)
        collectionView?.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        self.view.addSubview(collectionView!)
        
        
        
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: itemIdentifier, for: indexPath)
        
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.contentView.backgroundColor = UIColor.purple
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
