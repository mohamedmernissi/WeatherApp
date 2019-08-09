//
//  WeatherInteractor.swift
//  WeatherApp
//
//  Created by mmernissi on 09.08.2019.
//  Copyright © 2019 mmernissi. All rights reserved.
//

import Foundation

protocol WeatherInteractorInterface: class {

}

class WeatherInteractor {
    weak var presenter: WeatherPresenterInterface?
}

extension WeatherInteractor: WeatherInteractorInterface {

}
