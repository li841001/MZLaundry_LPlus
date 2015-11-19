//
//  SingleWashViewController.swift
//  MZLaundry
//
//  Created by 李 jia on 15/11/4.
//  Copyright © 2015年 l+. All rights reserved.
//

import UIKit

class SingleWashViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, TabbarControlDelegate {

    //MARK: 用于collection view的数据
    var cellCount = Data4Cell.dataSpring.count
    var data = Data4Cell.dataSpring

    
    @IBOutlet var detailCollectionView: UICollectionView!
    @IBOutlet var topBar: UIView!
    private var bar: ModiTabbar_SingleWash!     //控件
    
    //MARK: DelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let wItem = (collectionView.frame.width - 40) / 2
        let hItem = wItem / 7 * 8
        
        return CGSize(width: wItem, height: hItem)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailCollectionView.dataSource = self
        self.detailCollectionView.delegate = self
        //按钮控件条
        let barY = self.topBar.frame.height
        self.bar = ModiTabbar_SingleWash(frame: CGRect(x: 1, y: barY+1, width: Screen.ScreenSize.width, height: 45))
        self.bar.delegate = self
        self.view.addSubview(self.bar)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func return_Btn(sender: UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    //collection view 的基本设置
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellCount
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: SingleWashCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("singleWashCell", forIndexPath: indexPath) as! SingleWashCollectionViewCell
        cell.cell_Img_View.image = UIImage(named: data[indexPath.row]["img"]!)
        cell.cell_LB_Name.text = data[indexPath.row]["name"]
        if let price = data[indexPath.row]["price"] {
            cell.cell_LB_Price.text = "￥\(price)"
        }
        
        return cell
    }
    
    
    
    func selectedCount(count: Int) {
        switch count {
        case 0:     //当前页面
            self.data = Data4Cell.dataSpring
            self.cellCount = Data4Cell.dataSpring.count
            self.detailCollectionView.reloadData()
        case 1:     //页面1
            self.data = Data4Cell.dataSummer
            self.cellCount = Data4Cell.dataSummer.count
            self.detailCollectionView.reloadData()
        case 2:     //页面2
            self.data = Data4Cell.dataWinter
            self.cellCount = Data4Cell.dataWinter.count
            self.detailCollectionView.reloadData()
        case 3:     //页面3
            self.data = Data4Cell.dataLeather
            self.cellCount = Data4Cell.dataLeather.count
            self.detailCollectionView.reloadData()
           
        default:
            break
        }
    }

    //MARK: CollectionView Cell 点选跳转：
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("addToCartView") as! AddToCartViewController
        vc.modalPresentationStyle = .Custom
        vc.data4view = self.data[indexPath.row]
        vc.view.superview?.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    
        //页面跳转
        self.presentViewController(vc, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}//@end
