//
//  CustomTableViewCell.swift
//  TinkoffChat
//
//  Created by Александр Джегутанов on 08.07.2021.
//

import UIKit

class CustomConversationsList: UITableViewCell, ConversationCellConfiguration{
    
    @IBOutlet var cellCustomView: [UIView]?
    
    @IBOutlet weak var imageCell: UIImageView?
    @IBOutlet weak var imageName: UILabel? {
        didSet {
            imageName?.isHidden = true
        }
    }
    @IBOutlet weak var checkOnlineView: UIView!
    
    @IBOutlet weak var nameCell: UILabel?
    @IBOutlet weak var messageCell: UILabel?
    @IBOutlet weak var dataCell: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        guard let cellCustomView = cellCustomView else { return }
        guard let imageCell = imageCell else { return }
        
        imageCell.layer.cornerRadius = imageCell.frame.size.width / 2
        
        CustomView.addRadiusWidth(views: cellCustomView, width: 2)
        
    }
    
    var name: String? = "" {
        didSet {
            self.nameCell?.text = name
            nameCell?.textColor = Theme.settingTheme.textColor
        }
    }
    
    var message: String? = "" {
        didSet {
            self.messageCell?.text = message
            messageCell?.textColor = Theme.settingTheme.textColor
        }
    }
    
    var online: Bool? {
        didSet{
            if online == false {
                checkOnlineView.isHidden = true
            } else {
                checkOnlineView.isHidden = false
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
            imageCell?.image = UIImage(named: image ?? "")
        }
    }
    
    var date: Date? {
        didSet {
            dataCell?.text = formattedDate(date)
            dataCell?.textColor = Theme.settingTheme.textColor
        }
    }
    
    func formattedDate(_ date: Date?) -> String? {
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

extension Date {
    
    init?(from: String) {
        
        guard !from.isEmpty else {
            return nil
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        
        guard let date = dateFormatter.date(from: from) else { return nil }
        
        self.init(timeInterval: 0, since: date)
    }
}
