//
//  ThemeModel.swift
//  TinkoffChat
//
//  Created by Александр Джегутанов on 12.08.2021.
//

import UIKit

protocol ThemeModel {
    var backgroundColor: UIColor { get }
    var navigationBarStyle: UIBarStyle { get }
    // текст - Имя чата, заголовок чата, имя профиля, описание профиля
    var textColor: UIColor { get }
    
    //таблица с диалогом
    var tableViewBackround: UIColor { get }
    var tableViewImage: UIImage { get }
    
    // обертка текста, собеседника
    var recipientCellBackround: UIColor { get }
    // обертка текста отправителя
    var senderCellBackround: UIColor { get }
    
    //цвет текста в сообщениях собеседника
    var recipientText: UIColor { get }
    //цвет текста отправителя
    var senderText: UIColor { get }
    //цвет текста сообщения список диалогов
    var listText: UIColor { get }
}
