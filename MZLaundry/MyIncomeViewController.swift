//
//  MyIncomeViewController.swift
//  MZLaundry
//
//  Created by 李 jia on 15/10/24.
//  Copyright © 2015年 l+. All rights reserved.
//

import UIKit

class MyIncomeViewController: UIViewController {

    @IBOutlet var monthLab:                     UILabel!
    @IBOutlet var totalIncomeLab:            UILabel!
    @IBOutlet var detailTableView:            UITableView!
    @IBOutlet var balanceLab:                  UILabel!
    @IBOutlet var monthlyIncome:            UILabel!
    @IBOutlet var baseSalaryLab:            UILabel!
    
    private var     incomeInfo:                   IncomeInfo?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        // Do any additional setup after loading the view.
        HttpTool.sharedInstance.getIncomeInfo { (incomeInfo) -> Void in
            self.incomeInfo = incomeInfo
            self.detailTableView.reloadData()
            self.baseSalaryLab.text     =           "\(self.incomeInfo!.baseSalary)元"
            self.totalIncomeLab.text    =           "\(self.incomeInfo!.yearlyIncome)元"
            if incomeInfo.balancing     ==        true {
                self.balanceLab.text      =          "已结算"
            }else{
                self.balanceLab.text      =          "未结算"
            }
            
//            self.monthlyIncome.text =
            self.reloadInputViews()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func DismissBtn(sender: UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
    }

    
}

extension MyIncomeViewController: UITableViewDataSource{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.incomeInfo == nil ? 0 : self.incomeInfo!.dailyIncome.count
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.incomeInfo == nil ? 0 : self.incomeInfo!.dailyIncome[section].ordersArray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //取出数据让cell调用
        let orderInfo = self.incomeInfo!.dailyIncome[indexPath.section].ordersArray[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("incomeCell") as! IncomeTableViewCell
        //给cell赋值
        cell.orderId.text = orderInfo.orderID
        cell.completeDate.text = orderInfo.time
        cell.orderAmount.text = "\(orderInfo.orderAmount) 元"
        cell.income.text = "\(orderInfo.income)元"
         (cell.viewWithTag(4) as! UILabel).text = "\(orderInfo.income)元"
        return cell
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.incomeInfo == nil ? nil : self.incomeInfo?.dailyIncome[section].date
    }
    
}
