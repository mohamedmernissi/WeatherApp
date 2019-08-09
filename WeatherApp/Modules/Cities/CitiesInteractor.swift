//
//  CitiesInteractor.swift
//  WeatherApp
//
//  Created by mmernissi on 09.08.2019.
//  Copyright © 2019 mmernissi. All rights reserved.
//

import Foundation

protocol CitiesInteractorInterface: class {

}

class CitiesInteractor {
    weak var presenter: CitiesPresenterInterface?
}

extension CitiesInteractor: CitiesInteractorInterface {

}
