//
//  CitiesRouter.swift
//  WeatherApp
//
//  Created by mmernissi on 09.08.2019.
//  Copyright © 2019 mmernissi. All rights reserved.
//

import Foundation
struct Data : Codable {
	let request : [Request]?
	let current_condition : [Current_condition]?
	let weather : [Weather]?
	let climateAverages : [ClimateAverages]?
    let error : [ErrorApi]?
}
