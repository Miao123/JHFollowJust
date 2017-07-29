//
//  File.swift
//  MiaoPersonal
//
//  Created by 苗建浩 on 2017/7/28.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

import Foundation
import UIKit

let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height

let DISTENCEW = UIScreen.main.bounds.width / 320
let DISTENCEH = UIScreen.main.bounds.height / 568


//  状态栏高度
let STATUS_HEIGHT = 20

//  导航栏高度
let NAVGATION_HEIGHT = 44

//  状态栏加导航栏高度
let NAVGATION_ADD_STATUS_HEIGHT = STATUS_HEIGHT + NAVGATION_HEIGHT

//  tabbar高度
let TABBAR_HEIGHT = 49


var RGB_COLOR: (CGFloat, CGFloat, CGFloat) -> UIColor = {red, green, blue in
    return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1);
}

var BaseBackColor = UIColor.init(colorLiteralRed: 240 / 255, green: 240 / 255, blue: 240 / 255, alpha: 1.0)


