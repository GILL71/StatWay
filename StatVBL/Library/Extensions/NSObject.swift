//
//  NSObject.swift
//  StatVBL
//
//  Created by Михаил Нечаев on 01/09/2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import Foundation

extension NSObject {
    
    @objc class var nameOfClass: String {
        if let name = NSStringFromClass(self).components(separatedBy: ".").last {
            return name
        }
        return ""
    }
    
}
