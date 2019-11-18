//
//  MatchError.swift
//  StatVBL
//
//  Created by Михаил Нечаев on 17.11.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import Foundation

enum MatchError: String, Error {
    case NoHomeName = "Отсутствует имя команды хозяев"
    case NoAwayName = "Отсутствует имя соперника"
    case NoHomePoints = "Отсутствуют очки хозяев"
    case NoAwayPoints = "Отсутствуют очки соперника"
    case NoDate = "Укажите дату проведения поединка"
    case NonUniqueId = "Упс, что-то пошло не так. Сохранить данные невозможно :("
}
