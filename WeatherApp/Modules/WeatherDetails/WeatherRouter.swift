//
//  WeatherRouter.swift
//  WeatherApp
//
//  Created by mmernissi on 09.08.2019.
//  Copyright © 2019 mmernissi. All rights reserved.
//

import Foundation
import UIKit

protocol WeatherRouterInterface: class {

}

class WeatherRouter: NSObject {

    weak var presenter: WeatherPresenterInterface?

    static func setupModule() -> WeatherViewController {
        let vc = WeatherViewController()
        let interactor = WeatherInteractor()
        let router = WeatherRouter()
        let presenter = WeatherPresenter(interactor: interactor, router: router, view: vc)

        vc.presenter = presenter
        router.presenter = presenter
        interactor.presenter = presenter
        return vc
    }
}

extension WeatherRouter: WeatherRouterInterface {

}

