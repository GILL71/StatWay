//
//  StatsHeaderView.swift
//  StatVBL
//
//  Created by Angels It on 21.11.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import UIKit

final class StatsHeaderView: UICollectionReusableView {

    // MARK: - Private properties

    private var pointsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = .black
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = "PTS"
        return label
    }()
    
    private var twoPointsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = .black
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = "2P"
        return label
    }()
    
    private var threePointsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = .black
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = "3P"
        return label
    }()
    
    private var freeThrowsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = .black
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = "FT"
        return label
    }()

    private var reboundsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = .black
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = "REB"
        return label
    }()
    
    private var assistsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = .black
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = "AST"
        return label
    }()
    
    private var stealLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = .black
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = "STL"
        return label
    }()
    
    private var blockLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = .black
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = "BLK"
        return label
    }()
    
    private var turnoverLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = .black
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = "TO"
        return label
    }()
    
    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Setup UI

private extension StatsHeaderView {

    func setupLayout() {
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        twoPointsLabel.translatesAutoresizingMaskIntoConstraints = false
        threePointsLabel.translatesAutoresizingMaskIntoConstraints = false
        freeThrowsLabel.translatesAutoresizingMaskIntoConstraints = false
        reboundsLabel.translatesAutoresizingMaskIntoConstraints = false
        assistsLabel.translatesAutoresizingMaskIntoConstraints = false
        stealLabel.translatesAutoresizingMaskIntoConstraints = false
        blockLabel.translatesAutoresizingMaskIntoConstraints = false
        turnoverLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(pointsLabel)
        addSubview(twoPointsLabel)
        addSubview(threePointsLabel)
        addSubview(freeThrowsLabel)
        addSubview(reboundsLabel)
        addSubview(assistsLabel)
        addSubview(stealLabel)
        addSubview(blockLabel)
        addSubview(turnoverLabel)
        
        pointsLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        pointsLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        twoPointsLabel.leftAnchor.constraint(equalTo: pointsLabel.rightAnchor, constant: 8).isActive = true
        twoPointsLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        threePointsLabel.leftAnchor.constraint(equalTo: twoPointsLabel.rightAnchor, constant: 8).isActive = true
        threePointsLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        freeThrowsLabel.leftAnchor.constraint(equalTo: threePointsLabel.rightAnchor, constant: 8).isActive = true
        freeThrowsLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        reboundsLabel.leftAnchor.constraint(equalTo: freeThrowsLabel.rightAnchor, constant: 8).isActive = true
        reboundsLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        assistsLabel.leftAnchor.constraint(equalTo: reboundsLabel.rightAnchor, constant: 8).isActive = true
        assistsLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        stealLabel.leftAnchor.constraint(equalTo: assistsLabel.rightAnchor, constant: 8).isActive = true
        stealLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        blockLabel.leftAnchor.constraint(equalTo: stealLabel.rightAnchor, constant: 8).isActive = true
        blockLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        turnoverLabel.leftAnchor.constraint(equalTo: blockLabel.rightAnchor, constant: 8).isActive = true
        turnoverLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
    }

}
