//
//  StatInfoCollectionViewCell.swift
//  StatVBL
//
//  Created by Angels It on 21.11.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import UIKit

final class StatInfoCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var infoLabel: UILabel!
    
    func setup(with num: String) {
        infoLabel.text = num
    }
    
    func setup(with value: ViewStatValue) {
        infoLabel.text = value.rawValue
    }

}
