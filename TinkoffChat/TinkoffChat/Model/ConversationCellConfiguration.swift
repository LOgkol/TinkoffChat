//
//  ConversationCellConfiguration.swift
//  TinkoffChat
//
//  Created by Александр Джегутанов on 11.07.2021.
//

import Foundation

protocol ConversationCellConfiguration: AnyObject {
    var name: String? { get set }
    var message: String? { get set }
    var date: Date? { get set }
    var online: Bool? { get set }
    var hasUnreadMessages: Bool? { get set }
    var image: String? { get set }
}
