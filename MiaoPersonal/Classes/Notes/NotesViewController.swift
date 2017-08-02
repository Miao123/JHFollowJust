//
//  NotesViewController.swift
//  MiaoPersonal
//
//  Created by 苗建浩 on 2017/8/2.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var textArr = NSArray()
    var noteTableView = UITableView()
    
    override func viewWillAppear(_ animated: Bool) {
        textArr = userDefa.object(forKey: "storeNoteArr") as! NSArray
        
        if textArr.count == 0 {
            noData()
        }else{
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
        cell.textLabel?.text = textArr[indexPath.row] as? String
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newNoteVC = NewNotesController()
        self.navigationController?.pushViewController(newNoteVC, animated: true)
    }
    
    func noData() {
        let noneLabel = UILabel.init(frame: CGRect(x:0, y:0, width:screenWidth, height:screenHeight))
        noneLabel.text = "暂无笔记、去添加"
        noneLabel.textColor = BaseTextColor
        noneLabel.font = UIFont.systemFont(ofSize: 15 * DISTENCEW)
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
