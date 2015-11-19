//
//  AddToCartViewController.swift
//  MZLaundry
//
//  Created by 李 jia on 15/11/10.
//  Copyright © 2015年 l+. All rights reserved.
//

import UIKit

class AddToCartViewController: UIViewController {

    var data4view: NSDictionary?
    
    @IBOutlet var popView: UIView!
    @IBOutlet var imag4cart: UIImageView!
    @IBOutlet var priceInPcs: UILabel!
    @IBOutlet var descriptionLab: UILabel!
    @IBOutlet var name: UILabel!
    @IBOutlet var countPcs: UILabel!
    var numCountPcs = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.popView.layer.cornerRadius = 10
        self.countPcs.text = "\(numCountPcs)"
        // Do any additional setup after loading the view.
        viewInit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewInit(){
        self.imag4cart.image = UIImage(named: "\(data4view!["img"]!)")
        self.name.text = "\(data4view!["name"]!)"
        self.priceInPcs.text = "¥\(data4view!["price"]!)"
    }
    
    @IBAction func plusOneBtn(sender: UIButton) {
        self.numCountPcs++
        self.countPcs.text = "\(numCountPcs)"
    }
    @IBAction func minusOneBtn(sender: UIButton) {
        if numCountPcs > 0 {
            self.numCountPcs--
        }
        self.countPcs.text = "\(numCountPcs)"
    }
    @IBAction func cancelBtn(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func addToCartBtn(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
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
