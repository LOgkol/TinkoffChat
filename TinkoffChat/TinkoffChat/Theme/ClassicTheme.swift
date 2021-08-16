//
//  ClassicTheme.swift
//  TinkoffChat
//
//  Created by Александр Джегутанов on 12.08.2021.
//

import UIKit

class ClassicTheme: ThemeModel {
    var backgroundColor: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    var navigationBarStyle: UIBarStyle = .default
    // текст - Имя чата, заголовок чата, имя профиля, описание профиля
    var textColor: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    
    var tableViewBackround: UIColor = #colorLiteral(red: 0.9882352941, green: 0.9215686275, blue: 0, alpha: 1)
    var tableViewImage: UIImage = UIImage(named: "logoWhite")!
    
    // обертка текста, собеседника
    var recipientCellBackround: UIColor = #colorLiteral(red: 0.874414444, green: 0.8745647073, blue: 0.8744048476, alpha: 1)
    // обертка текста отправителя
    var senderCellBackround: UIColor = #colorLiteral(red: 0.8643346429, green: 0.9681299329, blue: 0.7728827, alpha: 1)
    
    //цвет текста в сообщениях собеседника
    var recipientText: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    //цвет текста отправителя
    var senderText: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    //цвет текста сообщения список диалогов
    var listText: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
}
