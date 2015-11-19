//
//  PackWashViewController.swift
//  MZLaundry
//
//  Created by 李 jia on 15/11/13.
//  Copyright © 2015年 l+. All rights reserved.
//

import UIKit

class PackWashViewController: UIViewController {

    @IBOutlet var countLab: UILabel!
    @IBOutlet var plusBtn_Outlet: UIButton!
    @IBOutlet var minusBtn_Outlet: UIButton!
    @IBOutlet var modalView: UIView!
    var countNum = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.minusBtn_Outlet.setImage(UIImage(named: "2-2-0pack"), forState: .Highlighted)
        self.plusBtn_Outlet.setImage(UIImage(named: "4-2pack"), forState: .Highlighted)
        self.modalView.layer.cornerRadius = 10
        self.countLab.text  = "\(countNum)"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func plusBtn(sender: AnyObject) {
        self.countNum++
        self.countLab.text = "\(countNum)"
    }
    
    @IBAction func minusBtn(sender: UIButton) {
        if self.countNum > 0{
            self.countNum--
            self.countLab.text = "\(countNum)"
        }
    }
    
    @IBAction func cancelBtn(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func addToCartBtn(sender: UIButton) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            
        }
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
