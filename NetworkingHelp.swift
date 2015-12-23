//
//  NetworkingHelp.swift
//  SwiftWork
//
//  Created by 李嘉 on 15/12/21.
//  Copyright © 2015年 李嘉. All rights reserved.
//

import Foundation
import AFNetworking
import ReachabilitySwift

/**
 网络帮助类
 */
public class NetworkingHelp {
    
    /**
     通过网络调用外部服务
     
     - parameter url: 完整的url地址
     - parameter parameters: 参数值
     - parameter MethodType: 方法类型，POST或者GET
     - parameter indexValue: json字符串索引参数值
     - parameter objResult: 输出参数，输入为nil
     */
    public func NetMethod(url : String!, parameters : AnyObject?, MehtodType : String!, indexValue : String!, inout objResult : AnyObject?) -> Void {
        let manager = AFHTTPSessionManager()
        manager.requestSerializer.timeoutInterval = 10
        manager.responseSerializer.acceptableContentTypes = (NSSet().setByAddingObject("application/json") as! Set<String>)
        if(MehtodType == "POST"){
            manager.POST(url, parameters: parameters, success: { (task : NSURLSessionDataTask, response : AnyObject?) -> Void in
                    if(response == nil) {
                        objResult = nil
                    } else {
                        objResult = response![indexValue]
                    }
                
                }, failure: { (task : NSURLSessionDataTask?, error : NSError) -> Void in
                    objResult = error.localizedDescription
            })
        } else {
            manager.GET(url, parameters: parameters, success: { (task : NSURLSessionDataTask, response : AnyObject?) -> Void in
                if(response == nil) {
                    objResult = nil
                } else {
                    objResult = response![indexValue]
                }
                
                }, failure: { (task : NSURLSessionDataTask?, error : NSError) -> Void in
                    objResult = error.localizedDescription
            })
        }
        
    }
    
    /**
     网络连接类型判断
     
     - returns:第一个返回网络连接是否可用，第二个返回网络连接类型是属于哪个
     */
    public func NetMethod() -> (String, String) {
        var result1 : String = ""
        var result2 : String = ""
        let reachConn : Reachability
        do {
            reachConn = try Reachability.reachabilityForInternetConnection()
            if reachConn.isReachable() {
                result1 = "网络连接：可用"
            } else {
                result1 = "网络连接：不可用"
            }
            
            if reachConn.isReachableViaWiFi() {
                result2 = "连接类型：WiFi"
            } else if reachConn.isReachableViaWWAN() {
                result2 = "连接类型：移动网络"
            } else {
                result2 = "连接类型：没有网络连接"
            }
        } catch {
            print("无法创建网络连接")
            //return
        }
        return (result1, result2)
    }
}