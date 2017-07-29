//
//  MineTableViewCell.swift
//  MiaoPersonal
//
//  Created by 苗建浩 on 2017/7/28.
//  Copyright © 2017年 苗建浩. All rights reserved.
//

import UIKit

class MineTableViewCell: UITableViewCell {
    var nameLabel = UILabel()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel = UILabel.init(frame: CGRect(x:10, y:0, width:100, height:40 * DISTENCEH))
        self.contentView .addSubview(nameLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
