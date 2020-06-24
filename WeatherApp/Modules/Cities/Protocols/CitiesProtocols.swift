//
//  CitiesProtocols.swift
//  WeatherApp
//
//  Created by Mohamed Mernissi on 8/9/19.
//  Copyright © 2019 Mohamed Mernissi. All rights reserved.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol: class{
    
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func startFetchingWeatherForcity(city : String)
    func showDetailsController(navigationController:UINavigationController,weatherModel: WeatherViewModel)
    
}

protocol PresenterToViewProtocol: class{
    func showCitiesWeather(weatherModel: WeatherViewModel)
    func showError(city : String)
}

protocol PresenterToRouterProtocol: class {

    func pushToDetailsScreen(navigationConroller:UINavigationController,weatherModel: WeatherViewModel)
}

protocol PresenterToInteractorProtocol: class {
    var presenter:InteractorToPresenterProtocol? {get set}
    func fetchWeather(city : String)
}

protocol InteractorToPresenterProtocol: class {
    func weatherFetchedSuccess(weatherModel: WeatherViewModel)
    func createViewModelFromModel(weatherModel: WeatherModel) -> WeatherViewModel
    func weatherFetchFailed(city : String)
}
