//
//  PersonalController.swift
//  MiaoPersonal
//
//  Created by 苗建浩 on 2017/8/1.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

import UIKit

//  个人信息
class PersonalController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var textArr = NSArray()
    var informationArr = NSArray()
    var takePhoto = PhotoView()
    var nickStr = NSString()
    var realNameStr = NSString()
    var personalTable = UITableView()
    
    override func viewWillAppear(_ animated: Bool) {
        nickStr = userDefa.object(forKey: "nickName") as! NSString
        realNameStr = userDefa.object(forKey: "realName") as! NSString
        
        if nickStr == "" {
            nickStr = "新用户"
        }
        
        if realNameStr == "" {
            realNameStr = "新用户"
        }
        informationArr = ["哈哈", nickStr, realNameStr]
        personalTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "个人信息"
        self.view.backgroundColor = BaseBackColor
        
        textArr = ["我的头像","我的昵称","真实姓名"]
        
        personalTable = UITableView.init(frame: CGRect(x:0, y:0, width:screenWidth, height:screenHeight), style: UITableViewStyle.plain)
        personalTable.delegate = self
        personalTable.dataSource = self
        personalTable.tableFooterView = UIView()
        personalTable.backgroundColor = BaseBackColor
        self.view.addSubview(personalTable)
    }
    
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 80 * DISTENCEH
        }
        return 40 * DISTENCEH
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "cell"
        var cell: PersonalTableCell? = tableView.dequeueReusableCell(withIdentifier: cellID) as? PersonalTableCell
        if cell == nil {
            cell = PersonalTableCell(style:UITableViewCellStyle.default ,reuseIdentifier: cellID)
        }
        cell?.textLabel?.text = textArr[indexPath.row] as? String
        if #available(iOS 8.2, *) {
            cell?.textLabel?.font = UIFont.systemFont(ofSize: 15 * DISTENCEW, weight: UIFontWeightThin)
        } else {
            // Fallback on earlier versions
        }
        cell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell?.nameLabel.text = informationArr[indexPath.row] as? String
        if indexPath.row == 0 {
            cell?.headImage.isHidden = false
            cell?.nameLabel.isHidden = true
        }else{
            cell?.headImage.isHidden = true
            cell?.nameLabel.isHidden = false
        }
        cell?.textLabel?.textColor = BaseTextColor
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArr.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let changeVC = ChangeViewController()
        
        if indexPath.row == 0 {
            var photoArr = NSArray()
            photoArr = ["从手机选择", "拍照", "取消"]
            takePhoto.photoView(textArr: photoArr)
            takePhoto.backBtn.addTarget(self, action: #selector(btnClick), for: UIControlEvents.touchUpInside)
        }else if indexPath.row == 1 {
            self.navigationController?.pushViewController(changeVC, animated: true)
            changeVC.backStr = "修改昵称"
            changeVC.fieldStr = "请输入昵称"
        }else if indexPath.row == 2 {
            self.navigationController?.pushViewController(changeVC, animated: true)
            changeVC.backStr = "修改名字"
            changeVC.fieldStr = "请输入真实姓名"
            
        }
    }
    
    func btnClick() {
        takePhoto.photoHidden()
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
