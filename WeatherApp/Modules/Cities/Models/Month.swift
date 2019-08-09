/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Month : Codable {
	let index : String?
	let name : String?
	let avgMinTemp : String?
	let avgMinTemp_F : String?
	let absMaxTemp : String?
	let absMaxTemp_F : String?
	let avgDailyRainfall : String?

	enum CodingKeys: String, CodingKey {

		case index = "index"
		case name = "name"
		case avgMinTemp = "avgMinTemp"
		case avgMinTemp_F = "avgMinTemp_F"
		case absMaxTemp = "absMaxTemp"
		case absMaxTemp_F = "absMaxTemp_F"
		case avgDailyRainfall = "avgDailyRainfall"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		index = try values.decodeIfPresent(String.self, forKey: .index)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		avgMinTemp = try values.decodeIfPresent(String.self, forKey: .avgMinTemp)
		avgMinTemp_F = try values.decodeIfPresent(String.self, forKey: .avgMinTemp_F)
		absMaxTemp = try values.decodeIfPresent(String.self, forKey: .absMaxTemp)
		absMaxTemp_F = try values.decodeIfPresent(String.self, forKey: .absMaxTemp_F)
		avgDailyRainfall = try values.decodeIfPresent(String.self, forKey: .avgDailyRainfall)
	}

}