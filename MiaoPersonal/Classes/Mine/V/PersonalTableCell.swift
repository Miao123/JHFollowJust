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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel = UILabel.init(frame: CGRect(x:screenWidth - 35 - 200 * DISTENCEW, y:0, width:200 * DISTENCEW, height:40 * DISTENCEH))
        nameLabel.font = UIFont.systemFont(ofSize: 15 * DISTENCEW)
        nameLabel.textAlignment = NSTextAlignment.right
        self.contentView.addSubview(nameLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
