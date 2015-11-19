//
//  FirstPageViewController.swift
//  MZLaundry
//
//  Created by 李 jia on 15/10/20.
//  Copyright © 2015年 l+. All rights reserved.
//

import UIKit
import RJImageLoader
import CXCardView

class FirstPageViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var adScrollView: UIScrollView!
    
    private var adImageArray: [UIImageView]! = []
    private var adImageAddress: [String]!
    private let screenSize = UIScreen.mainScreen().bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.loadAdData()
//        HttpTool.sharedInstance.getAdInfo { (urls) -> Void in
//                print(urls.description)
//            self.adImageAddress = urls
//        }

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupUI(){
        //Modify ScrollView
        self.adScrollView.showsHorizontalScrollIndicator = false
        self.adScrollView.showsVerticalScrollIndicator   = false
        self.adScrollView.pagingEnabled                  = true
        self.adScrollView.bounces                        = false
        self.adScrollView.clipsToBounds                  = true
    }
    
    private func loadAdData(){
        HttpTool.sharedInstance.getAdInfo { (urls) -> Void in
            self.creatImageData(urls)
        }
    }
    // 创建ImageView并加载图片
    private func creatImageData(urls: [String]){
        //修改pageController
        self.pageControl.numberOfPages = urls.count
        //修改ScrollView的contentSize
        self.adScrollView.contentSize = CGSize(width: CGFloat(urls.count)*self.screenSize.width, height: self.adScrollView.frame.height)
        //创建ImageView
        for i in 0..<urls.count {
            let imgV = UIImageView(frame: CGRect(x: CGFloat(i)*self.screenSize.width, y: 0, width: self.screenSize.width, height: self.adScrollView.frame.height))
            self.adScrollView.addSubview(imgV)
            self.adImageArray.append(imgV)
        }
        //加载图片
        for i in 0..<self.adImageArray.count{
            let imgV = self.adImageArray[i]
            imgV.startLoaderWithTintColor(UIColor.redColor())
            imgV.sd_setImageWithURL(NSURL(string: urls[i])!, placeholderImage: UIImage(named: "2-1-BANNER_PlaceHolder"), options: [.CacheMemoryOnly, .RefreshCached], progress: { (r, t) -> Void in
                imgV.updateImageDownloadProgress(CGFloat(r) / CGFloat(t))
                }, completed: { (_, _, _, _) -> Void in
                    imgV.reveal()
            })
//            imgV.sd_setImageWithURL(NSURL(string: urls[i])!)
        }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        self.pageControl.currentPage = Int(fabs(scrollView.contentOffset.x / self.screenSize.width))
    }
    
    @IBAction func onePieceBtn(sender: UIButton) {      //跳转到single wash页面
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("singleWashView")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func packWashBtn(sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("packWashModalView") as! PackWashViewController
        vc.modalPresentationStyle = .Custom
        vc.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        self.presentViewController(vc, animated: true, completion: nil)
        
    }
    @IBAction func furnitureBtn(sender: UIButton) {
    }
    @IBAction func otherBtn(sender: UIButton) {
    }
    @IBAction func serviceInstruct(sender: UIButton) {
//        let scrSizeW = UIScreen.mainScreen().bounds.width
//        let scrSizeH = UIScreen.mainScreen().bounds.height
        //setup alertView
        let modifyAlertView: UIView = UIView(frame: CGRect(origin: CGPoint(), size: CGSize(width: 300, height: 200)))
        modifyAlertView.backgroundColor = UIColor.whiteColor()
        modifyAlertView.layer.cornerRadius = 10
        modifyAlertView.layer.masksToBounds = false
        modifyAlertView.alpha = 0.9
        let modifyAlert     = CXCardView(view:modifyAlertView)
        modifyAlert.show()
        let alert_size = modifyAlertView.frame//        
        //setup the label
        let alert_label = UILabel(frame: CGRect(x: (alert_size.width-200)/2, y: 20, width: 200, height: 100))
        alert_label.text = "这是条用户协议 \n 其实你看了也是白看，反正都得遵守。"
        alert_label.numberOfLines = 0
        alert_label.textAlignment = NSTextAlignment.Center
        alert_label.textColor = UIColor.orangeColor()
        modifyAlertView.addSubview(alert_label)
        //button for alert
        let alert_btn = UIButton(frame: CGRect(x: (alert_size.width-200)/2, y: alert_size.height - 60, width: 200, height: 40))
        alert_btn.backgroundColor = UIColor.redColor()
        alert_btn.setTitle("除了接受还是接受", forState: .Normal)
        alert_btn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        alert_btn.setTitleColor(UIColor.blackColor(), forState: .Highlighted)
        modifyAlertView.addSubview(alert_btn)
        alert_btn.addTarget(self, action: "backBtnClick", forControlEvents: .TouchUpInside)
    }
    
    func backBtnClick(){
        CXCardView.dismissCurrent()
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
