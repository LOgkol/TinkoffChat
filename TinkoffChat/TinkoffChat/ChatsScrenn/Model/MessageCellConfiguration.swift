//
//  MessageCellConfiguration.swift
//  TinkoffChat
//
//  Created by Александр Джегутанов on 11.07.2021.
//

import Foundation

protocol MessageCellConfiguration {
    var messageText: String? { get set }
}

struct MessageCell: MessageCellConfiguration {
    var messageText: String?
    var whatMessages: Bool
}

var conversationArray = [
    MessageCell(messageText: "1", whatMessages: false),
    MessageCell(messageText: "2", whatMessages: true),
    MessageCell(messageText: "Привет! Знаешь Илона Маска? Это гениальный человек 21 века, его компании продвигают чеовечество на правильный путь! Представляешь, он запускает ракеты в космос и сажает ее на землю, это просто невероятно! А электро автомобили просто покоряют!", whatMessages: false),
    MessageCell(messageText: "Привет! Я обязательно ознакомлюсь с этой личностью и изучу чем занимаются его компании! Все что ты сказал это уже сносит голову! Если честно я не знаю что еще писать, по этому пусть тут будет этот текст для проверки констрейтов моих констрейтов :)", whatMessages: true)
]
