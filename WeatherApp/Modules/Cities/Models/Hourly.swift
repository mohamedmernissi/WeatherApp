//
//  CitiesRouter.swift
//  WeatherApp
//
//  Created by mmernissi on 09.08.2019.
//  Copyright © 2019 mmernissi. All rights reserved.
//

import Foundation
struct Hourly : Codable {
	let time : String?
	let tempC : String?
	let tempF : String?
	let windspeedMiles : String?
	let windspeedKmph : String?
	let winddirDegree : String?
	let winddir16Point : String?
	let weatherCode : String?
	let weatherIconUrl : [WeatherIconUrl]?
	let weatherDesc : [WeatherDesc]?
	let precipMM : String?
	let precipInches : String?
	let humidity : String?
	let visibility : String?
	let visibilityMiles : String?
	let pressure : String?
	let pressureInches : String?
	let cloudcover : String?
	let heatIndexC : String?
	let heatIndexF : String?
	let dewPointC : String?
	let dewPointF : String?
	let windChillC : String?
	let windChillF : String?
	let windGustMiles : String?
	let windGustKmph : String?
	let feelsLikeC : String?
	let feelsLikeF : String?
	let chanceofrain : String?
	let chanceofremdry : String?
	let chanceofwindy : String?
	let chanceofovercast : String?
	let chanceofsunshine : String?
	let chanceoffrost : String?
	let chanceofhightemp : String?
	let chanceoffog : String?
	let chanceofsnow : String?
	let chanceofthunder : String?
	let uvIndex : String?

}
