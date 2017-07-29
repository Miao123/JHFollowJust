//
//  MineViewController.swift
//  MiaoPersonal
//
//  Created by 苗建浩 on 2017/7/27.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

import UIKit


class MineViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var textArr = NSArray()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.title = "我的"
        self.view.backgroundColor = BaseBackColor
        self.automaticallyAdjustsScrollViewInsets = false
        
        textArr = ["个人信息","清除缓存","去评价","推荐给好友"]
        
        
        
        let headbotView = UIView.init(frame: CGRect(x:0, y:0, width:screenWidth, height:30 + 50 * DISTENCEH))
        headbotView.backgroundColor = BaseBackColor
        
        
        let headView = UIView.init(frame: CGRect(x:0, y:0, width:screenWidth, height:20 + 50 * DISTENCEH))
        headView.backgroundColor = UIColor.white
        headbotView.addSubview(headView)
        
        
        let headImage = UIImageView.init(frame: CGRect(origin: CGPoint(x:0, y:10),size: CGSize(width:50 * DISTENCEW,height:50 * DISTENCEW)))
        headImage.image = UIImage.init(named: "111")
        headImage.layer.cornerRadius = 25 * DISTENCEW
        headImage.layer.masksToBounds = true
        headImage.center.x = self.view.center.x
        headView.addSubview(headImage)
        
        
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
            cell!.nameLabel.text = textArr[indexPath.row] as? String
        }else if indexPath.section == 1{
            cell!.nameLabel.text = "设置"
        }
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                print("第%d个",indexPath.row)
            }else if indexPath.row == 1 {
                print("第%d个",indexPath.row)
            }else if indexPath.row == 2 {
                print("第%d个",indexPath.row)

            }else if indexPath.row == 3 {
                print("第%d个",indexPath.row)
            }
        }else{
            if indexPath.row == 0 {
                print("第%d个",indexPath.row)
            }
        }
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
