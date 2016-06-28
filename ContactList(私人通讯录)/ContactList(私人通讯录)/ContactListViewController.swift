//
//  ContactListViewController.swift
//  ContactList(私人通讯录)
//
//  Created by Annabelle on 16/6/28.
//  Copyright © 2016年 annabelle. All rights reserved.
//

import UIKit

class ContactListViewController: UITableViewController {
    
    // 创建个人数据数组
    var personList = [PersonInfo]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // self.tableView.rowHeight = 80

        loadData { (list) in
            
            // personList 数组一直在 追加 list 的内容
            self.personList += list
            
            // 刷新表格
            self.tableView.reloadData()
            
        }
        
    }
    
    // MARK: - 新建联系人 点击按钮跳转
    @IBAction func addNewContact(_ sender: AnyObject) {
        
        // 跳转到 联系人明细 页面
        performSegue(withIdentifier: "list2detail", sender: nil)
        
        
    }
    
    // MARK: - 跳转方法(传值)
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // 获取目标控制器
        let vc = segue.destinationViewController as! ContactDetailViewController
        
        // 判断是否给 indexPath 传值
        if let IndexPath = sender as? IndexPath {
            
            vc.personInfo = personList[IndexPath.row]
            
            // 执行完成回调函数时, 刷新当前对应 indexPath 表格的 数据
            vc.completionCallBack = {
                
                self.tableView.reloadRows(at: [IndexPath], with: .automatic)
                
            }
        } else {
            
            vc.completionCallBack = {
                
                guard let personInfo = vc.personInfo else {
                    
                    return
                    
                }
                
                // 在 personList 里面插入新的 personInfo 记录
                self.personList.insert(personInfo, at: 0)
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - 表格代理
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 取消选中
        tableView.deselectRow(at: indexPath, animated: true)
        
        // 跳转
        performSegue(withIdentifier: "list2detail", sender: indexPath)
        
    }
    
    // MARK: - 数据源
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return personList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        cell.textLabel?.text = personList[indexPath.row].name
        cell.detailTextLabel?.text = personList[indexPath.row].phoneNo
        
        
        return cell
        
    }
    
    // MARK: - 加载数据
    func loadData(completion: (list : [PersonInfo]) -> ()) -> (){
        
        // 异步加载
        DispatchQueue.global().async { 
            
            // 模拟延时
            Thread.sleep(forTimeInterval: 1.0)
            
            // 创建数据的可变数组
            var arrayM = [PersonInfo]()
            
            // 循环创建 N 个 PersonInfo, 给它设置值, 并将模型添加到数组
            for i in 0..<20 {
                
                let name = "Annabelle - \(i)"
                let phoneNo = "137" + String(format: "%07zd", arc4random_uniform(10000000))
                let jobTitle = "Boss"
                
                // 创建字典
                let dict = ["name" : name, "phoneNo" : phoneNo, "jobTitle" : jobTitle]
                
                // 将字典追加到数组
                arrayM.append(PersonInfo(dict: dict as [String : AnyObject]))
            }
            // 主队列回调
            DispatchQueue.main.async {
                
                completion(list: arrayM)
                
            }
            
            
        }
        
        
        
        
    }

   
}
