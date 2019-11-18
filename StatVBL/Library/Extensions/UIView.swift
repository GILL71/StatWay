//
//  UIView.swift
//  StatVBL
//
//  Created by Михаил Нечаев on 01/09/2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import UIKit

extension UIView {
        
    func rounded(corners: UIRectCorner) {
        let maskPath1 = UIBezierPath(roundedRect: superview?.bounds ?? bounds,
                                     byRoundingCorners: corners,
                                     cornerRadii: CGSize(width: 8, height: 8))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = superview?.bounds ?? bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }

}
