//
//  MZSplashViewController.swift
//  MZLaundry
//
//  Created by 李 jia on 15/10/8.
//  Copyright © 2015年 l+. All rights reserved.
//

import UIKit

class MZSplashViewController: UIViewController {

    private var scrollView: UIScrollView!
    private var loginBtn: UIButton!
    
    private let screenSize: CGRect = UIScreen.mainScreen().bounds
    private let splashImages = ["0-引-1","0-引-2","0-引-3"]
    override func viewDidLoad() {
        self.automaticallyAdjustsScrollViewInsets = false       //解决添加navigation以后自动留白的问题
        super.viewDidLoad()
        self.setupViews()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupViews(){
        //创建Scrollview
        self.scrollView = UIScrollView(frame: self.screenSize)
        self.scrollView.pagingEnabled = true
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.showsVerticalScrollIndicator = false
        self.scrollView.contentSize = CGSize(width: screenSize.width * CGFloat(self.splashImages.count), height: screenSize.height)
        //加入引导图片
        for i in 0..<self.splashImages.count{
            let imgV = UIImageView(frame: CGRect(x: CGFloat(i) * screenSize.width, y: 0, width: screenSize.width, height: screenSize.height))
            imgV.image = UIImage(named: self.splashImages[i])
            self.scrollView.addSubview(imgV)
        }
        
        self.view.addSubview(self.scrollView)
        
        //创建按钮
        self.loginBtn = UIButton(frame: CGRect(x: (self.screenSize.width-150)/2, y: self.screenSize.height-70, width: 150, height: 35))
        self.loginBtn.setImage(UIImage(named: "0-1-1"), forState: UIControlState.Normal)
        self.loginBtn.addTarget(self, action: "lgBtnClick:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(self.loginBtn)
    }
    
    func lgBtnClick(sender: UIButton){
        let registerControl = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("registerVC")
        self.navigationController?.pushViewController(registerControl, animated: true)
    }
    

    
}
