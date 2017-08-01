//
//  PhotoView.swift
//  MiaoPersonal
//
//  Created by 苗建浩 on 2017/8/1.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

import UIKit

class PhotoView: UIView {
    var backBtn = UIButton()
    var photoWindow = UIApplication.shared.keyWindow
    var bottomView = UIView()
    
    func photoView(textArr: NSArray) {
        
        backBtn = UIButton.init(frame: CGRect(x:0, y:0, width:screenWidth, height:screenHeight))
        backBtn.backgroundColor = UIColor.init(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.3)
        photoWindow?.addSubview(backBtn)
        
        
        bottomView = UIView.init(frame: CGRect(x:0, y:screenHeight, width:screenWidth, height:130 * DISTENCEH + 10))
        bottomView.backgroundColor = BaseBackColor
        photoWindow?.addSubview(bottomView)
        
        
        //  弹出动画
        UIView.animate(withDuration: 0.3, animations: {
            self.bottomView.transform = self.bottomView.transform.translatedBy(x: 0, y: -self.bottomView.height)
        })
    }
    
    
    func photoHidden() {
        
        UIView.animate(withDuration: 0.2, animations:{
            self.bottomView.transform = self.bottomView.transform.translatedBy(x: 0, y: self.bottomView.height)
            
        }, completion:{(finished:Bool) -> Void in
            self.alpha = 0
            self.backBtn.removeFromSuperview()
        })
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
