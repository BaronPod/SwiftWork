//
//  JsonEE.swift
//  SwiftWork
//
//  Created by 李嘉 on 15/12/21.
//  Copyright © 2015年 李嘉. All rights reserved.
//

import Foundation
import MJExtension

/**
 Json序列化Base64加密与Json反序列化Base64解密类
 */
public class JsonEE {
    
    /**
     json格式化并Base64加密
     
     - parameter objValue: 对象参数值
     - returns: 已被json格式化并且经过Base64加密的字符串
     */
    public func JsonBase64Encode(objValue : AnyObject?) -> String {
        var tmp : String = ""
        if(objValue != nil) {
            let jsonValue : String = objValue!.mj_JSONString()
            let utf8Value : NSData = jsonValue.dataUsingEncoding(NSUTF8StringEncoding)!
            tmp = utf8Value.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.init(rawValue: 0))
        } else {
            tmp = ""
        }
        return tmp
    }
    
    /**
     json解析并Base64解密
     
     - parameter strValue: base64加密并且Json格式化后的字符串
     - parameter objModel: 对象模型
     - returns: 返回对象类型
     */
    public func jsonBase64Dencode(strValue : String!, objModel : AnyObject!) -> AnyObject {
        let base64Value : NSData = NSData(base64EncodedString: strValue, options: NSDataBase64DecodingOptions.init(rawValue: 0))!
        let decodeValue : String = String(data: base64Value, encoding: NSUTF8StringEncoding)!
        let obj = objModel.mj_setKeyValues(decodeValue)
        return obj
    }
}