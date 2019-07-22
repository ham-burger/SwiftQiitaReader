//
//  ItemTableViewCell.swift
//  SwiftQiitaReader
//
//  Created by kudo on 2019/07/22.
//  Copyright © 2019 kudo. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var userImageLabel: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var item: ItemDTO? = nil {
        didSet {
            titleLabel.text = item?.title
            timeLabel.text = item?.updatedAt
            userNameLabel.text = item?.user.name
            tagLabel.text = item?.tags.map { $0.name }.joined(separator: ",")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
