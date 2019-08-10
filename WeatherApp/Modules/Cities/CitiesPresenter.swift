//
//  CitiesPresenter.swift
//  WeatherApp
//
//  Created by mmernissi on 09.08.2019.
//  Copyright © 2019 mmernissi. All rights reserved.
//

import Foundation
import UIKit


class CitiesPresenter : ViewToPresenterProtocol {

    
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?

    
    func startFetchingWeatherForcity(city: String) {
        interactor?.fetchWeather(city: city)
    }
    
    func showDetailsController(navigationController: UINavigationController, weatherModel : WeatherModel) {
        router?.pushToDetailsScreen(navigationConroller: navigationController,weatherModel: weatherModel)
    }

}

extension CitiesPresenter: InteractorToPresenterProtocol {

    func weatherFetchedSuccess( weatherModel: WeatherModel) {
        view?.showCitiesWeather(weatherModel: weatherModel)
    }
    
    func weatherFetchFailed() {
        view?.showError()
    }
}
