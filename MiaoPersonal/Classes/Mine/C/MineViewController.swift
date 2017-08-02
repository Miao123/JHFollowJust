//
//  MineViewController.swift
//  MiaoPersonal
//
//  Created by 苗建浩 on 2017/7/27.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

import UIKit

//  我的
class MineViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var textArr = NSArray()
    var imageArr = NSArray()
    var nickStr = NSString()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.title = "我的"
        self.view.backgroundColor = BaseBackColor
        self.automaticallyAdjustsScrollViewInsets = false
        
        textArr = ["个人信息", "我的二维码", "推荐给好友", "去评价"]
        imageArr = ["个人信息", "二维码", "推荐给好友", "去评价", "设置",]
        
        
        let headbotView = UIView.init(frame: CGRect(x:0, y:0, width:screenWidth, height:30 + 90 * DISTENCEH))
        headbotView.backgroundColor = BaseBackColor
        
        
        let headView = UIView.init(frame: CGRect(x:0, y:0, width:screenWidth, height:headbotView.height - 10))
        headView.backgroundColor = UIColor.white
        headbotView.addSubview(headView)
        
        
        let headImage = UIImageView.init(frame: CGRect(origin: CGPoint(x:12, y:15 * DISTENCEH),size: CGSize(width:60 * DISTENCEW,height:60 * DISTENCEW)))
        headImage.image = UIImage.init(named: "111")
        headImage.centerY = headView.centerY
        headImage.layer.cornerRadius = headImage.height / 2
        headImage.layer.masksToBounds = true
        headView.addSubview(headImage)
        
        
        nickStr = userDefa.object(forKey: "nickName") as! NSString
        if nickStr == "" {
            nickStr = "新用户"
        }
        
        
        let nameLabel = UILabel.init(frame: CGRect(x:headImage.right + 10 * DISTENCEW, y:headImage.top, width:200 * DISTENCEW, height: 30 * DISTENCEH))
        nameLabel.text = nickStr as String
        nameLabel.font = UIFont.systemFont(ofSize: 17 * DISTENCEW)
        nameLabel.textColor = BaseTextColor
        headView.addSubview(nameLabel)
        
        
        let phoneLabel = UILabel.init(frame: CGRect(x:headImage.right + 10 * DISTENCEW, y:nameLabel.bottom, width:200 * DISTENCEW, height: 30 * DISTENCEH))
        phoneLabel.text = "账号:18401569283"
        phoneLabel.font = UIFont.systemFont(ofSize: 15 * DISTENCEW)
        phoneLabel.textColor = BaseTextColor
        headView.addSubview(phoneLabel)
        
        
        let textView = UITextView.init(frame: CGRect(x:10, y:headImage.bottom + 10, width:screenWidth - 20, height:60 * DISTENCEH))
        textView.backgroundColor = UIColor.white
        textView.text = "请写下您的座右铭"
        textView.font = UIFont.systemFont(ofSize: 15 * DISTENCEW)
        textView.textColor = BaseTextColor
        //        headView.addSubview(textView)
        
        
        let mineTable = UITableView.init(frame: CGRect(origin: CGPoint(x:0, y:NAVGATION_ADD_STATUS_HEIGHT),size: CGSize(width:screenWidth,height:screenHeight)), style: UITableViewStyle.plain)
        mineTable.backgroundColor = BaseBackColor
        mineTable.delegate = self
        mineTable.dataSource = self
        mineTable.tableHeaderView = headbotView
        mineTable.tableFooterView = UIView()
        self.view.addSubview(mineTable)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return textArr.count
        }
        if section == 1 {
            return 1
        }
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 10
        }else{
            return 0.00001
        }
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView = UIView.init(frame: CGRect(x:0, y:0, width:screenWidth, height:10))
        headView.backgroundColor = BaseBackColor
        return headView
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40 * DISTENCEH
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellID = "cell"
        var cell: MineTableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellID) as? MineTableViewCell
        if cell == nil {
            cell = MineTableViewCell(style:UITableViewCellStyle.default ,reuseIdentifier: cellID)
        }
        if indexPath.section == 0 {
            cell?.imageView?.image = UIImage.init(named: (imageArr[indexPath.row] as! String)
                )!
            cell?.textLabel?.text = textArr[indexPath.row] as? String
            
        }else if indexPath.section == 1{
            cell?.imageView?.image = UIImage.init(named: "设置")
            cell?.textLabel?.text = "设置"
        }
        cell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 15 * DISTENCEW)
        cell?.textLabel?.textColor = BaseTextColor
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        //        self.hidesBottomBarWhenPushed = true
        //        self.tabBarController?.tabBar.isHidden = true
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let personalVC = PersonalController()
                self.navigationController?.pushViewController(personalVC, animated: true)
                
            }else if indexPath.row == 1 {
                
            }else if indexPath.row == 2 {
                
            }else if indexPath.row == 3 {
                
            }
        }else{
            if indexPath.row == 0 {
                let setUpVC = SetUpViewController()
                self.navigationController?.pushViewController(setUpVC, animated: true)
            }
        }
        //        self.tabBarController?.tabBar.isHidden = false
        //        self.hidesBottomBarWhenPushed = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
