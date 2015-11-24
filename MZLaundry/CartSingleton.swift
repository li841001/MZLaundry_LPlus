//
//  CartSingleton.swift
//  MZLaundry
//
//  Created by 李 jia on 15/11/24.
//  Copyright © 2015年 l+. All rights reserved.
//

import UIKit

class CartSingleton: NSObject {
    class var sharedInstance: CartSingleton{
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: CartSingleton? = nil
        }
        dispatch_once(&Static.onceToken){
            Static.instance = CartSingleton()
        }
        return Static.instance!
    }
    
    private var basketArray:[ClothModel] = []
    
    func findClothByName(name:String) -> ClothModel? {
        if self.basketArray.isEmpty{
            return nil
        }
        for cloth in self.basketArray {
            if cloth.name == name{
                return cloth
            }
        }
        return nil
    }
    
    func removeCloth(cloth: ClothModel){
        for i in 0..<self.basketArray.count{
            if cloth.name == self.basketArray[i].name{
                self.basketArray.removeAtIndex(i)
                break
            }
        }
    }
    
    func updateCloth(cloth:ClothModel){
        let tmp = self.findClothByName(cloth.name)
        if tmp == nil{
            return
        }else if cloth.count == 0 {
            self.removeCloth(cloth)
        }else if tmp!.count != cloth.count {
            tmp?.count = cloth.count
        }
    }
    
    func insertCloth(cloth:ClothModel){
        let tmp = self.findClothByName(cloth.name)
        if tmp != nil {
            self.updateCloth(cloth)
        }else{
            self.basketArray.append(cloth)
        }
    }
    
    func countBasket()-> Int{
        return self.basketArray.count
    }
    
    func getClothByIndex(idx:Int) -> ClothModel {
        return self.basketArray[idx]
    }
}//@end Class CartSingleton
