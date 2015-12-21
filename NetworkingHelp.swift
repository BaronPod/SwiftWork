//
//  NetworkingHelp.swift
//  SwiftWork
//
//  Created by 李嘉 on 15/12/21.
//  Copyright © 2015年 李嘉. All rights reserved.
//

import Foundation
import AFNetworking

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
}