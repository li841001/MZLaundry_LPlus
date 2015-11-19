//
//  MyIncomeData.swift
//  MZLaundry
//
//  Created by 李 jia on 15/10/25.
//  Copyright © 2015年 l+. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MyIncomeData{
    class var sharedInstance: MyIncomeData{
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var instance: MyIncomeData? = nil
        }
        dispatch_once(&Static.onceToken){
            Static.instance = MyIncomeData()
        }
        return Static.instance!
    }
    
    private func getRequest(url: String, parameters: [String: AnyObject]?, completionHander: (NSData?, ErrorType?) -> Void){
        request(.GET, NetInfo.WEB_SERVER, parameters: parameters, encoding: ParameterEncoding.URL).response { (_, _, data, error) -> Void in
            completionHander(data,error)
        }
    }
    
    func getCellInfo(completionHandler:(urls:[String]) -> Void){
        
    }
    
//End@Class
}