//
//  Player.swift
//  StatVBL
//
//  Created by Michael Nechaev on 31/10/2018.
//  Copyright © 2018 Michael Nechaev. All rights reserved.
//

import Foundation

final class Player: NSObject {
    
    // MARK: - Public properties

    var id = 0
    var number = ""
    var name = ""
    var surname = ""
    var teamId = 0

    var fullName: String {
        return name + " " + surname
    }
    
    // MARK: - Private properties
    
    private let storage = Storage()
    
    // MARK: - Initializers
    
    convenience init(name: String, surname: String, number: String) throws {
        self.init()
        if name.isEmpty {
            throw PlayerError.NoName
        }
        if surname.isEmpty {
            throw PlayerError.NoSurname
        }
        if number.isEmpty {
            throw PlayerError.NoNumber
        }
        if self.storage.checkPlayer(withName: name, surname: surname) {
            throw PlayerError.ExistingName
        }
        if self.storage.checkPlayer(number: number) {
            throw PlayerError.ExistingNumber
        }
        self.id = self.storage.generatePlayerId()
        self.name = name
        self.surname = surname
        self.number = number
    }
    
    convenience init(playerRealm: PlayerRealm) {
        self.init()
        self.id = playerRealm.id
        self.name = playerRealm.name
        self.surname = playerRealm.surname
        self.number = playerRealm.number
        self.teamId = playerRealm.teamId
    }
    
}


