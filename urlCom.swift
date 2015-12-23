//
//  urlCom.swift
//  SwiftWork
//
//  Created by 李嘉 on 15/12/21.
//  Copyright © 2015年 李嘉. All rights reserved.
//

import Foundation

/**
 url公共操作类
 */
public class urlCom {
    /**
     私有公共全局前置地址
     默认取带有www前缀的地址
     */
    private enum URL : String {
        case _url = "https://ibaron.net.cn/ws/",
        _www = "https://www.ibaron.net.cn/ws/"
    }
    
    /**
     操作方法枚举类型
     */
    enum OperationMethod : String {
        case Add,
        Save,
        Delete,
        DeleteByWhere,
        Update,
        Edit,
        Find,
        FindAll,
        FindByWhere,
        Load,
        LoadAll,
        LoadObjs
    }
    
    /**
     实体服务类型
     */
    enum Services : String {
        case BattachmentService = "BattachmentService.svc/",
        BcommentService = "BcommentService.svc/",
        BconfigService = "BconfigService.svc/",
        BeventsService = "BeventsService.svc/",
        BlogService = "BlogService.svc/",
        BpraiseService = "BpraiseService.svc/",
        BreplyService = "BreplyService.svc/",
        BresourceService = "BresourceService.svc/",
        BrolegroupService = "BrolegroupService.svc/",
        BroleService = "BroleService.svc/",
        BtypeService = "BtypeService.svc/",
        BuserService = "BuserService.svc/",
        V_attachment_eventService = "V_attachment_eventService.svc/",
        V_event_userService = "V_event_userService.svc/",
        V_list_attachmentService = "V_list_attachmentService.svc/",
        V_resourceService = "V_resourceService.svc/",
        V_userConfigService = "V_userConfigService.svc/"
    }
    
    /**
     组合完整URL地址
     
     - parameter url: url地址前置，如：https://localhost/test.svc，只需要传入test.svc前面部分即可
     - parameter services: url服务地址类型，如test.svc这个，只需要传入这种类型即可
     - parameter method: url地址中得方法名称，如Find
     - returns: 完整的URL地址
     */
    public func getURLString(url : String?, service : String, method : String) -> String {
        var tmp : String = "";
        if (url == nil || url == "") {
            tmp = URL._www.rawValue + service + method
        } else {
            tmp = url! + service + method
        }
        return tmp
    }
}