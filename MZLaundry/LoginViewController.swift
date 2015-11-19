//
//  LoginViewController.swift
//  MZLaundry
//
//  Created by 李 jia on 15/10/12.
//  Copyright © 2015年 l+. All rights reserved.
//

import UIKit
import CXCardView

class LoginViewController: UIViewController {
    
    var screenSize = UIScreen.mainScreen().bounds
    @IBOutlet var phonInputTxtF: UITextField!
    @IBOutlet var vfCodeInputTxtF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupView(){
        //设定texfield的边框
        self.phonInputTxtF.layer.borderColor = UIColor.getMidGrayColor().CGColor
        self.phonInputTxtF.layer.borderWidth = 1.0
        self.phonInputTxtF.clipsToBounds = true
        self.vfCodeInputTxtF.layer.borderColor = UIColor.getMidGrayColor().CGColor
        self.vfCodeInputTxtF.layer.borderWidth = 1.0
        self.vfCodeInputTxtF.clipsToBounds = true
        
    }
    @IBAction func getVerifyBtn(sender: UIButton) {
        //调用自定义的alert
        let testView = CXCardReuseView(frame: CGRect(x: (screenSize.width-300)/2, y: 0, width: 300, height: 300))
        let cxcardV = CXCardView(view: testView)
        cxcardV.show()
            }
   
    
    @IBAction func loginBtn(sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("TabBarController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func backBtn(sender: UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    @IBAction func uzagreementBtn(sender: UIButton) {
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
