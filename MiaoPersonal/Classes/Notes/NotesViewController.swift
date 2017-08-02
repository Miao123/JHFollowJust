//
//  NotesViewController.swift
//  MiaoPersonal
//
//  Created by 苗建浩 on 2017/8/2.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {
    var textArr = NSArray()
    
    
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
        
        
        if textArr.count == 0 {
            let noneLabel = UILabel.init(frame: CGRect(x:0, y:0, width:screenWidth, height:screenHeight))
            noneLabel.text = "暂无笔记、去添加"
            noneLabel.textColor = BaseTextColor
            noneLabel.font = UIFont.systemFont(ofSize: 15 * DISTENCEW)
            noneLabel.textAlignment = NSTextAlignment.center
            self.view.addSubview(noneLabel)
        }else{
            
        }
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
