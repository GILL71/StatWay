//
//  MatchStatPresenter.swift
//  StatVBL
//
//  Created by Angels It on 20.11.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import Foundation

protocol MatchStatPresenterDelegate {
    var router: MatchStatRouterDelegate { get }
    var statsAdapter: StatsAdapter { get }
    func setupAdapter()
}

final class MatchStatPresenter: MatchStatPresenterDelegate {
    
    // MARK: - Public properties
    
    let router: MatchStatRouterDelegate
    let statsAdapter: StatsAdapter

    // MARK: - Public properties

    private weak var view: MatchStatViewDelegate!
    private let storage = Storage()

    // MARK: - Initiazlizers
    
    init(view: MatchStatViewDelegate, router: MatchStatRouterDelegate, matchId: Int) {
        self.view = view
        self.router = router
        self.statsAdapter = StatsAdapter(matchId: matchId)
    }
    
    func setupAdapter() {
        statsAdapter.presenter = self
        statsAdapter.beDirectionalLayout = view.layout
    }

}
