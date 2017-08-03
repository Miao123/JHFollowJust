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
        
        
        bottomView = UIView.init(frame: CGRect(x:0, y:screenHeight, width:screenWidth, height:126 * DISTENCEH + 10))
        bottomView.backgroundColor = RGB_COLOR(240, 240, 240)
        photoWindow?.addSubview(bottomView)
        
        
        //  弹出动画
        UIView.animate(withDuration: 0.3, animations: {
            self.bottomView.transform = self.bottomView.transform.translatedBy(x: 0, y: -self.bottomView.height)
        })
        
        
        for i in 0..<3 {
            let photoBtn = UIButton()
            photoBtn.frame = CGRect(x:0, y:0, width:screenWidth, height:42 * DISTENCEH)
            if i == 0 {
                photoBtn.top = 0
            }else if i == 1{
                photoBtn.top = 42 * DISTENCEH
            }else if i == 2{
                photoBtn.top = 84 * DISTENCEH + 10
            }
            photoBtn.backgroundColor = UIColor.white
            photoBtn.setTitle(textArr[i] as? String, for: UIControlState.normal)
            photoBtn.setTitleColor(BaseTextColor, for: UIControlState.normal)
            photoBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15 * DISTENCEW)
            photoBtn.tag = 1000 + i
            bottomView.addSubview(photoBtn)
        }
        
        
        let lineView = UIView.init(frame: CGRect(x:0, y:42 * DISTENCEH, width:screenWidth, height:1))
        lineView.backgroundColor = RGB_COLOR(230, 230, 230)
        bottomView.addSubview(lineView)
    }
    
    
    func photoHidden() {
        hiddenView()
    }
    
    
    func hiddenView() {
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
