//
//  AppDelegate.swift
//  MiaoPersonal
//
//  Created by 苗建浩 on 2017/7/24.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    let userDefault = UserDefaults.standard

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        openHomeVC(fontStr: "15")
        window?.makeKeyAndVisible()
        
        //  更改字体大小
        NotificationCenter.default.addObserver(self, selector: #selector(changeFont), name: NSNotification.Name(rawValue: "changeF"), object: nil)
        
        return true
    }
    
    //  打开主界面
    func openHomeVC(fontStr: NSString) {
        
        userDefault.set(fontStr, forKey: "fontSize")
        window?.rootViewController = TabBarViewController()
    }
    
    
    func changeFont(obje:Notification) {
        let notiFont = obje.object as! String
        openHomeVC(fontStr: notiFont as NSString)
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

