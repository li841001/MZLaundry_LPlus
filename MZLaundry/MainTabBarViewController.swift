//
//  MainTabBarViewController.swift
//  MZLaundry
//
//  Created by 李 jia on 15/10/19.
//  Copyright © 2015年 l+. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleArray = ["首页","洗衣篮","我","更多"]
        
        for i in 0..<self.viewControllers!.count{
            let vc = viewControllers![i]
            let image = UIImage(named: "2-1-tb\(i+1)-1")
//            let sizeIcon = CGSize(width: 25, height: 25)
            let newImage = image?.imageWithRenderingMode(.AlwaysOriginal)
            let selectedImage = UIImage(named: "2-1-tb\(i+1)-2")
            let newSelectedImage = selectedImage?.imageWithRenderingMode(.AlwaysOriginal)
            vc.tabBarItem = UITabBarItem(title: titleArray[i], image: newImage, selectedImage: newSelectedImage)
        }
        
        tabBar.tintColor = UIColor(red: 119/255, green: 202/255, blue: 249/255, alpha: 1)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
