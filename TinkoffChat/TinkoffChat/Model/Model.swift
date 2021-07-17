//
//  DataConversation.swift
//  TinkoffChat
//
//  Created by Александр Джегутанов on 09.07.2021.
//

import UIKit
import Foundation

class ConversationModel: ConversationCellConfiguration {
    var online: Bool?
    var hasUnreadMessages: Bool?
    var name: String?
    var message: String?
    var date: Date?
    var image: String?
    
    init(name: String?, message: String?, date: Date?, online: Bool, hasUnreadMessages: Bool?, image: String?) {
        self.name = name
        self.message = message
        self.date = date
        self.online = online
        self.hasUnreadMessages = hasUnreadMessages
        self.image = image
    }
}




class MessageCell: MessageCellConfiguration {
    var text: String?
}
