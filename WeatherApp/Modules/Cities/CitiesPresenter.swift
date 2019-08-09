//
//  CitiesPresenter.swift
//  WeatherApp
//
//  Created by mmernissi on 09.08.2019.
//  Copyright © 2019 mmernissi. All rights reserved.
//

import Foundation

protocol CitiesPresenterInterface: class {

}

class CitiesPresenter {

    unowned var view: CitiesViewControllerInterface
    let router: CitiesRouterInterface?
    let interactor: CitiesInteractorInterface?

    init(interactor: CitiesInteractorInterface, router: CitiesRouterInterface, view: CitiesViewControllerInterface) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension CitiesPresenter: CitiesPresenterInterface {

}
