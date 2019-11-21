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
    var adapter: MatchStatAdapter { get }
    func setupAdapter()
}

final class MatchStatPresenter: MatchStatPresenterDelegate {
    
    let router: MatchStatRouterDelegate
    let adapter = MatchStatAdapter()

    private weak var view: MatchStatViewDelegate!
    
    private let storage = Storage()

    
    init(view: MatchStatViewDelegate, router: MatchStatRouterDelegate) {
        self.view = view
        self.router = router
    }
    
    func setupAdapter() {
        adapter.presenter = self
    }

}
