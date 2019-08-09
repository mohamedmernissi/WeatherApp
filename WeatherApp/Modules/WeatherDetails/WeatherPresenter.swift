//
//  WeatherPresenter.swift
//  WeatherApp
//
//  Created by mmernissi on 09.08.2019.
//  Copyright © 2019 mmernissi. All rights reserved.
//

import Foundation

protocol WeatherPresenterInterface: class {

}

class WeatherPresenter {

    unowned var view: WeatherViewControllerInterface
    let router: WeatherRouterInterface?
    let interactor: WeatherInteractorInterface?

    init(interactor: WeatherInteractorInterface, router: WeatherRouterInterface, view: WeatherViewControllerInterface) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension WeatherPresenter: WeatherPresenterInterface {

}
