//
//  CXCardReuseView.swift
//  MZLaundry
//
//  Created by 李 jia on 15/10/30.
//  Copyright © 2015年 l+. All rights reserved.
//

import UIKit
import CXCardView

class CXCardReuseView: UIView {

  
    private var    view_background: UIView!
    private var       button_dissmiss: UIButton!
    private var            label_content: UILabel!
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }

    func setupView(){
        self.backgroundColor = UIColor.clearColor()
        self.layer.cornerRadius = 4.0
        self.layer.masksToBounds = false
        //背景(底框 )
        self.view_background                              = UIView(frame: self.frame)
        self.alpha                                                 = 0.8
        self.view_background.backgroundColor = UIColor.whiteColor()
        self.addSubview(self.view_background)
        let viewBGsize = view_background.frame
       //按钮设定
        self.button_dissmiss = UIButton(type: .Custom)
        self.button_dissmiss.frame = CGRect(x: (viewBGsize.width-200)/2, y: viewBGsize.height-80, width: 200, height: 40)
        self.button_dissmiss.backgroundColor = UIColor.redColor()
        self.button_dissmiss.addTarget(self, action: "dismissBtnClick", forControlEvents: .TouchUpInside)
        self.button_dissmiss.setTitle("明白", forState: .Normal)
        self.button_dissmiss.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.view_background.addSubview(self.button_dissmiss)
        //设置文本
        self.label_content = UILabel()
        self.label_content.frame = CGRectMake(40, 8, 260, 100)
        self.label_content.text = "Testing"
        self.label_content.textAlignment = NSTextAlignment.Center
        self.label_content.textColor = UIColor.redColor()
        self.addSubview(self.label_content)
    }
    
    func dismissBtnClick(){
        CXCardView.dismissCurrent()
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}//@end

