//
//  CitiesRouter.swift
//  WeatherApp
//
//  Created by mmernissi on 09.08.2019.
//  Copyright © 2019 mmernissi. All rights reserved.
//

import Foundation
struct Current_condition : Codable {
	let observation_time : String?
	let temp_C : String?
	let temp_F : String?
	let weatherCode : String?
	let weatherIconUrl : [WeatherIconUrl]?
	let weatherDesc : [WeatherDesc]?
	let windspeedMiles : String?
	let windspeedKmph : String?
	let winddirDegree : String?
	let winddir16Point : String?
	let precipMM : String?
	let precipInches : String?
	let humidity : String?
	let visibility : String?
	let visibilityMiles : String?
	let pressure : String?
	let pressureInches : String?
	let cloudcover : String?
	let feelsLikeC : String?
	let feelsLikeF : String?
	let uvIndex : Int?
}
