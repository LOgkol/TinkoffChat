//
//  CustomConversationCell.swift
//  TinkoffChat
//
//  Created by Александр Джегутанов on 09.08.2021.
//

import UIKit

class CustomConversationCell: UITableViewCell, MessageCellConfiguration {
    
    @IBOutlet weak var messageLabel: UILabel!
    
    var messageText: String? {
        didSet {
            messageLabel.text = messageText
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
