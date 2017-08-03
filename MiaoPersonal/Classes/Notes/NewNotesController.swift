//
//  NewNotesController.swift
//  MiaoPersonal
//
//  Created by 苗建浩 on 2017/8/2.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

import UIKit

class NewNotesController: UIViewController, UITextViewDelegate{
    var textArr = [String]()
    var backNoteStr = NSString()
    var noteStr = NSString()
    var newTextView = UITextView()
    let noteDefa = UserDefaults.standard
    var indexRow = Int()
    var noteBOOL = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "新建笔记"
        self.view.backgroundColor = UIColor.white
        
        textArr = userDefa.object(forKey: "storeNoteArr") as! [String]
        
        let addBtn = UIButton.init(frame: CGRect(x:0, y:0, width:50, height:44))
        addBtn.setTitle("完成", for: UIControlState.normal)
        addBtn.setTitleColor(BaseTextColor, for: UIControlState.normal)
        addBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15 * DISTENCEW)
        addBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.right
        addBtn.addTarget(self, action: #selector(finishClick), for: UIControlEvents.touchUpInside)
        let addBtnItem = UIBarButtonItem.init()
        addBtnItem.customView = addBtn
        self.navigationItem.rightBarButtonItem = addBtnItem
        
        
        newTextView = UITextView.init(frame: CGRect(x:0, y:0, width:screenWidth, height:screenHeight))
        newTextView.backgroundColor = UIColor.white
        newTextView.text = backNoteStr as String
        newTextView.font = UIFont.systemFont(ofSize: 15 * DISTENCEW)
        newTextView.becomeFirstResponder()
        self.view.addSubview(newTextView)
        
        
        //  监听textView字体变化
        NotificationCenter.default.addObserver(self, selector: #selector(NewNotesController.textViewChange), name: NSNotification.Name.UITextViewTextDidChange, object: nil)
    }
    
    func textViewChange() {
        noteStr = newTextView.text as NSString
    }
    
    
    func finishClick() {
        self.view.endEditing(true)
        if noteStr.length > 0 {
            if noteBOOL {
                textArr.remove(at: indexRow)
            }
        }
        if noteStr.length > 0 {
            textArr.insert(noteStr as String, at: 0)
        }
        noteDefa.set(textArr, forKey: "storeNoteArr")
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    
    //  析构器
    deinit {
        NotificationCenter.default.removeObserver(self)
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
