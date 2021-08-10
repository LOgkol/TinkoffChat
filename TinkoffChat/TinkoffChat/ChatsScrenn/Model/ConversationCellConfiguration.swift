//
//  ConversationCellConfiguration.swift
//  TinkoffChat
//
//  Created by Александр Джегутанов on 11.07.2021.
//

import Foundation

protocol ConversationCellConfiguration {
    var name: String? { get set }
    var message: String? { get set }
    var date: Date? { get set }
    var online: Bool? { get set }
    var hasUnreadMessages: Bool? { get set }
    var image: String? { get set }
}

struct ConversationModel: ConversationCellConfiguration {
    var online: Bool?
    var hasUnreadMessages: Bool?
    var name: String?
    var message: String?
    var date: Date?
    var image: String?
}

var conversationDateArray = [
    
    // MARK: Online
    [ConversationModel(online: true, hasUnreadMessages: false, name: "Артем", message: "Yamaha r6 very good", date: Date(timeIntervalSinceNow: 0), image: "yamahaR6"),
     ConversationModel(online: true, hasUnreadMessages: false, name: "Арно", message: "Постановка в Алтезу или перекладка в Форд?🤔", date: Date(timeIntervalSinceNow: 0), image: "drift"),
     ConversationModel(online: true, hasUnreadMessages: false, name: "Боря", message: "DRIFT KING", date: Date(timeIntervalSinceNow: 0), image: "DriftSiera"),
     ConversationModel(online: true, hasUnreadMessages: false, name: "Алекс", message: "Hp босса 20%! Держимся ЗА ОРДУ!!!", date: Date(timeIntervalSinceNow: 0), image: "Trall"),
     ConversationModel(online: true, hasUnreadMessages: false, name: "Маша", message: "Ахах, в универе скучно без тебя:(", date: Date(timeIntervalSinceNow: 0), image: "finUniver"),
     ConversationModel(online: true, hasUnreadMessages: false, name: "Ти́моти До́нальд Кук", message: "Happy New Year!", date: Date(from: "10.09.2021 00:47") , image: "TimKyk"),
     ConversationModel(online: true, hasUnreadMessages: false, name: "Костя", message: "Бро, тебе пора искать работу ios dev", date: Date(from: "09.09.2021 00:47"), image: "swift"),
     ConversationModel(online: true, hasUnreadMessages: false, name: "Anonymous", message: nil, date: Date(from: "15.09.1999 00:47"), image: "anonymous"),
     ConversationModel(online: true, hasUnreadMessages: false, name: "Олеся", message: "200 в городе?! Я домой на такси", date: Date(from: "10.01.2001 00:47"), image: "Bmw"),
     ConversationModel(online: true, hasUnreadMessages: false, name: "Multi JOGer", message: "Бро, шашки топ! БОЛЬШЕ ШАШЕК НА ЮТУБ", date: Date(from: "11.04.2010 00:47"), image: "Joger")],
    
    // MARK: History
    [ConversationModel(online: false, hasUnreadMessages: true, name: "Артем", message: "Yamaha r6 very good", date: Date(timeIntervalSinceNow: 0), image: "yamahaR6"),
     ConversationModel(online: false, hasUnreadMessages: true, name: "Арно", message: "Постановка в Алтезу или перекладка в Форд?🤔", date: Date(timeIntervalSinceNow: 0), image: "drift"),
     ConversationModel(online: false, hasUnreadMessages: true, name: "Боря", message: "DRIFT KING", date: Date(timeIntervalSinceNow: 0), image: "DriftSiera"),
     ConversationModel(online: false, hasUnreadMessages: true, name: "Алекс", message: "Hp босса 20%! Держимся ЗА ОРДУ!!!", date: Date(timeIntervalSinceNow: 0), image: "Trall"),
     ConversationModel(online: false, hasUnreadMessages: true, name: "Маша", message: "Ахах, в универе скучно без тебя:(", date: Date(timeIntervalSinceNow: 0), image: "finUniver"),
     ConversationModel(online: false, hasUnreadMessages: true, name: "Ти́моти До́нальд Кук", message: "Happy New Year!", date: nil, image: "TimKyk"),
     ConversationModel(online: false, hasUnreadMessages: true, name: "Костя", message: "Бро, тебе пора искать работу ios dev", date: nil, image: "swift"),
     ConversationModel(online: false, hasUnreadMessages: true, name: "Anonymous", message: nil, date: nil, image: "anonymous"),
     ConversationModel(online: false, hasUnreadMessages: true, name: "Олеся", message: "200 в городе?! Я домой на такси", date: nil, image: "Bmw"),
     ConversationModel(online: false, hasUnreadMessages: true, name: "Multi JOGer", message: "Бро, шашки топ! БОЛЬШЕ ШАШЕК НА ЮТУБ", date: nil, image: "Joger")]
    
]
