//
//  ChangeViewController.swift
//  MiaoPersonal
//
//  Created by 苗建浩 on 2017/8/1.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

import UIKit

//  更改信息
class ChangeViewController: UIViewController, UITextFieldDelegate{
    
    var backStr = NSString()
    var fieldStr = NSString()
    var newText = NSString()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = backStr as String
        self.view.backgroundColor = BaseBackColor
        self.automaticallyAdjustsScrollViewInsets = false
        let bottomView = UIView.init(frame: CGRect(origin: CGPoint(x:0, y:NAVGATION_ADD_STATUS_HEIGHT + 10),size: CGSize(width:screenWidth,height:45 * DISTENCEH)))
        bottomView.backgroundColor = UIColor.white
        self.view.addSubview(bottomView)
        
        
        let nickLabel = UILabel.init(frame: CGRect(x:10, y:0, width:40 * DISTENCEW, height:45 * DISTENCEH))
        nickLabel.text = "昵称:"
        nickLabel.font = UIFont.systemFont(ofSize: 15 * DISTENCEW)
        nickLabel.textColor = BaseTextColor
        bottomView.addSubview(nickLabel)
        
        
        let nickField = UITextField.init(frame: CGRect(x:nickLabel.right, y:0, width:screenWidth - nickLabel.width - 10, height:45 * DISTENCEH))
        nickField.keyboardType = UIKeyboardType.default
        nickField.backgroundColor = UIColor.white
        nickField.placeholder = fieldStr as String
        nickField.textColor = BaseTextColor
        nickField.delegate = self
        bottomView.addSubview(nickField)
        
        
        let sureBtn = UIButton.init(frame: CGRect(x:20, y:bottomView.bottom + 20, width:screenWidth - 40, height:40 * DISTENCEH))
        sureBtn.backgroundColor = RGB_COLOR(25, 156, 232)
        sureBtn.setTitle("确   定", for: UIControlState.normal)
        sureBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        sureBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15 * DISTENCEW)
        sureBtn.layer.cornerRadius = 3 * DISTENCEH
        sureBtn.addTarget(self, action: #selector(sureBtnClick), for: UIControlEvents.touchUpInside)
        self.view.addSubview(sureBtn)
        
    }
    
    
    //  确定按钮
    func sureBtnClick() {
        self.view.endEditing(true)
        let nickStr = UserDefaults.standard
        if backStr == "修改昵称" {
            nickStr.set(newText, forKey: "nickName")
        }else{
            nickStr.set(newText, forKey: "realName")
        }
        _ = self.navigationController?.popViewController(animated: true)
        
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        newText = (currentText as NSString).replacingCharacters(in: range, with: string) as NSString
        print(newText)
        return true
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //  析构器
    deinit {
        
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
