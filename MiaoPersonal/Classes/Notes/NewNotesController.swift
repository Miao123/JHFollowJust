//
//  NewNotesController.swift
//  MiaoPersonal
//
//  Created by 苗建浩 on 2017/8/2.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

import UIKit

class NewNotesController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "新建笔记"
        self.view.backgroundColor = UIColor.white
        
        
        let addBtn = UIButton.init(frame: CGRect(x:0, y:0, width:50, height:44))
        addBtn.setTitle("完成", for: UIControlState.normal)
        addBtn.setTitleColor(BaseTextColor, for: UIControlState.normal)
        addBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15 * DISTENCEW)
        addBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.right
        addBtn.addTarget(self, action: #selector(finishClick), for: UIControlEvents.touchUpInside)
        let addBtnItem = UIBarButtonItem.init()
        addBtnItem.customView = addBtn
        self.navigationItem.rightBarButtonItem = addBtnItem
        
        
        let newTextView = UITextView.init(frame: CGRect(x:0, y:0, width:screenWidth, height:screenHeight))
        newTextView.backgroundColor = UIColor.white
        newTextView.font = UIFont.systemFont(ofSize: 15 * DISTENCEW)
        newTextView.becomeFirstResponder()
        self.view.addSubview(newTextView)
        
    }
    
    
    func finishClick() {
        self.view.endEditing(true)
        _ = self.navigationController?.popViewController(animated: true)
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
