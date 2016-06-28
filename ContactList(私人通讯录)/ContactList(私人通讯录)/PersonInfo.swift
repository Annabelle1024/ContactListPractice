//
//  PersonInfo.swift
//  ContactList(私人通讯录)
//
//  Created by Annabelle on 16/6/28.
//  Copyright © 2016年 annabelle. All rights reserved.
//

import UIKit

class PersonInfo: NSObject {
    
    // 模型属性
    var name: String?
    var phoneNo: String?
    var jobTitle: String?

    
    // 重写构造函数
    override init() {
        
    }
    
    // 重载 (字典转模型)
    init(dict: [String : AnyObject]) {
        
        super.init()
        
        setValuesForKeys(dict)
        
    }
    
    
    override func setValue(_ value: AnyObject?, forUndefinedKey key: String) {}
    

}

// FIXME: 错误示例
//        guard let IndexPath = sender as? IndexPath {
//
//
//            vc.completionCallBack = {
//
//                guard let personInfo = vc.personInfo else {
//
//                    return
//
//                }
//
//            // 在 personList 里面插入新的 personInfo 记录
//            self.personList.insert(personInfo, at: 0)
//            self.tableView.reloadData()
//
//        }
//
//            return
//    }
//
//        vc.personInfo = personList[IndexPath.row]
//
//        // 执行完成回调函数时, 刷新当前对应 indexPath 表格的 数据
//        vc.completionCallBack = {
//
//            self.tableView.reloadRows(at: [IndexPath], with: .automatic)
//
//        }

