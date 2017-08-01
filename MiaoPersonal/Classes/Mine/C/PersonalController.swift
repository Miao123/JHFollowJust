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
    
    var takePhoto = PhotoView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.title = "个人信息"
        self.view.backgroundColor = BaseBackColor
        
        textArr = ["我的头像","我的昵称","我的账号"]
        
        let personalTable = UITableView.init(frame: CGRect(x:0, y:0, width:screenWidth, height:screenHeight), style: UITableViewStyle.plain)
        personalTable.delegate = self
        personalTable.dataSource = self
        personalTable.tableFooterView = UIView()
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
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 15 * DISTENCEW)
        cell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell?.nameLabel.text = "哈哈"
        if indexPath.row == 0 {
            cell?.headImage.isHidden = false
            cell?.nameLabel.isHidden = true
        }else{
            cell?.headImage.isHidden = true
            cell?.nameLabel.isHidden = false
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArr.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            
            takePhoto.photoView(textArr: textArr)
            takePhoto.backBtn.addTarget(self, action: #selector(btnClick), for: UIControlEvents.touchUpInside)
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
