//
//  UserProfile.swift
//  TinkoffChat
//
//  Created by Александр Джегутанов on 12.08.2021.
//

import UIKit

struct UserProfile {
    static var shared = UserProfile()
    var profilePhoto: UIImage?
    var name = "Alexsander Dzhegutanov"
    var description = "👨‍💻 Пытаюсь кодить под ios \n👨‍🎓 Учусь в Тинькофф ФинТех \n👨‍🏫 Помогаю развиваться другим \nДобавим еще немного текста, чтобы показать что тут действительно помещается достаточно текста"
}
