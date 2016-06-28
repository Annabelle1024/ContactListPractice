//
//  ContactDetailViewController.swift
//  ContactList(私人通讯录)
//
//  Created by Annabelle on 16/6/28.
//  Copyright © 2016年 annabelle. All rights reserved.
//

import UIKit

class ContactDetailViewController: UITableViewController {
    // 定义 personInfo 属性
    var personInfo: PersonInfo?
    // 定义 完成回调 属性
    var completionCallBack: (()->())?
  
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var phoneNoText: UITextField!

    @IBOutlet weak var jobTitleText: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
     
        if let personInfo = personInfo {
            
            nameText.text = personInfo.name
            phoneNoText.text = personInfo.phoneNo
            jobTitleText.text = personInfo.jobTitle
                        
        }
        
    }
    
    
    // MARK: - 保存个人信息
    @IBAction func save(_ sender: UIBarButtonItem) {
        
        // 如果 personInfo 为nil, 则表示 新建联系人
        if personInfo == nil {
            
            personInfo = PersonInfo()
        }
        
        // 使用 UI 修改 PersonInfo 的属性
        personInfo?.name = nameText.text
        personInfo?.phoneNo = phoneNoText.text
        personInfo?.jobTitle = jobTitleText.text
        
        // 回调 (反向传值) 设置为可选 ? , 因为可能为空,
        completionCallBack?()
        
        // 返回 pop
        _ = self.navigationController?.popViewController(animated: true)
        
        
    }

  
}
