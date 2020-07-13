//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by Mohamed Mernissi on 8/8/19.
//  Copyright © 2019 Mohamed Mernissi. All rights reserved.
//

import XCTest
import Alamofire
@testable import WeatherApp

class WeatherAppTests: XCTestCase {
    
    var presenter : CitiesPresenter!
    var decodingFailed = false

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        presenter = CitiesPresenter()
        testWebservice()
    }
    
    func testWebservice(){
        let expectation = XCTestExpectation(description: "Download weathere")
        let parameters : Parameters = ["q" : "casablanca","key" : API_KEY,"format" : "json","num_of_days" : "5"]
        AF.request(API_WEATHER,method: .get,parameters: parameters,encoding: URLEncoding(destination: .queryString)).responseJSON { response in
            XCTAssertNotNil(response.data, "Data nil")
            //debugPrint("response: ",response.result)
            do {
                let decoder = JSONDecoder()
                let weatherModel = try decoder.decode(WeatherModel.self, from: response.data!)
                XCTAssertNotNil(weatherModel, "weatherModel nil")

                if let viewModel = self.presenter?.createViewModelFromModel(weatherModel: weatherModel){
                    //XCTAssertEqual(viewModel.city, "casablanca")
                    //XCTAssertEqual(viewModel.weather?.count, 5)
                    expectation.fulfill()
                }
                else{
                }
            } catch let error {
                self.decodingFailed = true
                //XCTAssertFalse(self.decodingFailed, error.localizedDescription)
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        decodingFailed = false
    }
}
