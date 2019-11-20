//
//  GamesPresenter.swift
//  StatVBL
//
//  Created by Angels It on 20.11.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import Foundation

protocol GamesPresenterDelegate {
    var router: GamesRouterDelegate { get }
    var adapter: GamesAdapter { get }
    func setupAdapter()
}

final class GamesPresenter: GamesPresenterDelegate {
    
    let router: GamesRouterDelegate
    let adapter = GamesAdapter()

    private weak var view: GamesViewDelegate!
    
    private let storage = Storage()

    
    init(view: GamesViewDelegate, router: GamesRouterDelegate) {
        self.view = view
        self.router = router
    }
    
    func setupAdapter() {
        adapter.presenter = self
    }

}
