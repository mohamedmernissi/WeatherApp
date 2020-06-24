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
        let expectation = XCTestExpectation(description: "Download weather")
        let parameters : Parameters = ["q" : "casablanca","key" : API_KEY,"format" : "json","num_of_days" : "5"]
        AF.request("http://demo8554638.mockable.io/test",method: .get,parameters: nil,encoding: URLEncoding(destination: .queryString)).responseJSON { response in
            XCTAssertNotNil(response.data, "Data nil")
            debugPrint("response: ",response.data)
            do {
                let decoder = JSONDecoder()
                let weatherModel = try decoder.decode(WeatherModel.self, from: response.data!)
                XCTAssertNotNil(weatherModel, "weatherModel nil")

                if let viewModel = self.presenter?.createViewModelFromModel(weatherModel: weatherModel){
                    //XCTAssertEqual(viewModel.city, "casablanca")
                    //XCTAssertEqual(viewModel.weather?.count, 6)
                }
                else{
                }
            } catch let error {
                self.decodingFailed = true
                print("Error_fetchWeather: ",error.localizedDescription)
                XCTAssertFalse(self.decodingFailed, "Decoding failed")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 5.0)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
