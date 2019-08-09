/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

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

	enum CodingKeys: String, CodingKey {

		case observation_time = "observation_time"
		case temp_C = "temp_C"
		case temp_F = "temp_F"
		case weatherCode = "weatherCode"
		case weatherIconUrl = "weatherIconUrl"
		case weatherDesc = "weatherDesc"
		case windspeedMiles = "windspeedMiles"
		case windspeedKmph = "windspeedKmph"
		case winddirDegree = "winddirDegree"
		case winddir16Point = "winddir16Point"
		case precipMM = "precipMM"
		case precipInches = "precipInches"
		case humidity = "humidity"
		case visibility = "visibility"
		case visibilityMiles = "visibilityMiles"
		case pressure = "pressure"
		case pressureInches = "pressureInches"
		case cloudcover = "cloudcover"
		case feelsLikeC = "FeelsLikeC"
		case feelsLikeF = "FeelsLikeF"
		case uvIndex = "uvIndex"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		observation_time = try values.decodeIfPresent(String.self, forKey: .observation_time)
		temp_C = try values.decodeIfPresent(String.self, forKey: .temp_C)
		temp_F = try values.decodeIfPresent(String.self, forKey: .temp_F)
		weatherCode = try values.decodeIfPresent(String.self, forKey: .weatherCode)
		weatherIconUrl = try values.decodeIfPresent([WeatherIconUrl].self, forKey: .weatherIconUrl)
		weatherDesc = try values.decodeIfPresent([WeatherDesc].self, forKey: .weatherDesc)
		windspeedMiles = try values.decodeIfPresent(String.self, forKey: .windspeedMiles)
		windspeedKmph = try values.decodeIfPresent(String.self, forKey: .windspeedKmph)
		winddirDegree = try values.decodeIfPresent(String.self, forKey: .winddirDegree)
		winddir16Point = try values.decodeIfPresent(String.self, forKey: .winddir16Point)
		precipMM = try values.decodeIfPresent(String.self, forKey: .precipMM)
		precipInches = try values.decodeIfPresent(String.self, forKey: .precipInches)
		humidity = try values.decodeIfPresent(String.self, forKey: .humidity)
		visibility = try values.decodeIfPresent(String.self, forKey: .visibility)
		visibilityMiles = try values.decodeIfPresent(String.self, forKey: .visibilityMiles)
		pressure = try values.decodeIfPresent(String.self, forKey: .pressure)
		pressureInches = try values.decodeIfPresent(String.self, forKey: .pressureInches)
		cloudcover = try values.decodeIfPresent(String.self, forKey: .cloudcover)
		feelsLikeC = try values.decodeIfPresent(String.self, forKey: .feelsLikeC)
		feelsLikeF = try values.decodeIfPresent(String.self, forKey: .feelsLikeF)
		uvIndex = try values.decodeIfPresent(Int.self, forKey: .uvIndex)
	}

}
