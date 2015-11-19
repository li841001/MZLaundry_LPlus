//
//  ModiTabbar_SingleWash.swift
//  MZLaundry
//
//  Created by 李 jia on 15/11/9.
//  Copyright © 2015年 l+. All rights reserved.
//

import UIKit

protocol TabbarControlDelegate{
    func selectedCount(count: Int)
}


class ModiTabbar_SingleWash: UIView {

    private var colorNormal:           UIColor!
    private var colorSelected:         UIColor!
    private var colorUnderLine:      UIColor!
    private var underLine:              UIView!
    
    
    var setTitle:[String]!
    var delegate: TabbarControlDelegate?
    
    //属性观察器监视值改变
    private var count: Int = 0 {
        willSet {
            (self.subviews[self.count] as! UIButton).setTitleColor(self.colorNormal, forState: .Normal)
        }
        
        didSet {
            (self.subviews[self.count] as! UIButton).setTitleColor(self.colorSelected, forState: .Normal)
            //动画下标的位置
            UIView.animateWithDuration(0.2) { () -> Void in
                self.underLine.frame.origin.x = self.frame.width/4 * CGFloat(self.count)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialize(){
        self.backgroundColor = UIColor.whiteColor()
        self.setTitle = ["春季／秋季","夏装", "冬装", "皮衣"]
        self.colorNormal = UIColor(red: 88/255, green: 88/255, blue: 88/255, alpha: 1)
        self.colorSelected = UIColor(red: 40/255, green: 204/255, blue: 252/255, alpha: 1)
        self.colorUnderLine = UIColor(red: 110/255, green: 222/255, blue: 252/255, alpha: 1)
        self.underLine = UIView(frame: CGRect(x: -1, y: 40, width: Screen.ScreenSize.width/4-1, height: 5))
        
        for i in 0..<self.setTitle.count {
            let button = UIButton(frame: CGRect(x: self.frame.width/4 * CGFloat(i)-1, y: 0.0, width: self.frame.width/4, height: self.frame.height))
            button.tag = i
            button.setTitle(self.setTitle[i], forState: .Normal)
            button.setTitleColor(i != 0 ? self.colorNormal : self.colorSelected, forState: .Normal)
            button.addTarget(self, action: "clickBtn:", forControlEvents: .TouchUpInside)
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1).CGColor
            self.addSubview(button)
        }
        self.underLine.backgroundColor = self.colorUnderLine
        self.addSubview(self.underLine)
    }
    
    func clickBtn(sender: UIButton) {
        self.count = sender.tag
        self.delegate?.selectedCount(self.count)
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
//@end

