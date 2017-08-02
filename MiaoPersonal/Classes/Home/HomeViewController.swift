//
//  HomeViewController.swift
//  MiaoPersonal
//
//  Created by 苗建浩 on 2017/7/27.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.title = "首页"
        self.view.backgroundColor = UIColor.white
        
        
        //  登录成功
        userDefa.set(true, forKey: "isLogin")
        
        self.titleStr()
        
    }
    
    fileprivate func titleStr(){
        
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
