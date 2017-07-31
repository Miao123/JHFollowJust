//
//  TabBarViewController.swift
//  MiaoPersonal
//
//  Created by 苗建浩 on 2017/7/27.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        createMainTabBarChildViewController()
        
    }
    
    
    fileprivate func createMainTabBarChildViewController() {
        tabBarControllerAddChildViewController(HomeViewController(), title: "首页", imageName: "首页-2", selectedImageName: "首页", tag: 0)
        tabBarControllerAddChildViewController(ActivityViewController(), title: "活动", imageName: "活动-2", selectedImageName: "活动", tag: 1)
        tabBarControllerAddChildViewController(MineViewController(), title: "我的", imageName: "我的-2", selectedImageName: "我的", tag: 2)
        
    }
    
    
    fileprivate func tabBarControllerAddChildViewController(_ childView: UIViewController, title: String, imageName: String, selectedImageName: String, tag: Int) {
        
        let vcItem = UITabBarItem(title: title, image: UIImage(named: imageName), selectedImage: UIImage(named: selectedImageName))
        vcItem.tag = tag
        
        childView.tabBarItem = vcItem
        
        let navigationVC = UINavigationController(rootViewController:childView)
        addChildViewController(navigationVC)
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
