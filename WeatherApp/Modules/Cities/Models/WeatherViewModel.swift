//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by mohamed mernissi on 6/24/20.
//  Copyright © 2020 Mohamed Mernissi. All rights reserved.
//

import Foundation

struct WeatherViewModel {
    
    let city : String?
    let cityState : String?
    let cityDegrees : String?
    let weatherHumidity : String?
    let weatherWindSpeed : String?
    let weatherPressure : String?
    let weather : [WeatherPrevision]?
}


struct WeatherPrevision {

    let date : String?
    let maxtempC : String?
    let mintempC : String?
}
