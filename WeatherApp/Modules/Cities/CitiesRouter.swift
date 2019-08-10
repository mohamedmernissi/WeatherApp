//
//  CitiesRouter.swift
//  WeatherApp
//
//  Created by mmernissi on 09.08.2019.
//  Copyright © 2019 mmernissi. All rights reserved.
//

import Foundation
import UIKit


class CitiesRouter: PresenterToRouterProtocol {


    static func setupModule() -> CitiesViewController {
        let view = CitiesRouter.mainstoryboard.instantiateViewController(withIdentifier: "CitiesViewController") as! CitiesViewController
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = CitiesPresenter()
        let interactor: PresenterToInteractorProtocol = CitiesInteractor()
        let router:PresenterToRouterProtocol = CitiesRouter()

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
    
    func pushToDetailsScreen(navigationConroller navigationController:UINavigationController,weatherModel : WeatherModel) {
        
        let weatherModule = WeatherRouter.setupModule()
        weatherModule.weatherModel = weatherModel
        navigationController.pushViewController(weatherModule,animated: true)
        
    }
}
