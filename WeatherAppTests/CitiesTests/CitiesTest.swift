//
//  CitiesEntitiesTest.swift
//  WeatherAppTests
//
//  Created by mohamed mernissi on 6/23/20.
//  Copyright © 2020 Mohamed Mernissi. All rights reserved.
//

import XCTest
import Alamofire

class CitiesTest: XCTestCase {
    
    var presenter: CitiesPresenter!
    var interactor: CitiesInteractor!
    var router: CitiesRouter!
    
    override func setUp() {
        interactor = CitiesInteractor()
        router = CitiesRouter()
        presenter = CitiesPresenter()
        presenter.router = router
        presenter.interactor = interactor
    }

    func testThatItRetrievesCars() {
        let testExpectation = expectation(description: #function)
//        let weatherPrevision = WeatherPrevision(date : "20/04/2020",maxtempC : "20",mintempC : "10")
//        let weatthericon = WeatherViewModel(city: "Casablanca", cityState: "Windy", cityDegrees: "20", weatherHumidity: "30", weatherWindSpeed: "100", weatherPressure: "30", weather: [weatherPrevision])
//
        let parameters : Parameters = ["q" : "casablanca","key" : API_KEY,"format" : "json","num_of_days" : "5"]
        AF.request(API_WEATHER,method: .get,parameters: parameters,encoding: URLEncoding(destination: .queryString)).responseJSON { response in
            XCTAssertNotNil(response.data, "No data was downloaded.")
            do {
                let decoder = JSONDecoder()
                // Make sure we downloaded some data.
                let weatherModel = try decoder.decode(WeatherModel.self, from: response.data!)
                if let viewModel = self.presenter?.createViewModelFromModel(weatherModel: weatherModel){
                    XCTAssertEqual(viewModel.city, "casablanca")
                    testExpectation.fulfill()
                }
                else{
                    
                }
            } catch let error {
                print("Error_fetchWeather: ",error.localizedDescription)
            }
        }
        
        interactor.fetchWeather(city: "Casablanca")
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
