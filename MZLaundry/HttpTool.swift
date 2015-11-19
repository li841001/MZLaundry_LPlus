//
//  HttpTool.swift
//  MZLaundry
//
//  Created by 李 jia on 15/10/21.
//  Copyright © 2015年 l+. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HttpTool {
    class var sharedInstance: HttpTool {
        struct Static{
            static var onceToken: dispatch_once_t = 0
            static var instance: HttpTool? = nil
        }
        dispatch_once(&Static.onceToken){
            Static.instance = HttpTool()
        }
        return Static.instance!
    }
    
    private func getRequest(url: String, parameters: [String : AnyObject]?, completionHandler: (NSData?, ErrorType?) -> Void){
    
        request(.GET, NetInfo.WEB_SERVER + url , parameters: parameters, encoding: ParameterEncoding.URL).response { (_, _, data, error) -> Void in
            completionHandler(data,error)
        }
    }
    //请求广告数据
    func getAdInfo(completionHandler:(urls:[String]) -> Void){
        self.getRequest(NetInfo.GET_ADS_DATA, parameters: nil) { (data, error) -> Void in
            //判断是否出错
            if error == nil {
                //无错误时开始解析json
                let json = JSON(data: data as NSData!)
                let ads = json["ads"]
                var addrs = [String]()
                for i in 0..<ads.count{
                    if let imageAddress = ads[i]["image"].string{
                        addrs.append(imageAddress)
                    }
                }
                //解析完成后通过闭包把地址回传给调用方
                completionHandler(urls: addrs)
            }
        }
    }
    
    //请求收益数据
    func getIncomeInfo(completionHandeler: (incomeInfo: IncomeInfo)->Void){
        self.getRequest(NetInfo.GET_INCOME_INFO, parameters: nil) { (data, error) -> Void in
            //验证数据合理性，请求是否成功
            if error == nil {
                    //使用SwiftyJSON解析数据
                    let json = JSON(data: data!)
                    let incomeInfo = IncomeInfo()
                    incomeInfo.yearlyIncome = json["yearlyIncome"].int!
                    incomeInfo.balancing = json["balancing"].bool!
                    incomeInfo.baseSalary = json["baseSalary"].int!
                    //取得并解析每天的收益dailyIncome
                    let dailyIncome = json["dailyIncome"]
                    for i in 0..<dailyIncome.count {
                        let dailyJSON = dailyIncome[i]
                        let dailyObj = DailyInfo()
                        dailyObj.date = dailyJSON["date"].string!
                        //取得并解析订单Order数据
                        let orders = dailyJSON["orders"]
                        for j in 0..<orders.count {
                            let orderJSON = orders[j]
                            let orderInfo = OrderInfo()
                            orderInfo.orderID = orderJSON["orderId"].string!
                            orderInfo.orderAmount = orderJSON["orderAmount"].int!
                            orderInfo.income = orderJSON["income"].int!
                            orderInfo.time = orderJSON["time"].string!
                            dailyObj.ordersArray.append(orderInfo)
                        }
                        incomeInfo.dailyIncome.append(dailyObj)
                }
                completionHandeler(incomeInfo: incomeInfo)
            }
        }
    }
    
}//@end
