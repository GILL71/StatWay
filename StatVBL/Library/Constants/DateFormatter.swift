//
//  DateFormatter.swift
//  StatVBL
//
//  Created by Михаил Нечаев on 04/08/2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import Foundation

var dateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "MM-dd-yyyy"
    return formatter
}
