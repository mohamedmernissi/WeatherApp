//
//  WeatherPresenter.swift
//  WeatherApp
//
//  Created by mmernissi on 09.08.2019.
//  Copyright © 2019 mmernissi. All rights reserved.
//

import Foundation

class WeatherPresenter : WeatherInteractorToPresenterProtocol , WeatherViewToPresenterProtocol{

    var view: WeatherPresenterToViewProtocol?
    
    var interactor: WeatherPresenterToInteractorProtocol?
    
    var router: WeatherPresenterToRouterProtocol?

}

//extension WeatherPresenter : WeatherInteractorToPresenterProtocol{
//
//}
