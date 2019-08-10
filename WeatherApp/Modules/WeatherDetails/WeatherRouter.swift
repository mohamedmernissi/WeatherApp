//
//  WeatherRouter.swift
//  WeatherApp
//
//  Created by mmernissi on 09.08.2019.
//  Copyright © 2019 mmernissi. All rights reserved.
//

import Foundation
import UIKit


class WeatherRouter: WeatherPresenterToRouterProtocol {

    static func setupModule() -> WeatherViewController {
        let view = WeatherRouter.mainstoryboard.instantiateViewController(withIdentifier: "WeatherViewController") as! WeatherViewController
        let presenter: WeatherInteractorToPresenterProtocol & WeatherViewToPresenterProtocol = WeatherPresenter()
        let interactor: WeatherPresenterToInteractorProtocol = WeatherInteractor()
        let router:WeatherPresenterToRouterProtocol = WeatherRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
}

