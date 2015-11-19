//
//  MeViewController.swift
//  MZLaundry
//
//  Created by 李 jia on 15/10/19.
//  Copyright © 2015年 l+. All rights reserved.
//

import UIKit

class MeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func myOrderBtn(sender: AnyObject) {
    }
    @IBAction func myAccountBtn(sender: UIControl) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("MyIncome")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func myAddrBtn(sender: UIControl) {
    }
    @IBAction func sharedQRBtn(sender: UIControl) {
    }
    @IBAction func MyQRBtn(sender: UIControl) {
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
