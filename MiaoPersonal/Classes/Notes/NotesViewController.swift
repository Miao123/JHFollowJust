//
//  NotesViewController.swift
//  MiaoPersonal
//
//  Created by 苗建浩 on 2017/8/2.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var textArr = [String]()
    var noteTableView = UITableView()
    var noneLabel = UILabel()
    
    
    override func viewWillAppear(_ animated: Bool) {
        textArr = userDefa.object(forKey: "storeNoteArr") as! [String]
        if textArr.count == 0 {
            noData()
        }else{
            noneLabel.isHidden = true
            noteTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "笔记"
        self.view.backgroundColor = UIColor.white
        
        let addBtn = UIButton.init(frame: CGRect(x:0, y:0, width:26, height:26))
        addBtn.setBackgroundImage(UIImage.init(named: "加"), for: UIControlState.normal)
        addBtn.addTarget(self, action: #selector(addBtnClick), for: UIControlEvents.touchUpInside)
        let addBtnItem = UIBarButtonItem.init()
        addBtnItem.customView = addBtn
        self.navigationItem.rightBarButtonItem = addBtnItem
        
        
        noteTableView = UITableView.init(frame: CGRect(x:0, y:0, width:screenWidth, height:screenHeight), style: UITableViewStyle.plain)
        noteTableView.delegate = self
        noteTableView.dataSource = self
        noteTableView.tableFooterView = UIView()
        self.view.addSubview(noteTableView)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45 * DISTENCEH
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "cell"
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style:UITableViewCellStyle.default ,reuseIdentifier: cellID)
        }
        cell.textLabel?.text = textArr[indexPath.row] as String
        if #available(iOS 8.2, *) {
            cell?.textLabel?.font = UIFont.systemFont(ofSize: 15 * DISTENCEW, weight: UIFontWeightThin)
        } else {
            // Fallback on earlier versions
        }
        cell.textLabel?.textColor = BaseTextColor
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newNoteVC = NewNotesController()
        newNoteVC.backNoteStr = textArr[indexPath.row] as NSString
        newNoteVC.indexRow = indexPath.row
        newNoteVC.noteBOOL = true
        self.navigationController?.pushViewController(newNoteVC, animated: true)
    }
    
    
    //    返回编辑类型，滑动删除
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.delete
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //获取数组中要删除的数据
            textArr.remove(at: indexPath.row)
            noteTableView.reloadData()
            userDefa.set(textArr, forKey: "storeNoteArr")
            
            //  在没有数据的时候显示去添加笔记
            textArr = userDefa.object(forKey: "storeNoteArr") as! [String]
            if textArr.count == 0 {
                noData()
            }else{
                noneLabel.isHidden = true
                noteTableView.reloadData()
            }
        }else{
            
        }
    }
    
    
    //    在这里修改删除按钮的文字
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }
    
    
    func noData() {
        noneLabel = UILabel.init(frame: CGRect(x:0, y:0, width:screenWidth, height:screenHeight))
        noneLabel.text = "暂无笔记、去添加"
        noneLabel.textColor = BaseTextColor
        if #available(iOS 8.2, *) {
            noneLabel.font = UIFont.systemFont(ofSize: 15 * DISTENCEW, weight: UIFontWeightThin)
        } else {
            // Fallback on earlier versions
        }
        //        noneLabel.font = UIFont.systemFont(ofSize: 15 * DISTENCEW)
        noneLabel.textAlignment = NSTextAlignment.center
        self.view.addSubview(noneLabel)
    }
    
    
    func addBtnClick() {
        let newNotesVC = NewNotesController()
        self.navigationController?.pushViewController(newNotesVC, animated: true)
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
