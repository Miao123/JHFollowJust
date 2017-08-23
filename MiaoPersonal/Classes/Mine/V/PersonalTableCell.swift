//
//  PersonalTableCell.swift
//  MiaoPersonal
//
//  Created by 苗建浩 on 2017/8/1.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

import UIKit

class PersonalTableCell: UITableViewCell {
    var nameLabel = UILabel()
    var headImage = UIImageView()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel = UILabel.init(frame: CGRect(x:screenWidth - 35 - 200 * DISTENCEW, y:0, width:200 * DISTENCEW, height:40 * DISTENCEH))
        if #available(iOS 8.2, *) {
            nameLabel.font = UIFont.systemFont(ofSize: 15 * DISTENCEW, weight: UIFontWeightThin)
        } else {
            // Fallback on earlier versions
        }
        nameLabel.textAlignment = NSTextAlignment.right
        nameLabel.textColor = BaseTextColor
        self.contentView.addSubview(nameLabel)
        
        
        headImage = UIImageView.init(frame: CGRect(x:screenWidth - 50 - 60 * DISTENCEH, y:10 * DISTENCEH, width:60 * DISTENCEH, height:60 * DISTENCEH))
        headImage.image = UIImage.init(named: "111")
        headImage.layer.cornerRadius = 30 * DISTENCEH
        headImage.layer.masksToBounds = true
        self.contentView.addSubview(headImage)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
