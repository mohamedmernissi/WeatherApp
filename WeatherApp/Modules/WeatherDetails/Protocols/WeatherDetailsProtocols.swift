//
//  WeatherProtocols.swift
//  WeatherApp
//
//  Created by mohamedmernissi on 09/08/2019.
//  Copyright © 2019 Mohamed Mernissi. All rights reserved.
//

import UIKit

protocol WeatherViewToPresenterProtocol: class{
    
    var view: WeatherPresenterToViewProtocol? {get set}
    var interactor: WeatherPresenterToInteractorProtocol? {get set}
    var router: WeatherPresenterToRouterProtocol? {get set}
}

protocol WeatherPresenterToViewProtocol: class{
    
}

protocol WeatherPresenterToRouterProtocol: class {
    
}

protocol WeatherPresenterToInteractorProtocol: class {
    var presenter:WeatherInteractorToPresenterProtocol? {get set}
}

protocol WeatherInteractorToPresenterProtocol: class {
}
