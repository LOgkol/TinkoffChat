//
//  NightTheme.swift
//  TinkoffChat
//
//  Created by Александр Джегутанов on 13.08.2021.
//

import UIKit

class NightTheme: ThemeModel {
    var backgroundColor: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    var navigationBarStyle: UIBarStyle = .black
    // текст - Имя чата, заголовок чата, имя профиля, описание профиля
    var textColor: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
    var tableViewBackround: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    var tableViewImage: UIImage = UIImage(named: "LogoBlack")!
    
    // обертка текста, собеседника
    var recipientCellBackround: UIColor = #colorLiteral(red: 0.1803680062, green: 0.180406034, blue: 0.1803655922, alpha: 1)
    // обертка текста отправителя
    var senderCellBackround: UIColor = #colorLiteral(red: 0.3607416153, green: 0.3608088493, blue: 0.3607373834, alpha: 1)
    
    //цвет текста в сообщениях собеседника
    var recipientText: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    //цвет текста отправителя
    var senderText: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    //цвет текста сообщения список диалогов
    var listText: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
}

