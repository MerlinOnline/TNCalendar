//
//  TNMeInfomationCell.swift
//  TNCalendar
//
//  Created by merrill on 2017/9/13.
//  Copyright © 2017年 merrill. All rights reserved.
//

import UIKit

class TNMeInfomationCell: UITableViewCell {

    var avatarView : UIImageView?
    var nameLabel : UILabel?
    var accountLabel : UILabel?
    var codeImageView : UIImageView?
    var arrowImageView : UIImageView?
    
    class func cellIdentifier() -> String {
        return NSStringFromClass(self.classForCoder())
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupSubViews()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    func setupSubViews() {
        
        self.backgroundColor = UIColor.white
        
        avatarView = UIImageView.init(frame: CGRect.init(x: 10, y: 10, width: 64, height: 64))
        avatarView?.layer.cornerRadius = 2
        avatarView?.layer.masksToBounds = true
        self.contentView.addSubview(avatarView!)
        avatarView?.image = UIImageWithColor(imageColor: UIColorFromRGB(rgbValue: 0xB0E0E6))
        
        nameLabel = UILabel.init(frame: CGRect.init(x: 84, y: 15, width: 100, height: 20))
        nameLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        nameLabel?.textColor = UIColorFromRGB(rgbValue: 0x48484D)
        self.contentView.addSubview(nameLabel!)
        nameLabel?.text = "daxie_FUCK"
        nameLabel?.sizeToFit()
        
        accountLabel = UILabel.init(frame: CGRect.init(x: 84, y: 45, width: 100, height: 20))
        accountLabel?.font = UIFont.systemFont(ofSize: 16)
        accountLabel?.textColor = UIColorFromRGB(rgbValue: 0x48484D)
        self.contentView.addSubview(accountLabel!)
        accountLabel?.text = "fuck号：xiaoxie_gan"
        accountLabel?.sizeToFit()
        
        arrowImageView = UIImageView.init(frame: CGRect.init(x: kScreenWidth - 26, y: 34, width: 16, height: 16))
        arrowImageView?.image = UIImage.init(named: "arrow_right")
        self.contentView.addSubview(arrowImageView!)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
