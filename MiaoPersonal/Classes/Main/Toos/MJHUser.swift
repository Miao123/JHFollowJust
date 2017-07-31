//
//  MJHUser.swift
//  MiaoPersonal
//
//  Created by 苗建浩 on 2017/7/30.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

import UIKit

class MJHUser: NSObject {
    
    func getFont()->NSString {
        let userDefa = UserDefaults.standard
        let fontStr = userDefa.object(forKey: "fontSize")
        
        return fontStr as! NSString
    }
}
