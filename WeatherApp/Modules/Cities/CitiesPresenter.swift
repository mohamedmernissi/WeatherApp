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
    
    var weatherViewModel : WeatherViewModel?
    
    func startFetchingWeatherForcity(city: String) {
        interactor?.fetchWeather(city: city)
    }
    
    func showDetailsController(navigationController: UINavigationController, weatherModel : WeatherViewModel) {
        router?.pushToDetailsScreen(navigationConroller: navigationController,weatherModel: weatherModel)
    }

}

extension CitiesPresenter: InteractorToPresenterProtocol {

    func weatherFetchedSuccess( weatherModel: WeatherViewModel) {
        view?.showCitiesWeather(weatherModel: weatherModel)
    }
    
    func createViewModelFromModel(weatherModel: WeatherModel) -> WeatherViewModel {
        
        var weatherPrevisions = [WeatherPrevision]()
        if let arrayPrevisions = weatherModel.data.weather{
            for data in arrayPrevisions{
                let weatherPrevision = WeatherPrevision(date : data.date ?? "",maxtempC : data.maxtempC ?? "",mintempC : data.mintempC ?? "")
                weatherPrevisions.append(weatherPrevision)
            }
        }
        
        return WeatherViewModel(city: weatherModel.data.request?[0].query, cityState: weatherModel.data.current_condition?[0].weatherDesc?[0].value, cityDegrees: weatherModel.data.current_condition?[0].temp_C, weatherHumidity: weatherModel.data.current_condition?[0].humidity, weatherWindSpeed: weatherModel.data.current_condition?[0].windspeedKmph, weatherPressure: weatherModel.data.current_condition?[0].pressure, weather: weatherPrevisions)
    }
    
    func weatherFetchFailed(city : String) {
        view?.showError(city: city)
    }
}
