//
//  String.swift
//  StatVBL
//
//  Created by Михаил Нечаев on 04/08/2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import Foundation

extension String {
    func removeAfterDot() -> String {
        if self == "0" {
            return self
        }
        let sub = self.components(separatedBy: ".").last
        if (sub == "0") || (sub == "00") {
            return String(self.dropLast((sub?.count ?? 0) + 1))
        }
        return self
    }
}
