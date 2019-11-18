//
//  PlayerError.swift
//  StatVBL
//
//  Created by Михаил Нечаев on 04/08/2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import Foundation

enum PlayerError: String, Error {
    case NoName = "Отсутствует имя"
    case NoSurname = "Отсутствует фамилия"
    case NoNumber = "Отсутствует номер"
    case InvalidName = "Некорректное имя"
    case ExistingName = "Имя существует"
    case ExistingNumber = "Номер существует"
}
