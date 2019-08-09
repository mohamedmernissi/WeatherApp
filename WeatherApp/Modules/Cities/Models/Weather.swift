/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

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

	enum CodingKeys: String, CodingKey {

		case date = "date"
		case astronomy = "astronomy"
		case maxtempC = "maxtempC"
		case maxtempF = "maxtempF"
		case mintempC = "mintempC"
		case mintempF = "mintempF"
		case avgtempC = "avgtempC"
		case avgtempF = "avgtempF"
		case totalSnow_cm = "totalSnow_cm"
		case sunHour = "sunHour"
		case uvIndex = "uvIndex"
		case hourly = "hourly"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		date = try values.decodeIfPresent(String.self, forKey: .date)
		astronomy = try values.decodeIfPresent([Astronomy].self, forKey: .astronomy)
		maxtempC = try values.decodeIfPresent(String.self, forKey: .maxtempC)
		maxtempF = try values.decodeIfPresent(String.self, forKey: .maxtempF)
		mintempC = try values.decodeIfPresent(String.self, forKey: .mintempC)
		mintempF = try values.decodeIfPresent(String.self, forKey: .mintempF)
		avgtempC = try values.decodeIfPresent(String.self, forKey: .avgtempC)
		avgtempF = try values.decodeIfPresent(String.self, forKey: .avgtempF)
		totalSnow_cm = try values.decodeIfPresent(String.self, forKey: .totalSnow_cm)
		sunHour = try values.decodeIfPresent(String.self, forKey: .sunHour)
		uvIndex = try values.decodeIfPresent(String.self, forKey: .uvIndex)
		hourly = try values.decodeIfPresent([Hourly].self, forKey: .hourly)
	}

}