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
    var playersAdapter: PlayersAdapter { get }
    var statsAdapter: StatsAdapter { get }
    func setupAdapter()
}

final class MatchStatPresenter: MatchStatPresenterDelegate {
    
    let router: MatchStatRouterDelegate
    let playersAdapter = PlayersAdapter()
    let statsAdapter: StatsAdapter

    private weak var view: MatchStatViewDelegate!
    private let storage = Storage()

    
    init(view: MatchStatViewDelegate, router: MatchStatRouterDelegate, matchId: Int) {
        self.view = view
        self.router = router
        self.statsAdapter = StatsAdapter(matchId: matchId)
    }
    
    func setupAdapter() {
        playersAdapter.presenter = self
        statsAdapter.presenter = self
    }

}
