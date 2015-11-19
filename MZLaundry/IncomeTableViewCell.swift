//
//  IncomeTableViewCell.swift
//  MZLaundry
//
//  Created by 李 jia on 15/11/2.
//  Copyright © 2015年 l+. All rights reserved.
//

import UIKit

class IncomeTableViewCell: UITableViewCell {

    @IBOutlet var orderId: UILabel!
    @IBOutlet var completeDate: UILabel!
    @IBOutlet var orderAmount: UILabel!
    @IBOutlet var income: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
