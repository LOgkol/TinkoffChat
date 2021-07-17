//
//  CustomTableViewCell.swift
//  TinkoffChat
//
//  Created by Александр Джегутанов on 08.07.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell, ConversationCellConfiguration{
    
    @IBOutlet weak var imageCell: UIImageView?
    @IBOutlet weak var nameCell: UILabel?
    @IBOutlet weak var messageCell: UILabel?
    @IBOutlet weak var dataCell: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        guard let imageCell = imageCell else { return }
        imageCell.layer.cornerRadius = imageCell.frame.size.width / 2
        imageCell.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    var name: String? = "" {
        didSet {
            self.nameCell?.text = name
        }
    }
    
    var message: String? = "" {
        didSet {
            self.messageCell?.text = message
        }
    }
    
    var online: Bool? {
        didSet{
            if online == false {
                backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                backgroundColor = #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
            }
        }
    }
    
    var hasUnreadMessages: Bool? = false {
        didSet {
            if message == nil {
                message = "No message yet"
                messageCell?.font = UIFont.italicSystemFont(ofSize: 18)
            } else {
                messageCell?.font = hasUnreadMessages ?? true ? UIFont.boldSystemFont(ofSize: 18) : UIFont.systemFont(ofSize: 18)
            }
        }
    }
    
    var image: String? {
        didSet {
            imageCell?.image = UIImage(named: image ?? "placeholderUser")
        }
    }
    
    var date: Date? {
        didSet {
            dataCell?.text = formattedDate(date)
        }
    }
    
    private func formattedDate(_ date: Date?) -> String? {
        guard let date = date else {
            return ""
        }
        
        let dateFormatter = DateFormatter()
        let calendar = Calendar.current
        
        if calendar.isDateInToday(date) {
            dateFormatter.dateFormat = "HH:mm"
        } else {
            dateFormatter.dateFormat = "dd MMM"
        }
        
        return dateFormatter.string(from: date)
    }

}
