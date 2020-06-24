//
//  CitiesRouter.swift
//  WeatherApp
//
//  Created by mmernissi on 09.08.2019.
//  Copyright © 2019 mmernissi. All rights reserved.
//

import Foundation
struct Weather : Codable {
	let date : String?
	let astronomy : [Astronomy]?
	let maxtempC : String?
	let maxtempF : String?
	let mintempC : String?
	let mintempF : String?
	let avgtempC : String?
	let avgtempF : String?
	let totalSnow_cm : String?
	let sunHour : String?
	let uvIndex : String?
	let hourly : [Hourly]?


}
