//
//  TNMePublicCell.swift
//  TNCalendar
//
//  Created by merrill on 2017/9/14.
//  Copyright © 2017年 merrill. All rights reserved.
//

import UIKit

class TNMePublicCell: UITableViewCell {

    class func cellIdentifier() -> String {
        return NSStringFromClass(self.classForCoder())
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
