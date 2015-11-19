//
//  IncomeInfo.swift
//  MZLaundry
//
//  Created by 李 jia on 15/11/2.
//  Copyright © 2015年 l+. All rights reserved.
//

import UIKit

class IncomeInfo: NSObject {

    var yearlyIncome: Int = 0
    var balancing: Bool = false
    var baseSalary: Int = 0
    var dailyIncome:[DailyInfo] = [DailyInfo]()
    var monthlyIncome: Int = 0
}
